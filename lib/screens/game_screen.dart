import 'package:flutter/material.dart';
import 'package:four_play/controllers/game_controller.dart';
import 'package:four_play/utilities/game_screen_utilities/coin.dart';
import 'package:four_play/utilities/game_screen_utilities/game_body.dart';
import 'package:get/get.dart';

class GameScreen extends StatelessWidget {
  final GameController gameController = Get.find<GameController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          //color: gameController.turnYellow ? Colors.yellow : Colors.red,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                        child: Column(
                          spacing: 10,
                          children: [
                            gameController.turnYellow ? Text("Yellow Turn",style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),) : Text("Red Turn",style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),),
                            gameController.turnYellow ? Coin(coinColor: Colors.yellow) : Coin(coinColor: Colors.red),
                          ],
                        ),
                      ),
                    ),
                    PopScope(
                      canPop: false,
                      onPopInvokedWithResult: (didPop, result) async {
                        if (!didPop) {
                          _showExitDialog(context);
                        }
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            alignment: Alignment.centerRight,
                            height: 70,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    bottomLeft: Radius.circular(100)),
                                color: Color.fromRGBO(200, 200, 200, 1)),
                            child: IconButton(
                                onPressed: () {
                                  _showExitDialog(context);
                                },
                                icon: Icon(Icons.exit_to_app_outlined))),
                      ),
                    ),
                  ],
                ),
                Expanded(child: GameBody()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> _showExitDialog(BuildContext context) async {
  return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Exit"),
          content: Text("Are you sure you want to exit?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                final GameController gameController = Get.find<GameController>();
                gameController.resetGame();
                Navigator.pop(context);
                Get.offAllNamed('/');
              },
              child: Text("Exit"),
            ),
          ],
        ),
      ) ??
      false;
}
