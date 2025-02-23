import 'package:flutter/material.dart';

class BlueDashboardButton extends StatelessWidget {

  final double horizontalMargin;
  final double verticalMargin;
  final double horizontalPadding;
  final double verticalPadding;
  final double height;
  final double width;
  final double elevationValue;
  final Color backgroundColor;
  final Color borderColor;
  final Color splashColor;
  final Color highlightColor;
  final double circularBorderRadius;
  final double borderWidth;
  final Widget buttonLabel;
  final void Function()? onPress;

  const BlueDashboardButton({super.key,
    this.height = 84.0,
    this.width = 277.0,
    this.horizontalMargin = 5.0,
    this.verticalMargin = 5.0,
    this.verticalPadding = 10,
    this.horizontalPadding = 10,
    this.elevationValue = 0 ,
    this.backgroundColor = const Color(0xFF226ADD),
    this.highlightColor = const Color(0xFF226ADD),
    this.splashColor = const Color(0xFF226ADD),
    this.circularBorderRadius = 5,
    this.borderWidth = 1.2,
    this.borderColor = const Color.fromRGBO(254, 254, 254, 1),
    required this.onPress,
    required this.buttonLabel,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin, vertical: verticalMargin),
      child: MaterialButton(
        onPressed: onPress,
        color: backgroundColor,
        splashColor: splashColor,
        highlightColor: highlightColor,
        elevation: elevationValue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius),
          side: BorderSide(color: borderColor, width: borderWidth),
        ),
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding, horizontal: horizontalPadding),
        child: buttonLabel,
      ),
    );
  }
}