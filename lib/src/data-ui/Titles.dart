import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:medibound_library/src/res/Functions.dart';

class MbTitle extends StatelessWidget {
  final String text;

  const MbTitle({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: MbColors(context).onPrimary),
    );
  }
}

class MbTitle2 extends StatelessWidget {
  final String text;

  const MbTitle2({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: MbColors(context).onPrimary),
    );
  }
}

class MbTitle3 extends StatelessWidget {
  final String text;

  const MbTitle3({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: MbColors(context).onPrimary),
    );
  }
}

class MbTitle4 extends StatelessWidget {
  final String text;

  const MbTitle4({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          height: 1.2,
          color: MbColors(context).onPrimary),
    );
  }
}

class MbTitle5 extends StatelessWidget {
  final String text;
  IconData? icon;

  MbTitle5({required this.text, this.icon});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        icon != null ? FaIcon(icon, size: 12, color: MbColors(context).onPrimary.withOpacity(0.5)) : SizedBox(height: 0),
        icon != null ? SizedBox(width: 5) : SizedBox(height: 0),
        Text(
        text,
        style: TextStyle(
            fontSize: 14,
            height: 1.2,
            fontWeight: FontWeight.w500,
            color: MbColors(context).onPrimary,)
      ),]
    );
  }
}

class MbSubheading extends StatelessWidget {
  final String text;

  const MbSubheading({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: MbColors(context).onPrimary.withOpacity(0.5)),
    );
  }
}

class MbSubheading2 extends StatelessWidget {
  final String text;
  IconData? icon;

  MbSubheading2({required this.text, this.icon});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        icon != null ? FaIcon(icon, size: 12, color: MbColors(context).onPrimary.withOpacity(0.5)) : SizedBox(height: 0),
        icon != null ? SizedBox(width: 5) : SizedBox(height: 0),
        Text(
        text,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: MbColors(context).onPrimary.withOpacity(0.5)),
      ),]
    );
  }
}

class MbSubheading3 extends StatelessWidget {
  final String text;

  const MbSubheading3({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.2,
          color: MbColors(context).onPrimary.withOpacity(0.5)),
    );
  }
}