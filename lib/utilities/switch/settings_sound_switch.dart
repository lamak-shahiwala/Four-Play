import 'package:flutter/material.dart';

class SettingsSoundSwitch extends StatefulWidget {
  const SettingsSoundSwitch({super.key});

  @override
  State<SettingsSoundSwitch> createState() => _SettingsSoundSwitchState();
}

class _SettingsSoundSwitchState extends State<SettingsSoundSwitch> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight, // Ensures right alignment
      child: SizedBox(
        width: 30, // Controls width to align properly
        child: Transform.scale(
          scale: 0.55, // Adjusted scale for better visibility
          child: Switch(
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            },
            activeColor: Colors.black,
            inactiveThumbColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
