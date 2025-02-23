import 'package:flutter/material.dart';
import 'package:four_play/utilities/text/text_styles.dart';

Widget bulletPoint(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("• ", style: bullet_points),  // Bullet Symbol
        Expanded(child: Text(text, style: bullet_points),),
      ],
    ),
  );
}