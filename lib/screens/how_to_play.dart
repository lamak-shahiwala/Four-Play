import 'package:flutter/material.dart';
import 'package:four_play/utilities/bullet_points/simple_bullet_point.dart';
import 'package:four_play/utilities/text/text_styles.dart';

class HowToPlay extends StatelessWidget {
  const HowToPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back_rounded)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "How To Play?",
                      style: heading,
                    ),
                    Container(
                        height: 80,
                        width: 80,
                        child: Image.asset(
                            "assets/images/how-to-play_appbar.png")),
                  ],
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "FourPlay - Game Rules",
                        style: sub_heading,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  bulletPoint(
                      "Be the first player to connect four of your pieces in a row, column, or diagonal to win"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(height: 100, width: 100,child: Image.asset("assets/images/how-to-play_appbar.png")),
                      Container(height: 100, width: 100,child: Image.asset("assets/images/how-to-play_appbar.png")),
                      Container(height: 100, width: 100,child: Image.asset("assets/images/how-to-play_appbar.png")),
                  ],),
                  bulletPoint(
                      "Turn-Based Gameplay: Two players take turns placing pieces."),
                  bulletPoint(
                      "Dropping Pieces: Players drop one piece per turn into a 7-column, 6-row grid."),
                  bulletPoint(
                      "Gravity Rule: Pieces fall to the lowest available row within a column."),
                  bulletPoint(
                      "Winning Condition: A player wins by connecting four pieces in a straight horizontal, vertical, or diagonal line."),
                  bulletPoint(
                      "Draw Condition: If the grid is completely filled and no one has won, the game ends in a draw."),
                  bulletPoint(
                      "Full Column Rule: Players cannot place a piece in a full column."),
                  bulletPoint(
                      "No Undo: Once a move is made, it cannot be undone."),
                  bulletPoint(
                      "Game Reset: The game automatically resets after a win, draw, or manual restart."),
                  bulletPoint("Play fairly and respect your opponent."),
                  bulletPoint("No intentional delaying or quitting mid-game."),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
