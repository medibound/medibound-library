import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grain/grain.dart';
import 'package:intl/intl.dart';

class BackgroundWidget extends StatefulWidget {
  final Widget child;
  const BackgroundWidget({super.key, required this.child});

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    _controller.removeStatusListener((status) {});
    _controller.dispose();

    super.dispose();
  }

  late AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          
          CustomPaint(
                  painter: BackgroundPainter(
                      context: context),
                  child: Container(),
                ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                  child: Container(
                    color:
                      MbColors(context).onBackground.withOpacity(0.5),
                    child: widget.child),
                  color: MbColors(context).onBackground.withOpacity(0.5)
                    ))


        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final BuildContext context;

  BackgroundPainter({ required this.context});
  Offset getOffset(Path path) {
    final pms = path.computeMetrics(forceClosed: false).elementAt(0);
    final length = pms.length;
    final offset = pms.getTangentForOffset(length * 2)!.position;
    return offset;
  }

  // Offset getOffset(Path path) {
  //   final pms = path.computeMetrics(forceClosed: false).elementAt(0);
  //   final length = pms.length;
  //   final offset = pms.getTangentForOffset(length * animation.value)!.position;
  //   return offset;
  // }

  void drawEllipse(Canvas canvas, Size size, Paint paint, Offset offset) {
    final path = Path();
    paint.color = Colors.blue.withOpacity(0.6);
    paint.style = PaintingStyle.stroke;
    path.moveTo(size.width * 0.4, -100);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.6,
        size.width * 1.2, size.height * 0.4);
    // canvas.drawPath(path, paint);

    

    paint.style = PaintingStyle.fill;
    canvas.drawOval(
        Rect.fromCenter(
          center: Offset(offset.dx * size.width, offset.dy * size.height),
          width: 300,
          height: 200,
        ),
        paint);
  }

  void drawTriangle(Canvas canvas, Size size, paint, Offset offset) {
    paint.color = MbColors(context).primary.withOpacity(0.6);
    final path = Path();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10.0;
    path.moveTo(-100.0, size.height * 0.5);
    path.quadraticBezierTo(
        300, size.height * 0.7, size.width, size.height * 1.2);
    // canvas.drawPath(path, paint);
    paint.style = PaintingStyle.fill;

    offset = Offset(offset.dx * size.width, offset.dy * size.height);
    // draw triangle
    canvas.drawPath(
        Path()
          ..moveTo(offset.dx, offset.dy)
          ..lineTo(offset.dx + 450, offset.dy + 150)
          ..lineTo(offset.dx + 250, offset.dy - 500)
          ..close(),
        paint);
  }

  

  void drawCircle(Canvas canvas, Size size, Paint paint, Offset offset, {double radius = 150}) {
    paint.color = MbColors(context).primary.withOpacity(0.6);
    Path path = Path();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10.0;
    path.moveTo(size.width * 1.1, size.height / 4);
    path.quadraticBezierTo(
        size.width / 2, size.height * 1.0, -100, size.height / 4);
    // canvas.drawPath((path), paint);
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(offset.dx * size.width, offset.dy * size.height), radius, paint);
  }



  void drawContrastingBlobs(Canvas canvas, Size size, Paint paint) {
    paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 100);
    drawCircle(canvas, size, paint, Offset(.5, .6), radius: 300);
    drawCircle(canvas, size, paint, Offset(.2, .2));
    drawTriangle(canvas, size, paint, Offset(1, .8));
    drawEllipse(canvas, size, paint, Offset(0.9, .2));
    drawEllipse(canvas, size, paint, Offset(0.1, .8));
  }

  void paintBackground(Canvas canvas, Size size) {
    canvas.drawRect(
        Rect.fromCenter(
          center: Offset(size.width * 0.5, size.height * 0.5),
          width: size.width,
          height: size.height,
        ),
        Paint()..color = Colors.transparent);
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintBackground(canvas, size);
    final paint = Paint();
    drawContrastingBlobs(canvas, size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class FooDecoration extends Decoration {
  final EdgeInsets insets;
  final Color color;
  final double blurRadius;
  final bool inner;

  FooDecoration({
    this.insets = const EdgeInsets.all(12) ,
    this.color = Colors.black,
    this.blurRadius = 8,
    this.inner = false,
  });
  @override
  BoxPainter createBoxPainter([void Function()? onChanged]) => _FooBoxPainter(insets, color, blurRadius, inner);
}

class _FooBoxPainter extends BoxPainter {
  final EdgeInsets insets;
  final Color color;
  final double blurRadius;
  final bool inner;

  _FooBoxPainter(this.insets, this.color, this.blurRadius, this.inner);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    var rect = offset & configuration.size!;
    canvas.clipRect(rect);
    var paint = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, blurRadius);

    var path = Path();
    if (inner) {
      path
        ..fillType = PathFillType.evenOdd
        ..addRect(insets.inflateRect(rect))
        ..addRect(rect);
    } else {
      path.addRect(insets.deflateRect(rect));
    }
    canvas.drawPath(path, paint);
  }
}

String convertDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);

  // Format the date
  String formattedDate = DateFormat('MMM d, y').format(dateTime);

  // Add the suffix for the day
  String day = DateFormat('d').format(dateTime);
  String suffix = getDayOfMonthSuffix(int.parse(day));

  // Combine the formatted date and the suffix
  formattedDate = formattedDate.replaceFirst(day, day + suffix);

  return formattedDate;
}

Color brightenColor(Color color, [double amount = 0.2]) {
  assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
  
  int r = color.red + ((255 - color.red) * amount).round();
  int g = color.green + ((255 - color.green) * amount).round();
  int b = color.blue + ((255 - color.blue) * amount).round();

  return Color.fromARGB(color.alpha, r, g, b);
}

String getDayOfMonthSuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

class MbColors {
  final BuildContext context;

  MbColors(this.context);

  Color get primary => MediaQuery.of(context).platformBrightness == Brightness.light ? Color(0xFF00D6A1) : Color(0xFF01775A);
  Color get secondary => MediaQuery.of(context).platformBrightness == Brightness.light ? Color(0xFF01775A) : Color(0xFF00D6A1);
  Color get onPrimary => MediaQuery.of(context).platformBrightness == Brightness.light ? Color(0xFF001C14) : Color(0xFFD9FFF6);
  Color get error => MediaQuery.of(context).platformBrightness == Brightness.light ? Color(0xFFB50000) : Color(0xFFF7C7C7);
  Color get onSecondary => MediaQuery.of(context).platformBrightness == Brightness.light ? Color(0xFFD9FFF6) : Color(0xFF001C14);
  Color get background => MediaQuery.of(context).platformBrightness == Brightness.light ? Color(0xFFEFEFF4) : Color(0xFF000000);
  Color get onBackground => MediaQuery.of(context).platformBrightness == Brightness.light ? Color(0xFFFFFFFF) : Color(0xFF0B0C0C);
  Color get surface => MediaQuery.of(context).platformBrightness == Brightness.light ? Color(0xFF000000) : Color(0xFFFFFFFF);
  Color get onBackground50 => MediaQuery.of(context).platformBrightness == Brightness.light ? Color(0xB3EFEFF4) : Color(0xB3000000); // 70% opacity
  Color get third => Color(0xFF01BCF6); // Same for both themes
  Color get grey => Color(0xFFAFAFAF); // Same for both themes
  Color get inputGrey => MediaQuery.of(context).platformBrightness == Brightness.light ? Color(0xFFDDF4EA) : Color(0xFFAFAFAF);

  // GreyGreen
  Color get greyGreen => Color(0xFF83ADA3); // Same for both themes
}

Gradient backgroundGradient(BuildContext context,
    {AlignmentGeometry? begin, AlignmentGeometry? end}) {
  return LinearGradient(
    colors: [
      MbColors(context).primary.withOpacity(0.05),
      MbColors(context).primary.withOpacity(0),
      MbColors(context).primary.withOpacity(0.05),
      MbColors(context).primary.withOpacity(0.1),
    ],
    begin: begin != null ? begin : Alignment.topLeft,
    end: end != null ? end : Alignment.bottomRight,
  );
}

Gradient lightGradient(BuildContext context,
    {AlignmentGeometry? begin, AlignmentGeometry? end}) {
  return LinearGradient(
    colors: [
      MbColors(context).primary,
      MbColors(context).secondary
    ],
    begin: begin != null ? begin : Alignment.bottomRight,
    end: end != null ? end : Alignment.topLeft,
  );
}

class InsetShadowPainter extends CustomPainter {

  BuildContext context;

  InsetShadowPainter(this.context) {

  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    Paint paint = Paint();

    // Draw the white shadow from the top-left
    paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 5);
    paint.color = Colors.white.withOpacity(0.3);
    canvas.save();
    canvas.translate(-5, -5);
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(0)),
      paint,
    );
    canvas.restore();

    // Draw the dark shadow from the bottom-right
    paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 5);
    paint.color = Colors.black.withOpacity(0.3);
    canvas.save();
    canvas.translate(5, 5);
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(0)),
      paint,
    );
    canvas.restore();
    


    paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 20);
    paint.color = MbColors(context).primary;
    canvas.save();
    canvas.translate(0, 0);
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(12)),
      paint,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
