import 'package:flutter/material.dart';
import 'package:four_play/controllers/game_controller.dart';
import 'package:get/get.dart';
import 'board_column.dart';

class Board extends StatelessWidget {

  final GameController gameController = Get.find<GameController>();

  List<BoardColumn> _buildBoard() {
    int currentColumnNumber = 0;
    return gameController.board.map((boardColumn) =>
        BoardColumn(columnOfPlayerChips: boardColumn, columnNumber: currentColumnNumber++,)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha((0.5 * 255).toInt()),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GetBuilder<GameController>(builder: (GetxController gameController) => Row(children: _buildBoard(),)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
