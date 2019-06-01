import 'package:custom_shapes/colors.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LoginViewPainter extends CustomPainter {
  final ui.Image image;
  LoginViewPainter({@required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    final paint = Paint();
    paint.color = Colors.white;
    var path = Path();
    path.moveTo(0, size.height / 3);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawShadow(path, AppColors.lightGrey, 2.0, false);
    path.close();
    canvas.drawPath(path, paint);
    paint.color = AppColors.lightGrey;
    double _radius = image.width / 2.0;
    final circleCenterOffset = Offset(
      size.width * 0.50,
      size.height / 6,
    );
    final imageCenterOffset = Offset(
      size.width * 0.50 - _radius,
      size.height / 6 - _radius,
    );
    canvas.drawCircle(circleCenterOffset, _radius, paint);
    canvas.drawImage(image, imageCenterOffset, paint);

    final rectPointAOffset = Offset(
      size.width * 0.35,
      size.height * 0.94,
    );

    final rectPointBOffset = Offset(
      size.width * 0.65,
      size.height * 1.06,
    );
    paint.color = Colors.black;
    final rect = Rect.fromPoints(rectPointAOffset, rectPointBOffset);
    canvas.drawRect(rect, paint);

    final rectCircleAOffset = Offset(
      size.width * 0.35,
      size.height,
    );
    paint.color = Colors.black;
    canvas.drawCircle(rectCircleAOffset, rect.height * 0.50, paint);

    final rectCircleBOffset = Offset(
      size.width * 0.65,
      size.height,
    );
    paint.color = Colors.black;
    canvas.drawCircle(rectCircleBOffset, rect.height * 0.50, paint);

    final nextParagraphOffset = Offset(
      size.width * 0.44,
      size.height * 0.97,
    );

    paint.color = Colors.white;
    final ui.ParagraphBuilder paragraphBuilder =
        ui.ParagraphBuilder(ui.ParagraphStyle());
    paragraphBuilder.addText('NEXT');
    final paragraph = paragraphBuilder.build();

    paragraph.layout(ui.ParagraphConstraints(width: rect.width));
    canvas.drawParagraph(paragraph, nextParagraphOffset);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
