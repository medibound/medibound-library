import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Represents a user in the MediBound system.
class MbUser {
  /// The unique identifier for the user.
  String? id;

  /// The family name of the user.
  String familyName;

  /// The given names of the user.
  List<String> givenNames;

  /// The email address of the user.
  String email;

  /// The gender of the user.
  String gender;

  /// The birth date of the user.
  String birthDate;

  /// The type of user.
  String userType;

  /// The URL of the user's picture (optional).
  String? pictureUrl;

  /// The color associated with the user (optional).
  Color? color;

  /// Creates an instance of [MbUser].
  MbUser({
    this.id,
    required this.familyName,
    required this.givenNames,
    required this.email,
    required this.gender,
    required this.birthDate,
    required this.userType,
    this.pictureUrl,
    this.color,
  });

  /// Creates a copy of the [MbUser] with the given fields replaced with new values.
  MbUser copyWith({
    String? id,
    String? familyName,
    List<String>? givenNames,
    String? email,
    String? gender,
    String? birthDate,
    String? userType,
    String? pictureUrl,
    Color? color,
  }) {
    return MbUser(
      id: id ?? this.id,
      familyName: familyName ?? this.familyName,
      givenNames: givenNames ?? this.givenNames,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      userType: userType ?? this.userType,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      color: color ?? this.color,
    );
  }

  /// Creates a new user with the provided authentication and password.
  ///
  /// [auth] - The Firebase authentication instance.
  /// [password] - The password for the new user.
  /// [imageData] - The image data for the user's profile picture (optional).
  Future<void> create({
    required FirebaseAuth auth,
    required String password,
    Uint8List? imageData,
  }) async {
    final result = await auth.createUserWithEmailAndPassword(email: email, password: password);

    this.pictureUrl = "";
    this.color = Color(0xFFFFFF);

    this.id = result.user?.uid;

    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('handleResource');
    print(toJson("create"));
    await callable.call(<String, dynamic>{
      'type': 'user',
      'data': toJson("create"),
      'imageData': imageData,
    });
  }

  /// Updates the user's information.
  ///
  /// [imageData] - The image data for the user's profile picture (optional).
  /// [id] - The unique identifier for the user (optional).
  /// [familyName] - The family name of the user (optional).
  /// [givenNames] - The given names of the user (optional).
  /// [email] - The email address of the user (optional).
  /// [gender] - The gender of the user (optional).
  /// [birthDate] - The birth date of the user (optional).
  /// [userType] - The type of user (optional).
  /// [pictureUrl] - The URL of the user's picture (optional).
  /// [color] - The color associated with the user (optional).
  Future<void> update({
    Uint8List? imageData,
    String? id,
    String? familyName,
    List<String>? givenNames,
    String? email,
    String? gender,
    String? birthDate,
    String? userType,
    String? pictureUrl,
    Color? color,
  }) async {
    this.id = id ?? this.id;

    if (this.id == null) {
      throw Exception("Id is required to update a user.");
    }

    await get(id: this.id);

    this.familyName = familyName ?? this.familyName;
    this.givenNames = givenNames ?? this.givenNames;
    this.email = email ?? this.email;
    this.gender = gender ?? this.gender;
    this.birthDate = birthDate ?? this.birthDate;
    this.userType = userType ?? this.userType;
    this.pictureUrl = pictureUrl ?? this.pictureUrl;
    this.color = color ?? this.color;

    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('handleResource');

    await callable.call(<String, dynamic>{
      'type': 'user',
      'data': toJson("update"),
      'imageData': imageData,
    });

    // Update Firestore document
    await FirebaseFirestore.instance
        .collection('users')
        .doc(this.id)
        .update(toJson("update"));
  }

  /// Deletes the user with the provided ID.
  ///
  /// [id] - The unique identifier for the user (optional).
  Future<void> delete({
    String? id,
  }) async {
    this.id = id ?? this.id;

    if (this.id == null) {
      throw Exception("Id is required to delete a user.");
    }

    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('handleResource');

    await callable.call(<String, dynamic>{
      'type': 'user',
      'data': toJson("delete"),
    });
  }

