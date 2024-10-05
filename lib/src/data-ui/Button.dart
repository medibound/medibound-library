import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:medibound_library/src/res/Functions.dart';

class MbFilledButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final IconData? icon;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final MainAxisSize size;
  final bool isLoading;

  const MbFilledButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.icon,
    this.color,
    this.textColor,
    this.fontSize = 16,
    this.padding,
    this.size = MainAxisSize.min,
    this.isLoading = false,
  }) : super(key: key);

  @override
  _MbFilledButtonState createState() => _MbFilledButtonState();
}

class _MbFilledButtonState extends State<MbFilledButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  bool _hover = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
    if (widget.onPressed != null && !widget.isLoading) {
      widget.onPressed!();
    }
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onHover(bool isHovered) {
    setState(() {
      _hover = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: MouseRegion(
        opaque: true,
        onEnter: (event) => _onHover(true),
        onExit: (event) => _onHover(false),
        child: AnimatedScale(
          curve: Curves.bounceInOut,
          duration: Duration(milliseconds: 500),
          scale: _scale,
          child: Container(
            decoration: BoxDecoration(
              color: MbColors(context).primary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: _hover
                      ? MbColors(context).primary.withOpacity(0.3)
                      : MbColors(context).primary.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 14,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: MbColors(context).secondary.withOpacity(0.4),
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.5,
                        color: MbColors(context).onPrimary.withOpacity(0.1)),
                    gradient: RadialGradient(
                        colors: [
                          MbColors(context).primary,
                          MbColors(context).secondary.withOpacity(0.4)
                        ],
                        radius: _hover ? 4 : 2.5,
                        center: _hover
                            ? Alignment.bottomCenter
                            : Alignment.topCenter),
                  ),
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  child: MaterialButton(
                    height: 48,
                    onPressed: widget.isLoading ? null : widget.onPressed,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    padding: widget.padding != null
                        ? widget.padding
                        : EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: widget.isLoading
                        ? Container(
                          height: 20,
                          child: LoadingIndicator(
                            indicatorType: Indicator.lineSpinFadeLoader,
                            strokeWidth: 0,
                              colors: [widget.textColor ?? Colors.white],
                            ),
                        )
                        : Row(
                            mainAxisSize: widget.size,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              widget.icon != null
                                  ? FaIcon(widget.icon,
                                      size: 16,
                                      color: _hover
                                          ? Colors.white
                                          : (widget.color ?? Color(0xFFD9FFF6)))
                                  : SizedBox(width: 0),
                              widget.icon != null
                                  ? SizedBox(width: 5)
                                  : SizedBox(width: 0),
                              Text(
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(0, 2.0),
                                        blurRadius: 10.0,
                                        color: Colors.black.withOpacity(0.2),
                                      ),
                                    ],
                                    color: _hover
                                        ? Colors.white
                                        : (widget.color ?? Color(0xFFD9FFF6)),
                                    fontSize: widget.fontSize),
                                widget.text,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MbOutlinedButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final IconData? icon;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final MainAxisSize size;
  final bool isLoading;
  final bool isSmall;

  const MbOutlinedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.icon,
    this.color,
    this.fontSize = 16,
    this.isSmall = false,
    this.padding,
    this.size = MainAxisSize.min,
    this.isLoading = false,
  }) : super(key: key);

  @override
  _MbOutlinedButtonState createState() => _MbOutlinedButtonState();
}

class _MbOutlinedButtonState extends State<MbOutlinedButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  bool _hover = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
    if (widget.onPressed != null && !widget.isLoading) {
      widget.onPressed!();
    }
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onHover(bool isHovered) {
    setState(() {
      _hover = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: MouseRegion(
        opaque: true,
        onEnter: (event) => _onHover(true),
        onExit: (event) => _onHover(false),
        child: AnimatedScale(
          curve: Curves.bounceInOut,
          duration: Duration(milliseconds: 500),
          scale: _scale,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                child: Container(
                  color: _hover
                      ? MbColors(context).onBackground.withOpacity(0.1)
                      : Colors.transparent,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            (MbColors(context).onBackground.withOpacity(0)),
                            (_hover
                                ? MbColors(context).onSecondary.withOpacity(0.7)
                                : MbColors(context)
                                    .onBackground
                                    .withOpacity(0))
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1,
                          color: MbColors(context).onPrimary.withOpacity(0.1)),
                    ),
                    child: MaterialButton(
                      padding: widget.padding ??
                          (widget.isSmall? EdgeInsets.symmetric(vertical: 15, horizontal: 20) : EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
                      onPressed: widget.isLoading ? null : widget.onPressed,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: widget.isLoading
                          ? Container(
                          height: 20,
                          child: LoadingIndicator(
                            indicatorType: Indicator.lineSpinFadeLoader,
                            strokeWidth: 0,
                              colors: [widget.color ?? Colors.white],
                            ),
                        )
                          : Row(
                              mainAxisSize: widget.size,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                widget.icon != null
                                    ? FaIcon(widget.icon,
                                        size: 16,
                                        color: _hover
                                            ? MbColors(context).onPrimary
                                            : (widget.color ??
                                                MbColors(context).secondary))
                                    : SizedBox(width: 0),
                                widget.icon != null
                                    ? SizedBox(width: 5)
                                    : SizedBox(width: 0),
                                Text(
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(0, 2.0),
                                          blurRadius: 10.0,
                                          color:
                                              Colors.black.withOpacity(0.1),
                                        ),
                                      ],
                                      color: _hover
                                          ? MbColors(context).onPrimary
                                          : (widget.color ??
                                              MbColors(context).secondary),
                                      fontSize: widget.fontSize),
                                  widget.text,
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MbTextButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final IconData? icon;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final MainAxisSize size;
  final bool isLoading;

  const MbTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.icon,
    this.color,
    this.fontSize = 16,
    this.padding,
    this.size = MainAxisSize.min,
    this.isLoading = false,
  }) : super(key: key);

  @override
  _MbTextButtonState createState() => _MbTextButtonState();
}

class _MbTextButtonState extends State<MbTextButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  bool _hover = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
    if (widget.onPressed != null && !widget.isLoading) {
      widget.onPressed!();
    }
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onHover(bool isHovered) {
    setState(() {
      _hover = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: MouseRegion(
        opaque: true,
        onEnter: (event) => _onHover(true),
        onExit: (event) => _onHover(false),
        child: AnimatedScale(
          curve: Curves.bounceInOut,
          duration: Duration(milliseconds: 500),
          scale: _scale,
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 0),
                child: Container(
                  color: _hover
                      ? MbColors(context).onBackground.withOpacity(0.1)
                      : Colors.transparent,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(
                      onPressed: widget.isLoading ? null : widget.onPressed,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      padding: widget.padding ?? EdgeInsets.all(0),
                      child: widget.isLoading
                          ? Container(
                          height: 20,
                          child: LoadingIndicator(
                            indicatorType: Indicator.lineSpinFadeLoader,
                            strokeWidth: 0,
                              colors: [widget.color ?? Colors.white],
                            ),
                        )
                          : Row(
                              mainAxisSize: widget.size,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                widget.icon != null
                                    ? FaIcon(widget.icon,
                                        size: 16,
                                        color: _hover
                                            ? MbColors(context).onPrimary
                                            : (widget.color ??
                                                MbColors(context).secondary))
                                    : SizedBox(width: 0),
                                widget.icon != null
                                    ? SizedBox(width: 5)
                                    : SizedBox(width: 0),
                                Text(
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(0, 2.0),
                                          blurRadius: 10.0,
                                          color:
                                              Colors.black.withOpacity(0.1),
                                        ),
                                      ],
                                      color: _hover
                                          ? MbColors(context).onPrimary
                                          : (widget.color ??
                                              MbColors(context).secondary),
                                      fontSize: widget.fontSize),
                                  widget.text,
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MbTonalButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final IconData? icon;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final MainAxisSize size;
  final bool isLoading;
  final bool isSelected;

  const MbTonalButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.icon,
    this.color,
    this.fontSize = 16,
    this.padding,
    this.size = MainAxisSize.min,
    this.isLoading = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  _MbTonalButtonState createState() => _MbTonalButtonState();
}

class _MbTonalButtonState extends State<MbTonalButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  bool _hover = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
    if (widget.onPressed != null && !widget.isLoading) {
      widget.onPressed!();
    }
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onHover(bool isHovered) {
    setState(() {
      _hover = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: MouseRegion(
        opaque: true,
        onEnter: (event) => _onHover(true),
        onExit: (event) => _onHover(false),
        child: AnimatedScale(
          curve: Curves.bounceInOut,
          duration: Duration(milliseconds: 500),
          scale: _scale,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: widget.isSelected
                    ? MbColors(context).greyGreen.withOpacity(0.1)
                    : MbColors(context).greyGreen.withOpacity(0)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                child: Container(
                  color: _hover
                      ? MbColors(context).onBackground.withOpacity(0.1)
                      : Colors.transparent,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(
                      
                      padding: widget.padding ??
                          EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                      height: 40,
                      onPressed: widget.isLoading ? null : widget.onPressed,
                      highlightColor: Colors.transparent,
                      hoverColor: MbColors(context).greyGreen.withOpacity(0.05),
                      splashColor: Colors.transparent,
                      focusNode: FocusNode(),
                      child: widget.isLoading
                          ? Container(
                          height: 20,
                          child: LoadingIndicator(
                            indicatorType: Indicator.lineSpinFadeLoader,
                            strokeWidth: 0,
                              colors: [widget.color ?? Colors.white],
                            ),
                        )
                          : Row(
                              mainAxisSize: widget.size,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                widget.icon != null
                                    ? Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(color: MbColors(context).surface.withOpacity(0.05), borderRadius: BorderRadius.circular(50)),
                                    child: Center(
                                      child: FaIcon(widget.icon,
                                        size: 16,
                                        color: (_hover || widget.isSelected)
                                            ? MbColors(context).secondary
                                            : (widget.color ??
                                                MbColors(context).onPrimary)),
                                    ),
                                  )
                                    : SizedBox(width: 0),
                                widget.icon != null
                                    ? SizedBox(width: 5)
                                    : SizedBox(width: 0),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(0, 5.0),
                                          blurRadius: 7.0,
                                          color: widget.isSelected
                                              ? Colors.black.withOpacity(0.2)
                                              : Colors.black.withOpacity(0),
                                        ),
                                      ],
                                      color: (_hover || widget.isSelected)
                                          ? MbColors(context).secondary
                                          : (widget.color ??
                                              MbColors(context).onPrimary),
                                      fontSize: widget.fontSize),
                                  widget.text,
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}