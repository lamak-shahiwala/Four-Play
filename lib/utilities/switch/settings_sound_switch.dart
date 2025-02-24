import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingsSoundSwitch extends StatefulWidget {
  const SettingsSoundSwitch({super.key});

  @override
  State<SettingsSoundSwitch> createState() => _SettingsSoundSwitchState();
}

class _SettingsSoundSwitchState extends State<SettingsSoundSwitch> {

  bool switch_value = true;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.55,
      child: Switch(value: switch_value, onChanged: (value){
        setState(() {
          switch_value = value;
        });
      },
        activeColor: Colors.black,
        inactiveThumbColor: Colors.black,
      ),
    );
  }
}