  /// Logs in the user with the provided email and password.
  ///
  /// [auth] - The Firebase authentication instance.
  /// [email] - The email address of the user.
  /// [password] - The password for the user.
  static Future<MbUser> login({
    required FirebaseAuth auth,
    required String email,
    required String password,
  }) async {
    final result = await auth
        .signInWithEmailAndPassword(email: email, password: password);

    final docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(result.user!.uid)
        .get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data() as Map<String, dynamic>;
      return fromJsonStatic(data);
    } else {
      throw Exception("User with ID ${result.user!.uid} not found.");
    }
  }

  /// Fetches the user with the provided ID.
  ///
  /// [id] - The unique identifier for the user.
  static Future<MbUser> getStatic({
    required String id,
  }) async {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data() as Map<String, dynamic>;
      try {
        var url = await FirebaseStorage.instance
            .ref()
            .child('user-profile/$id/profile.jpg')
            .getDownloadURL();
        MbUser user = MbUser.fromJsonStatic(data);
        user.pictureUrl = url;
        return user;
      } catch (e) {
        // Handle error appropriately, e.g., log it or provide a default picture URL
        print('Error fetching user profile picture: $e');
        MbUser user = MbUser.fromJsonStatic(data);
        user.pictureUrl = ''; // or set to a default URL if preferred
        return user;
      }
    } else {
      throw Exception("User with ID $id not found.");
    }
  }

  /// Fetches the user with the provided ID.
  ///
  /// [id] - The unique identifier for the user (optional).
  Future<void> get({
    String? id,
  }) async {
    this.id = id ?? this.id;

    if (this.id == null) {
      throw Exception("Id is required to get a user.");
    }

    final docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(this.id)
        .get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data() as Map<String, dynamic>;
      fromJson(data);
    } else {
      throw Exception("User with ID $id not found.");
    }
  }

  /// Creates an [MbUser] instance from a JSON object.
  ///
  /// [json] - The JSON object representing the user.
  static MbUser fromJsonStatic(Map<String, dynamic> json) {
    return MbUser(
      id: json['id'],
      familyName: json['familyName'],
      givenNames: List<String>.from(json['givenNames'] ?? []),
      email: json['email'],
      gender: json['gender'],
      birthDate: json['birthDate'],
      userType: json['userType'],
      pictureUrl: json['pictureUrl'],
      color: json['color'] != null
          ? Color(int.parse(json['color'].substring(1), radix: 16))
          : null,
    );
  }

  /// Updates the [MbUser] instance with data from a JSON object.
  ///
  /// [json] - The JSON object representing the user.
  void fromJson(Map<String, dynamic> json) {
    id = json['id'];
    familyName = json['familyName'];
    givenNames = List<String>.from(json['givenNames'] ?? []);
    email = json['email'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    userType = json['userType'];
    pictureUrl = json['pictureUrl'];
    color = json['color'] != null
        ? Color(int.parse(json['color'].substring(1), radix: 16))
        : null;
  }

  /// Converts the [MbUser] instance to a JSON object.
  ///
  /// [action] - The action being performed (optional).
  Map<String, dynamic> toJson(String? action) {
    return {
      if (action != null) 'action': action,
      if (id != null) 'id': id,
      if (familyName != null) 'familyName': familyName,
      if (givenNames != null) 'givenNames': givenNames,
      if (email != null) 'email': email,
      if (gender != null) 'gender': gender,
      if (birthDate != null) 'birthDate': birthDate,
      if (userType != null) 'userType': userType,
      if (pictureUrl != null) 'pictureUrl': pictureUrl,
      if (color != null)
        'color': '#${color!.value.toRadixString(16).padLeft(8, '0')}',
    };
  }
}

class MbRoledUser extends MbUser {
  String role;

  MbRoledUser({
    required MbUser user,
    required this.role,
  }) : super(
          id: user.id,
          familyName: user.familyName,
          givenNames: user.givenNames,
          email: user.email,
          gender: user.gender,
          birthDate: user.birthDate,
          userType: user.userType,
          pictureUrl: user.pictureUrl,
          color: user.color,
        );

  static Future<MbRoledUser> getStatic({
    required String id,
    required String role,
  }) async {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data() as Map<String, dynamic>;
      data['role'] = role;
      try {
        var url = await FirebaseStorage.instance
            .ref()
            .child('user-profile/$id/profile.jpg')
            .getDownloadURL();
        MbRoledUser user = MbRoledUser.fromJsonStatic(data, role);
        user.pictureUrl = url;
        return user;
      } catch (e) {
        // Handle error appropriately, e.g., log it or provide a default picture URL
        print('Error fetching user profile picture: $e');
        MbRoledUser user = MbRoledUser.fromJsonStatic(data, role);
        user.pictureUrl = ''; // or set to a default URL if preferred
        return user;
      }
    } else {
      throw Exception("User with ID $id not found.");
    }
  }


  static MbRoledUser fromJsonStatic(Map<String, dynamic> json, String role) {
    final user = MbUser.fromJsonStatic(json);
    return MbRoledUser(
      user: user,
      role: role,
    );
  }

}