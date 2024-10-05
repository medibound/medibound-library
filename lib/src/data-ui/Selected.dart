import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:medibound_library/src/res/Functions.dart';

class MbSelected extends StatelessWidget {
  final Widget child;
  final bool active;

  const MbSelected({required this.child, this.active = true});
  @override
  Widget build(BuildContext context) {
    if (!active) {return child != null ? child : SizedBox(height: 0);}
    else return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: GradientBoxBorder(
                    gradient: LinearGradient(colors: [
                      MbColors(context).grey.withOpacity(0.07),
                      MbColors(context).grey.withOpacity(0.07),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    width: 1),
                color: MbColors(context).onSecondary
              ),
              child: child)),
    );
  }
}