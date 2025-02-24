import 'package:flutter/material.dart';
import 'package:four_play/screens/how_to_play.dart';
import 'package:four_play/screens/settings.dart';
import 'package:four_play/utilities/buttons/blue_dashboard_button.dart';
import 'package:four_play/utilities/text/text_styles.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  final String button1 = "Start Game";
  final String button2 = "How to Play?";
  final String button3 = "Settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 50, 32, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset("assets/images/FourPlay-logo.png"),
              SizedBox(
                height: 40,
              ),
              BlueDashboardButton(
                  onPress: () {},
                  buttonLabel: Text(
                    button1,
                    style: blue_dashboard_button_text,
                  )),
              BlueDashboardButton(
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HowToPlay()));
                  },
                  buttonLabel: Text(
                    button2,
                    style: blue_dashboard_button_text,
                  )),
              BlueDashboardButton(
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                  },
                  buttonLabel: Text(
                    button3,
                    style: blue_dashboard_button_text,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
