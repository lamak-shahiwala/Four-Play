import 'package:flutter/material.dart';

class SettingsInfiniteWhiteButton extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final Widget buttonLabel;
  final void Function()? onPress;

  const SettingsInfiniteWhiteButton({super.key,
    this.height = 84.0,
    this.width = double.infinity,
    this.backgroundColor = const Color.fromRGBO(255, 255, 255, 0),
    required this.onPress,
    required this.buttonLabel,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: GestureDetector(
            onTap: onPress,
            child: buttonLabel,
      ),
    );
  }
}