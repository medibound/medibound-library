import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image/image.dart' as img;
import 'package:medibound_library/src/schemas/User.dart';

class MbOrganization {
  String? id;
  String type;
  String name;
  String email;
  String website;
  String privacyPolicy;
  String address;
  List<MbRoledUser> members;
  List<String>? membersIds;
  String? pictureUrl;
  Color? color;

  MbOrganization({
    this.id,
    required this.type,
    required this.name,
    required this.email,
    required this.website,
    required this.privacyPolicy,
    required this.address,
    required this.members,
    this.pictureUrl,
    this.color,
  }) {
    membersIds = members.map((member) => member.id!).toList();
  }

  Future<void> create({
    Uint8List? imageData,
  }) async {
    // Ensure required values are set
    this.pictureUrl = "";
    this.color = Color(0xFFFFFF);

    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('handleResource');

    final response = await callable.call(<String, dynamic>{
      'type': 'organization',
      'data': toJson("create"),
      'imageData': imageData,
    });
  }

  Future<void> update({
    Uint8List? imageData,
    String? id,
    String? type,
    String? name,
    String? email,
    String? website,
    String? privacyPolicy,
    String? address,
    List<MbRoledUser>? members,
    String? pictureUrl,
    Color? color,
  }) async {
    this.id = id ?? this.id;

    if (this.id == null) {
      throw Exception("Id is required to update an organization.");
    }

    this.type = type ?? this.type;
    this.name = name ?? this.name;
    this.email = email ?? this.email;
    this.website = website ?? this.website;
    this.privacyPolicy = privacyPolicy ?? this.privacyPolicy;
    this.address = address ?? this.address;
    this.members = members ?? this.members;
    this.pictureUrl = pictureUrl ?? this.pictureUrl;
    this.color = color ?? this.color;

    this.membersIds = this.members.map((member) => member.id!).toList();

    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('handleResource');

    final response = await callable.call(<String, dynamic>{
      'type': 'organization',
      'data': toJson("update"),
      'imageData': imageData,
    });
  }

  Future<void> delete({
    String? id,
  }) async {
    this.id = id ?? this.id;

    if (this.id == null) {
      throw Exception("Id is required to delete an organization.");
    }

    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('handleResource');

    final response = await callable.call(<String, dynamic>{
      'type': 'organization',
      'data': toJson("delete"),
    });
  }

  static Future<MbOrganization> getStatic({
    required String id,
  }) async {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('organizations')
        .doc(id)
        .get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data() as Map<String, dynamic>;
      try {
        var url = await FirebaseStorage.instance
            .ref()
            .child('orgs-profile/$id/profile.jpg')
            .getDownloadURL();
        MbOrganization org = await MbOrganization.fromJsonStatic(data);
        org.pictureUrl = url;
        return org;
      } catch (e) {
        // Handle error appropriately, e.g., log it or provide a default picture URL
        print('Error fetching organization profile picture: $e');
        MbOrganization org = await MbOrganization.fromJsonStatic(data);
        org.pictureUrl = ''; // or set to a default URL if preferred
        return org;
      }
    } else {
      throw Exception("Organization with ID $id not found.");
    }
  }


  static Future<MbOrganization> fromJsonStatic(Map<String, dynamic> json) async {
    if (json['id'] == null ||
        json['type'] == null ||
        json['name'] == null ||
        json['email'] == null ||
        json['website'] == null ||
        json['privacyPolicy'] == null ||
        json['address'] == null ||
        json['members'] == null ||
        json['membersIds'] == null) {
      throw Exception('fromJsonStatic: JSON is missing required fields');
    }

    List<MbRoledUser> membersList = [];
    try {
      membersList = await Future.wait((json['members'] as List<dynamic>).map((e) async {
        return await MbRoledUser.getStatic(id: e['userId'], role: e['role']);
      }).toList());
    } catch (e) {
      throw Exception('fromJsonStatic: Error parsing members field: $e');
    }

    Color? color;
    print(json['color']);
    try {
      color = json['color'] != null
          ? Color(int.parse(json['color'].substring(1), radix: 16))
          : null;
    } catch (e) {
      print('fromJsonStatic: Error parsing color field: $e');
    }

    return MbOrganization(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      email: json['email'],
      website: json['website'],
      privacyPolicy: json['privacyPolicy'],
      address: json['address'][0],
      members: membersList,
      pictureUrl: json['pictureUrl'],
      color: color,
    )..membersIds = List<String>.from(json['membersIds']);
  }


  Map<String, dynamic> toJson(String? action) {
    if (color == null) {
      color = Color(0xFFFFFF);
    }
    if (pictureUrl == null) {
      pictureUrl = "";
    }
    return {
      if (action != null) 'action': action,
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (website != null) 'website': website,
      if (privacyPolicy != null) 'privacyPolicy': privacyPolicy,
      if (address != null) 'address': [address],
      if (members != null) 'members': members.map((e) => {'userId': e.id, 'role': e.role}).toList(),
      if (membersIds != null) 'membersIds': membersIds,
      if (pictureUrl != null) 'pictureUrl': pictureUrl,
      if (color != null)
        'color': '#${color!.value.toRadixString(16).padLeft(8, '0')}',
    };
  }
}
