import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_network/image_network.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:medibound_library/src/res/Functions.dart';
import 'package:medibound_library/src/types/UnitType.dart';

class MbDropdown extends StatefulWidget {
  final String hintText;
  final String labelText;
  final Map<String, Map<String, dynamic>>? codes;
  final String? initialValue;
  final IconData? icon;
  final ValueChanged<String?>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final Stream<Map<String, Map<String, dynamic>>>? stream;
  final bool required;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final bool enabled;
  final bool enableFilter;
  final bool sorted;
  final bool description;
  final bool isSmall;

  const MbDropdown({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.codes,
    this.initialValue = "",
    this.height,
    this.enableFilter = false,
    this.description = false,
    this.icon,
    this.required = false,
    this.onChanged,
    this.onSaved,
    this.fontSize,
    this.stream,
    this.padding,
    this.enabled = true,
    this.sorted = false,
    this.isSmall = false,
  }) : super(key: key);

  @override
  _MbDropdownState createState() => _MbDropdownState();
}

class _MbDropdownState extends State<MbDropdown> {
  FocusNode _focusNode = FocusNode();
  bool loading = false;
  String? selectedItem;
  Map<String, Map<String, dynamic>>? fetchedItems;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {}); // Rebuild the widget when the focus state changes
    });
    if (widget.initialValue != "") {
      selectedItem = widget.initialValue;
    }
  }

  @override
  void didUpdateWidget(MbDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      setState(() {
        selectedItem = widget.initialValue;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  List<DropdownMenuEntry<String>> buildDropdownMenuEntries(
      Map<String, Map<String, dynamic>> nestedItems) {
    return nestedItems.entries.expand((category) {
      // Create a list starting with the category header
      List<DropdownMenuEntry<String>> entries = [
        DropdownMenuEntry<String>(
          value: category.key,
          label: category.key,
          enabled: false,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.grey.withOpacity(0.2),
            ),
          ),
        ),
      ];

      // Add the items under this category
      entries.addAll(category.value.keys.map((key) {
        return DropdownMenuEntry<String>(
          value: key,
          label: category.value[key]['name'],
          labelWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    category.value[key]['name'],
                    style: TextStyle(height: 1.2),
                  ),
                  SizedBox(
                    width: 5,
                    height: 20,
                  ),
                  category.value[key]['unit'] != null
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2.5),
                          decoration: BoxDecoration(
                              color:
                                  MbColors(context).surface.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            (category.value[key]['unit']! as UnitType).code,
                            style: TextStyle(height: 1, fontSize: 12),
                          ),
                        )
                      : SizedBox(width: 0),
                ],
              ),
              widget.description
                  ? Text(category.value[key]['description'],
                      style: TextStyle(
                          height: 1, fontSize: 12, color: Colors.grey))
                  : SizedBox(height: 0)
            ],
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            ),
          ),
          leadingIcon: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: MbColors(context).surface.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(50)),
              child:
                  Center(child: FaIcon(category.value[key]['icon'], size: 14))),
        );
      }).toList());

      return entries;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    bool isFocused = _focusNode.hasFocus && widget.enabled;
    Color borderColor = isFocused
        ? MbColors(context).secondary
        : MbColors(context).onBackground.withOpacity(0.1);
    Color labelColor =
        isFocused ? MbColors(context).secondary : MbColors(context).onPrimary;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: widget.enabled
                ? MbColors(context).greyGreen.withOpacity(0.05)
                : MbColors(context).background.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(1, 1),
          ),
          BoxShadow(
            color: MbColors(context).background.withOpacity(0.05),
            offset: Offset(-1, -1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            height: widget.isSmall ? 40 : 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: GradientBoxBorder(
                gradient: LinearGradient(
                  colors: [
                    borderColor,
                    borderColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                width: 1,
              ),
              color: !widget.enabled
                  ? MbColors(context).surface.withOpacity(0.01)
                  : (isFocused
                      ? MbColors(context).background.withOpacity(0.4)
                      : MbColors(context).surface.withOpacity(0.05)),
            ),
            child: StreamBuilder<Map<String, Map<String, dynamic>>>(
                stream: widget.stream,
                builder: (context, snapshot) {
                  if (widget.stream != null) {
                    if (fetchedItems == null && snapshot.data == null) {
                    } else {
                      if (fetchedItems != snapshot.data!) {
                        fetchedItems = snapshot.data!;
                      }
                    }
                  }
                  return DropdownMenu<String>(
                    enableFilter: widget.enableFilter,
                    expandedInsets: EdgeInsets.all(0),
                    menuHeight: widget.height,
                    hintText: widget.hintText,
                    initialSelection: selectedItem,
                    onSelected: (value) {
                      setState(() {
                        selectedItem = value;
                        //print(selectedItem);
                      });
                      if (widget.onChanged != null) {
                        widget.onChanged!(value);
                      }
                    },
                    menuStyle: MenuStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          MbColors(context).onBackground),
                      elevation: MaterialStateProperty.all(4),
                      surfaceTintColor: MaterialStateProperty.all(Colors.white),
                    ),
                    enableSearch: true,
                    dropdownMenuEntries: (widget.stream != null)
                        ? (fetchedItems == null
                            ? [
                                DropdownMenuEntry<String>(
                                  value: "Loading",
                                  label: "Loading...",
                                  enabled: false,
                                )
                              ]
                            : fetchedItems!.values.map((item) {
                                return DropdownMenuEntry<String>(
                                  value: item['id'],
                                  label: item['name'],
                                  labelWidget: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            item['name'],
                                            style: TextStyle(height: 1.2),
                                          ),
                                        ],
                                      ),
                                      widget.description
                                          ? Text(item['description'],
                                              style: TextStyle(
                                                  height: 1,
                                                  fontSize: 12,
                                                  color: Colors.grey))
                                          : SizedBox(height: 0)
                                    ],
                                  ),
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 15),
                                    ),
                                  ),
                                  leadingIcon: Container(
                                      width: 25,
                                      height: 25,
                                      child: ImageNetwork(
                                          borderRadius:
                                              BorderRadius.circular(2.5),
                                          image: item['pictureUrl'],
                                          height: 25,
                                          width: 25)),
                                );
                              }).toList())
                        : (widget.sorted
                            ? buildDropdownMenuEntries(widget.codes!)
                            : widget.codes!.keys.map((key) {
                                return DropdownMenuEntry<String>(
                                  value: key,
                                  label: widget.codes![key]!['name'],
                                  labelWidget: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            widget.codes![key]!['name'],
                                            style: TextStyle(height: 1.2),
                                          ),
                                          SizedBox(
                                            width: 5,
                                            height: 20,
                                          ),
                                          (widget.codes![key]!['unit'] !=
                                                      null &&
                                                  widget.codes![key]!['unit'] !=
                                                      '')
                                              ? Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 2.5),
                                                  decoration: BoxDecoration(
                                                      color: MbColors(context)
                                                          .surface
                                                          .withOpacity(0.05),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  child: Text(
                                                    (widget.codes![key]![
                                                        'unit']! as UnitType).code,
                                                    style: TextStyle(
                                                        height: 1,
                                                        fontSize: 12),
                                                  ),
                                                )
                                              : SizedBox(width: 0),
                                        ],
                                      ),
                                      widget.description
                                          ? Text(
                                              widget
                                                  .codes![key]!['description'],
                                              style: TextStyle(
                                                  height: 1,
                                                  fontSize: 12,
                                                  color: Colors.grey))
                                          : SizedBox(height: 0)
                                    ],
                                  ),
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 15),
                                    ),
                                  ),
                                  leadingIcon: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: MbColors(context)
                                              .surface
                                              .withOpacity(0.05),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Center(
                                          child: FaIcon(
                                              widget.codes![key]!['icon'],
                                              size: 14))),
                                );
                              }).toList()),
                    textStyle: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: widget.fontSize ?? 14,
                        fontWeight: FontWeight.w400,
                        color: MbColors(context).surface,
                      ),
                    ),
                    label: widget.isSmall
                        ? null
                        : Column(
                            children: [
                              Text(widget.labelText),
                            ],
                          ),
                    leadingIcon: selectedItem != null
                        ? (widget.stream != null
                            ? Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Container(
                                  width: 25,
                                  child: ImageNetwork(
                                      key: ValueKey(selectedItem),
                                      borderRadius: BorderRadius.circular(2.5),
                                      image: fetchedItems![selectedItem]![
                                          'pictureUrl'],
                                      height: 25,
                                      width: 25),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Icon(
                                  widget.sorted
                                      ? widget.codes!.entries
                                          .expand((category) =>
                                              category.value.entries)
                                          .firstWhere((subItem) =>
                                              subItem.key == selectedItem)
                                          .value['icon']
                                      : widget.codes![selectedItem]!['icon'],
                                  size: 16,
                                  color: labelColor,
                                ),
                              ))
                        : null,
                    inputDecorationTheme: InputDecorationTheme(
                      isDense: true,
                      errorStyle: TextStyle(),
                      contentPadding: widget.isSmall
                          ? EdgeInsets.only(
                              left: 15, right: 15, top: 12, bottom: 12)
                          : EdgeInsets.only(
                              left: 15, right: 15, top: 14, bottom: 12),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: labelColor,
                      ),
                      border: InputBorder.none,
                      alignLabelWithHint: true,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: MbColors(context).surface.withOpacity(0.5),
                      ),
                    ),
                    enabled: widget.enabled,
                  );
                }),
          ),
        ),
      ),
    );
  }
}
