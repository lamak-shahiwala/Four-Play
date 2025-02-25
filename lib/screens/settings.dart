import 'package:flutter/material.dart';
import 'package:four_play/utilities/buttons/settings_infinite_white_button.dart';
import 'package:four_play/utilities/switch/settings_sound_switch.dart';
import 'package:four_play/utilities/text/text_styles.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  final double top_padding = 10;
  final double bottom_padding = 10;
  final double left_padding = 20;
  final double right_padding = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_rounded)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 15, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Settings",
                        style: heading,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          toolbarHeight: 150,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(2),
            child: Container(
              color: Colors.black,
              height: 2,
            ),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 10, 30, 10),
            child: SettingsInfiniteWhiteButton(
              onPress: () {},
              buttonLabel: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Themes",
                    style: settings_infinite_white_button_text,
                  ),
                  Icon(
                    Icons.contrast,
                    size: 22,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 12, 10),
            child: SettingsInfiniteWhiteButton(
              onPress: () {},
              buttonLabel: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sound",
                    style: settings_infinite_white_button_text,
                  ),
                  SettingsSoundSwitch()
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 32, 10),
            child: SettingsInfiniteWhiteButton(
              onPress: () {},
              buttonLabel: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "About Developers",
                    style: settings_infinite_white_button_text,
                  ),
                  Icon(
                    Icons.event_note_rounded,
                    size: 22,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
