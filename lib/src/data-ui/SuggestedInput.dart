import 'dart:async';
import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_network/image_network.dart';
import 'package:medibound_library/src/data-ui/Button.dart';
import 'package:medibound_library/src/data-ui/Input.dart';
import 'package:medibound_library/src/data-ui/Titles.dart';
import 'package:medibound_library/src/schemas/User.dart';

class MbSuggestedSearch extends StatefulWidget {
  final String hintText;
  final String labelText;
  final String? initialValue;
  final String? shownValue;
  final String? suggestionButtonText;
  final void Function(MbRoledUser)? suggestionButtonPress;
  final String type;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<Map<String, dynamic>> onSelected;
  final FutureOr<List<MbRoledUser>?>? Function(String, List<String>)? searchCallback;
  final List<String> excludedValues;
  final bool enabled; // Added enabled parameter
  final bool isSearch; // New parameter to choose between MbInput and MbSearch

  MbSuggestedSearch({
    required this.hintText,
    required this.labelText,
    this.initialValue,
    this.shownValue,
    this.onChanged,
    this.onSaved,
    this.searchCallback,
    this.suggestionButtonText,
    this.suggestionButtonPress,
    required this.onSelected,
    required this.excludedValues,
    this.enabled = true, // Default enabled to true
    this.isSearch = false,
    this.type = "user", // Default isSearch to false
  });

  @override
  _MbSuggestedSearchState createState() => _MbSuggestedSearchState();
}

class _MbSuggestedSearchState extends State<MbSuggestedSearch> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<Map<String, dynamic>> _suggestions = [];
  String? _selectedName;
  String? _selectedPictureUrl;
  bool _isDisabled = false;

   Future<List<MbRoledUser>> _fetchUsersSuggestions(String query, List<String> excludedValues) async {
    if (query.isEmpty) {
      return [];
    }

    print('Fetching suggestions for query: $query');

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isGreaterThanOrEqualTo: query)
        .where('email', isLessThanOrEqualTo: query + '\uf8ff')
        .get();

    List<MbRoledUser> suggestions = querySnapshot.docs
        .where((doc) => excludedValues.contains(doc['email']))
        .map((doc) {
      return MbRoledUser.fromJsonStatic(doc.data() as Map<String, dynamic>, 'invited');
    }).toList();
    print('Suggestions fetched: $suggestions');

    return suggestions;
  }

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && !_isDisabled) {
        _controller.clear();
      }
    });
    _isDisabled = !widget.enabled;
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _resetInput() {
    setState(() {
      _controller.clear();
      _selectedName = null;
      _selectedPictureUrl = null;
      _isDisabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case 'user':
        return TypeAheadField<MbRoledUser>(
          suggestionsCallback: (search) => widget.searchCallback!(search, widget.excludedValues),
          builder: (context, controller, focusNode) {
            return MbInput(
              hintText: widget.hintText,
              labelText: widget.labelText,
              icon: FontAwesomeIcons.search,
              focusNode: focusNode,
              controller: controller,
              enabled: !_isDisabled,
              isSmall: widget.isSearch,
            );
          },
          itemBuilder: (context, user) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(children: [
                ImageNetwork(image: user.pictureUrl!, height: 35, width: 35, borderRadius: BorderRadius.circular(5),),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  MbTitle4(text: user.givenNames[0] + " " + user.familyName),
                  MbSubheading2(text: user.email)
                ],),
                Spacer(),
                (widget.suggestionButtonText != null && widget.suggestionButtonPress != null) ? MbTextButton(text: widget.suggestionButtonText!, onPressed: () => null,) : SizedBox(height: 0)

              ],),
            );
          },
          onSelected: (user) {
            widget.suggestionButtonPress!(user);
          },
        );
      default:
        return SizedBox(height: 10);
    }
  }
}
