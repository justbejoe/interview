import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:interview/Constants/constants.dart';

Future<ByteData> createCustomMarkerIconImage(
    {required String priceText}) async {
  final ui.PictureRecorder recorder = ui.PictureRecorder();
  final Canvas canvas = Canvas(recorder);
  const Size size = Size(100, 100); // Adjust size as needed

  // Draw container
  final Paint paint = Paint()..color = yellowColor;
  canvas.drawOval(Rect.fromLTWH(0, 0, size.width, size.height), paint);

  // Draw text
  TextPainter painter = TextPainter(
    text: TextSpan(
      text: priceText,
      style: const TextStyle(
          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
    textDirection: TextDirection.ltr,
  );
  painter.layout();
  painter.paint(
      canvas,
      Offset((size.width - painter.width) / 2,
          (size.height - painter.height) / 2));

  final ui.Image image = await recorder
      .endRecording()
      .toImage(size.width.toInt(), size.height.toInt());
  final ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
  return byteData!;
}
