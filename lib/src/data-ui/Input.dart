import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_network/image_network.dart';
import 'package:medibound_library/src/res/Functions.dart';

class MbInput extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  final Color? color;
  final IconData? icon;
  final bool obscured;
  final bool required;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final FormFieldSetter<String>? onSaved;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode; // Added focusNode parameter
  final String? pictureUrl; // Added suffixIcon parameter
  final bool enabled;
  final bool isSmall; // Added enabled parameter

  const MbInput({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.controller,
    this.icon,
    this.obscured = false,
    this.required = false,
    this.color,
    this.fontSize,
    this.padding,
    this.onSaved,
    this.initialValue,
    this.onChanged,
    this.focusNode, // Added focusNode parameter
    this.pictureUrl, // Added suffixIcon parameter
    this.enabled = true,
    this.isSmall = false, // Added enabled parameter
  }) : super(key: key);

  @override
  _MbInputState createState() => _MbInputState();
}

class _MbInputState extends State<MbInput> {
  bool obscuredCheck = false;
  TextEditingController? _controller;
  late FocusNode _focusNode;
  bool _isExternalFocusNode = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeFocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _initializeFocusNode();
    }
  }

  @override
  void didUpdateWidget(covariant MbInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      _controller?.text = widget.initialValue ?? '';
    }
  }

  void _initializeFocusNode() {
    if (widget.focusNode == null) {
      _focusNode = FocusNode();
    } else {
      _focusNode = widget.focusNode!;
      _isExternalFocusNode = true;
    }

    obscuredCheck = widget.obscured;
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);

    _focusNode?.addListener(() {
      setState(() {}); // Rebuild the widget when the focus state changes
    });

    _isInitialized = true;
  }

  @override
  void dispose() {
    if (!_isExternalFocusNode) {
      _focusNode?.dispose();
    }
    _controller?.dispose();
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
    Color labelColor =
        isFocused ? MbColors(context).secondary : MbColors(context).onPrimary;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: widget.enabled ? MbColors(context).greyGreen.withOpacity(0.05) : MbColors(context).background.withOpacity(0.05),
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
                width: 1.5,
              ),
              color: !widget.enabled
                  ? MbColors(context).surface.withOpacity(0.01)
                  : (isFocused ? MbColors(context).background.withOpacity(0.4) : MbColors(context).surface.withOpacity(0.05)),
            ),
            child: TextFormField(
              focusNode: _focusNode,
              controller: _controller,
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
              decoration: InputDecoration(
                isDense: true,
                suffixIcon: widget.required
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "*required",
                          style: TextStyle(
                              fontSize: 11, color: MbColors(context).error),
                        ),
                      )
                    : (widget.obscured
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            child: GestureDetector(
                                onTap: toggleObscure,
                                child: FaIcon(FontAwesomeIcons.solidEye,
                                    size: 14,
                                    color: MbColors(context)
                                        .onPrimary
                                        .withOpacity(0.5))))
                        : null),
                prefixIcon: widget.icon != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: FaIcon(widget.icon,
                                  size: 16, color: labelColor)),
                        ],
                      )
                    : widget.pictureUrl != null ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child:ConstrainedBox(constraints: BoxConstraints(maxHeight: widget.isSmall ? 25 :  40, maxWidth: widget.isSmall ? 25 :  40), child: ImageNetwork(image: widget.pictureUrl!, height: 35, width: 35, borderRadius: BorderRadius.circular(5),))),
                        ],
                      ) : null,
                errorStyle: TextStyle(),
                contentPadding:
                    EdgeInsets.only(left: 15, right: 15, top: 14, bottom: 12),
                labelText: widget.isSmall ? null :  widget.labelText,
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
              onSaved: widget.onSaved,
              onChanged: widget.onChanged,
              enabled: widget.enabled, // Added enabled
            ),
          ),
        ),
      ),
    );
  }
}
