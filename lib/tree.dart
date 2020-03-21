import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

class Tree extends CustomPainter{

  void drawNameStyle1(Canvas canvas, String name, Offset center)
  {
    final textStyle1 = TextStyle(
      color: Colors.white,
      fontSize: 10,
    );
    final textSpan = TextSpan(
      text: name,
      style: textStyle1,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.start,
      textDirection: TextDirection.rtl,
    );
    textPainter.layout();
    double w = textPainter.width/2;
    double h = textPainter.height/2;
    print(textPainter.height/2);
    final offset = Offset(center.dx-w, center.dy-h);
    textPainter.paint(canvas, offset);
  }

  void drawLineStyle1(Canvas canvas, Offset start, Offset end, double firstRadius, double secondRadius){
    ///Distance between two points
    double r = math.sqrt((end.dx-start.dx)*(end.dx-start.dx)+(end.dy-start.dy));
    double cosAngle = (end.dx -  start.dx) / r;
    double sinAngle = (end.dy - start.dy) / r;

    double startPointX = start.dx + firstRadius*cosAngle;
    double startPointY = start.dy + firstRadius*sinAngle;

    double endPointX = end.dx - secondRadius*cosAngle;
    double endPointY = end.dy - secondRadius*sinAngle;

    final startPoint = Offset(startPointX, startPointY);
    final endPoint = Offset(endPointX, endPointY);
    final paint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 1;
    canvas.drawLine(startPoint, endPoint, paint);
  }

  void drawCircleStyle1(Canvas canvas, Offset center, double radius, bool is_has_child, String name){
    Color drawColor = is_has_child ? Colors.blue:Colors.red;
    final paint = Paint()
      ..color = drawColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    canvas.drawCircle(center, radius, paint);
    drawNameStyle1(canvas, name, center);
  }

   childPoint(double radius, Offset originalCenter, double angle){
    double pointX = originalCenter.dx + radius*math.cos(angle);
    double pointY = originalCenter.dy + radius*math.sin(angle);
    final point = Offset(pointX, pointY);
    return point;
  }

  @override
  void paint(Canvas canvas, Size size){
    ///Screen Center Point
    final center  = Offset(size.width / 2, size.height / 2);

    ///Draw Background
    final ancestor_radius = 25.0;
    final ancestor = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;
    canvas.drawCircle(center, ancestor_radius, ancestor);

    final first_ring = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;



    canvas.drawCircle(center, ancestor_radius, first_ring);

    final second_ring = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final second_ring_radius = ancestor_radius + first_ring.strokeWidth/2;
    print(second_ring_radius);
    canvas.drawCircle(center, second_ring_radius, second_ring);

    final first_father = Paint()
      ..color = Colors.deepOrangeAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40;
    final first_father_radius = second_ring_radius + second_ring.strokeWidth/2 + first_father.strokeWidth/2;
    print(first_father_radius);
    canvas.drawCircle(center, first_father_radius, first_father);

    final second_father = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeWidth = 60;
    final second_father_radius = first_father_radius + first_father.strokeWidth/2+ second_father.strokeWidth/2;
    print(second_father_radius);
    canvas.drawCircle(center, second_father_radius, second_father);

    final third_father = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 80;
    final third_father_radius = second_father_radius + third_father.strokeWidth/2+ second_father.strokeWidth/2;
    print(third_father_radius);
    canvas.drawCircle(center, third_father_radius, third_father);

    final fourth_father = Paint()
      ..color = Colors.cyanAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 100;
    final fourth_father_radius = third_father_radius + third_father.strokeWidth/2+ fourth_father.strokeWidth/2;
    print(third_father_radius);
    canvas.drawCircle(center, fourth_father_radius, fourth_father);

    ///Draw Ancestor Name
    drawNameStyle1(canvas, 'الجد الأول', center);


    double firstRadius = 20;
    double secondRadius = 20;


    ///First Family
    final point1 = childPoint(first_father_radius + first_father.strokeWidth/2, center, -math.pi/3);

    drawLineStyle1(canvas, center, point1, second_ring_radius, secondRadius);
    drawCircleStyle1(canvas, point1, secondRadius, true, 'كمي تجربة');

    final point4 = childPoint(first_father_radius + first_father.strokeWidth/2, center, math.pi*2/3);
    drawLineStyle1(canvas, center, point4, second_ring_radius, secondRadius);
    drawCircleStyle1(canvas, point4, secondRadius, true, 'حمدان');

    ///Second Family
    final point2 = childPoint(second_father_radius + second_father.strokeWidth/2, center, -math.pi*3/5);
    drawLineStyle1(canvas, point1, point2, 16, 16);
    drawCircleStyle1(canvas, point2, secondRadius, false, 'زهرة');

    final point3 = childPoint(second_father_radius + second_father.strokeWidth/2, center, -math.pi*1/3);
    drawLineStyle1(canvas, point1, point3, 20, 20);
    drawCircleStyle1(canvas, point3, secondRadius, false, 'أحمد العلي');

    final point6 = childPoint(second_father_radius + second_father.strokeWidth/2, center, -math.pi*1/5);
    drawLineStyle1(canvas, point1, point6, 20, 20);
    drawCircleStyle1(canvas, point6, secondRadius, false, 'ميثة');

    final point7 = childPoint(second_father_radius + second_father.strokeWidth/2, center, 0);
    drawLineStyle1(canvas, point1, point7, 18, 18);
    drawCircleStyle1(canvas, point7, secondRadius, false, 'قاسم');

    ///Third Family
    final point5 = childPoint(second_father_radius + second_father.strokeWidth/2, center, math.pi*4/5);
    drawLineStyle1(canvas, point4, point5, 20, 16);
    drawCircleStyle1(canvas, point5, secondRadius, false, 'زهرة');

    final point8 = childPoint(second_father_radius + second_father.strokeWidth/2, center, math.pi*2/3);
    drawLineStyle1(canvas, point4, point8, 20, 20);
    drawCircleStyle1(canvas, point8, secondRadius, true, 'مصطفى');

    ///Fourth Family
    final point9 = childPoint(third_father_radius + third_father.strokeWidth/2, center, math.pi*3/4);
    drawLineStyle1(canvas, point8, point9, 18, 18);
    drawCircleStyle1(canvas, point9, secondRadius, false, 'سامر');

    final point10 = childPoint(third_father_radius + third_father.strokeWidth/2, center, math.pi*4/7);
    drawLineStyle1(canvas, point8, point10, 20, 16);
    drawCircleStyle1(canvas, point10, secondRadius, false, 'شداد');
  }
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}