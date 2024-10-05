import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:medibound_library/src/data-ui/Blurred.dart';
import 'package:medibound_library/src/data-ui/Button.dart';
import 'package:medibound_library/src/data-ui/Titles.dart';
import 'package:medibound_library/src/res/Functions.dart';

class MbSection extends StatelessWidget {
  final Widget child;
  final String title;
  final String desc;
  final IconData? icon;
  final Color? color;
  final Widget? insetChild;

  final String? buttonText;
  final VoidCallback? onPressed;
  final IconData? buttonIcon;
  final List<Widget>? trailing;

  const MbSection(
      {required this.child,
      required this.title,
      required this.desc,
      this.icon,
      this.color,
      this.buttonText,
      this.onPressed,
      this.buttonIcon,
      this.trailing,
      this.insetChild});

  @override
  Widget build(BuildContext context) {
    return MbBlurred(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          child: Column(
            children: [
              Row(
                children: [
                  icon != null
                      ? Container(
                          child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1,
                                    color: MbColors(context)
                                        .onPrimary
                                        .withOpacity(0.1)),
                              ),
                              child: FaIcon(
                                icon,
                                size: 20,
                                color: color ?? MbColors(context).secondary,
                              )),
                        )
                      : SizedBox(
                          width: 0,
                        ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MbTitle3(text: title),
                      MbSubheading2(text: desc),
                    ],
                  ),
                  SizedBox(width: 30),
                  if (trailing != null) ...trailing!,
                  buttonText != null ? Spacer() : SizedBox(width: 0),
                  buttonText != null
                      ? MbOutlinedButton(
                          onPressed: onPressed ?? () {},
                          text: buttonText ?? "",
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          icon: buttonIcon ?? null,
                        )
                      : SizedBox(width: 0),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                  color: MbColors(context).grey.withOpacity(0.2), thickness: 1),
              child,
            ],
          ),
        ),
        insetChild != null ?  Container(
          color: MbColors(context).background.withOpacity(0.7),
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              insetChild!,
            ],
          )) : SizedBox(height: 0)
      ],
    ));
  }
}
