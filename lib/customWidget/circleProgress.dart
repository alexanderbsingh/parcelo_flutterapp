import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CircleProgress extends CustomPainter{

  double currentProgress;
  Color color;
  Color backgroundColor;
  double strokewidth;

  CircleProgress(this.currentProgress, this.color, this.backgroundColor, this.strokewidth);
 

  @override
  void paint(Canvas canvas, Size size) {

    //this is base circle
    Paint outerCircle = Paint()
        ..strokeWidth = strokewidth
        ..color = backgroundColor
        ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = strokewidth
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap  = StrokeCap.round;

    Offset center = Offset(size.width/2, size.height/2);
    double radius = min(size.width/2,size.height/2) - 10;

    canvas.drawCircle(center, radius, outerCircle); // this draws main outer circle

    double angle = 2 * pi * (currentProgress/100);

    canvas.drawArc(Rect.fromCircle(center: center,radius: radius), -pi/2, angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}