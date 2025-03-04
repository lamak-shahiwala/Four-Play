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
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 30,
        child: Transform.scale(
          scale: 0.55,
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
