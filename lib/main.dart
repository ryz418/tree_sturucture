import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'tree.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Canvas'),
          ),
          body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: CustomPaint(
        size: Size(width, height),
        painter: Tree(),
      ),

    );
  }
}
class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    final pointMode = ui.PointMode.points;
    final points = [
      Offset(50, 100),
      Offset(150, 75),
      Offset(250, 250),
      Offset(270, 100)
    ];

    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(pointMode, points, paint);
    final p1 = Offset(50, 50);
    final p2 = Offset(250, 150);
    final paint1 = Paint()
      ..color = Colors.red
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint1);

    final left = 60.0;
    final top = 100.0;
    final right = 250.0;
    final bottom = 200.0;
    final rect = Rect.fromLTRB(left, top, right, bottom);
    final paint2 = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawRect(rect, paint2);

    final center  = Offset(150, 150);
    final radius = 100.0;
    final paint3 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawCircle(center, radius, paint3);

    final rect4 = Rect.fromLTRB(50, 100, 250, 200);
    final paint4 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawOval(rect, paint4);

    final rect5 = Rect.fromLTRB(50, 100, 250, 200);
    final startAngle = -math.pi;
    final sweepAngle = math.pi;
    final useCenter = false;
    final paint5 = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawArc(rect5, startAngle, sweepAngle, useCenter, paint5);

    final path = Path()
      ..moveTo(50, 50)
      ..lineTo(200, 200)
      ..quadraticBezierTo(200, 0, 150, 100);

    canvas.drawPath(path, paint4);

    final textStyle = ui.TextStyle(
      color: Colors.black,
      fontSize: 30,
    );
    final paragraphStyle = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText('Hello, world.');
    final constraints = ui.ParagraphConstraints(width: 300);
    final paragraph = paragraphBuilder.build();
    paragraph.layout(constraints);
    final offset = Offset(50, 100);
    canvas.drawParagraph(paragraph, offset);

    final textStyle1 = TextStyle(
      color: Colors.black,
      fontSize: 30,
    );
    final textSpan = TextSpan(
      text: 'file, thank you.',
      style: textStyle1,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset6 = Offset(50, 200);
    textPainter.paint(canvas, offset6);

  }
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

