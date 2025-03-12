import 'package:flutter/material.dart';

class Coin extends StatelessWidget {

  final Color coinColor;

  const Coin({super.key, required this.coinColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32), color: coinColor),
    );
  }
}
