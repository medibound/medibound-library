import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:medibound_library/src/res/Functions.dart';

class MbSearch extends StatefulWidget {
  final String hintText;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Color? color;
  final IconData? icon;
  final bool obscured;
  final bool required;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final String? pictureUrl;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;

  const MbSearch({
    Key? key,
    required this.hintText,
    this.focusNode,
    this.controller,
    this.icon = Icons.search,
    this.obscured = false,
    this.required = false,
    this.color,
    this.fontSize,
    this.padding,
    this.enabled = true,
    this.pictureUrl,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  @override
  _MbSearchState createState() => _MbSearchState();
}

class _MbSearchState extends State<MbSearch> {
  late FocusNode _focusNode;
  bool obscuredCheck = false;

  @override
  void initState() {
    super.initState();
    obscuredCheck = widget.obscured;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      setState(() {}); // Rebuild the widget when the focus state changes
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void toggleObscure() {
    setState(() {
      obscuredCheck = !obscuredCheck;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isFocused = _focusNode.hasFocus;
    Color borderColor = isFocused
        ? MbColors(context).secondary
        : MbColors(context).onBackground.withOpacity(0.1);
    Color labelColor = isFocused
        ? MbColors(context).secondary
        : MbColors(context).onPrimary;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: MbColors(context).greyGreen.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(1, 1),
          ),
          BoxShadow(
              color: MbColors(context).background.withOpacity(0.05),
              offset: Offset(-1, -1),
              blurRadius: 5,
              spreadRadius: 1),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            height: 40,
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
                  width: 1.5,
                ),
                color: isFocused
                    ? MbColors(context).onBackground.withOpacity(0.4)
                    : MbColors(context).surface.withOpacity(0.05)),
            child: TextField(
              focusNode: _focusNode,
              controller: widget.controller,
              style: GoogleFonts.rubik(
                textStyle: TextStyle(
                  fontSize: widget.fontSize ?? 14,
                  fontWeight: FontWeight.w400,
                  color: MbColors(context).surface,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 2.0),
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                ),
              ),
              obscureText: obscuredCheck,
              enabled: widget.enabled,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: widget.icon != null
                    ? Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(widget.icon, size: 18, color: labelColor))
                    : null,
                suffixIcon: widget.required
                    ? Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          "*required",
                          style: TextStyle(
                              fontSize: 11, color: MbColors(context).error),
                        ),
                      )
                    : (widget.obscured
                        ? Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: GestureDetector(
                                onTap: toggleObscure,
                                child: Icon(Icons.remove_red_eye,
                                    size: 18,
                                    color: MbColors(context)
                                        .onPrimary
                                        .withOpacity(0.5))))
                        : null),
                errorStyle: TextStyle(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 11),
                hintText: widget.hintText,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: labelColor,
                ),
                border: InputBorder.none,
                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: TextStyle(
                  color: MbColors(context).surface.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
