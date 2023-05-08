import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:walk_mate/feature/presentation/widgets/text_widget.dart';
// normal button
class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
        this.bgColor,
        this.widget,
        this.height,
        this.width,
        this.radius,
        required this.onTap})
      : super(key: key);
  final Color? bgColor;
  final Widget? widget;
  final double? height;
  final double? width;
  final double? radius;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: bgColor ?? Colors.green,
        child: widget ?? const TextWidget(title: 'Title'),
        height: height ?? 35.0,
        minWidth: width ?? 85.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 4.0)),
        onPressed: onTap);
  }
}

// LTD button

class ButtonLTDWidget extends StatelessWidget {
  const ButtonLTDWidget(
      {Key? key,
        this.bgColor,
        this.widget,
        this.height,
        this.width,
        this.radius,
        required this.onTap,
        this.focusColor})
      : super(key: key);
  final Color? bgColor;
  final Color? focusColor;
  final Widget? widget;
  final double? height;
  final double? width;
  final double? radius;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 0.0,
        hoverColor: focusColor,
        highlightColor: focusColor,
        color: bgColor ?? Colors.green,
        child: widget ?? const TextWidget(title: 'Title'),
        height: height ?? 35.0,
        minWidth: width ?? 00.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 4.0),

        ),

        onPressed: onTap);
  }
}
