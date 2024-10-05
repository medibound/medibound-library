import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:medibound_library/src/res/Functions.dart';

class MbDarkBlurred extends StatelessWidget {
  final Widget child;
  final bool active;
  final BorderRadius borderRadius;

  const MbDarkBlurred({required this.child, this.active = true, this.borderRadius = BorderRadius.zero});
  @override
  Widget build(BuildContext context) {
    if (!active) {return child != null ? child : SizedBox(height: 0);}
    else return ClipRRect(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100 , sigmaY: 100),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
               border: GradientBoxBorder(
                    gradient: LinearGradient(colors: [
                      MbColors(context).grey.withOpacity(0.2),
                      MbColors(context).grey.withOpacity(0.2),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    width: 0.5),
                gradient: LinearGradient(colors: [
                  MbColors(context).background.withOpacity(0.7),
                  MbColors(context).background.withOpacity(0.7)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: child)),
    );
  }
}