import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:medibound_library/src/res/Functions.dart';

class MbBlurred extends StatelessWidget {
  final Widget child;
  final bool active;

  const MbBlurred({required this.child, this.active = true});
  @override
  Widget build(BuildContext context) {
    if (!active) {return child != null ? child : SizedBox(height: 0);}
    else return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
      color: Colors.black.withOpacity(0.1),
      offset: Offset(-1,-1),
      blurRadius: 20,
      spreadRadius: 1
    ) ,

     
  ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  
                  border: Border.all(color: MbColors(context).grey.withOpacity(0.1), width: 0.5),
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.onBackground.withOpacity(1),
                    Theme.of(context).colorScheme.onBackground.withOpacity(1)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: child)),
      ),
    );
  }
}