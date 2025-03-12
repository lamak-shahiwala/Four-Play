import 'package:flutter/material.dart';

import 'coin.dart';

enum cellMode{
  EMPTY,
  YELLOW,
  RED,
}

class Cell extends StatelessWidget {

  final currentCellMode;

  Cell({super.key, required this.currentCellMode});

  Coin _buildCoin(){
    switch(this.currentCellMode){
      case cellMode.YELLOW:
        return Coin(coinColor: Colors.yellow);
      case cellMode.RED:
        return Coin(coinColor: Colors.red);
      default:
        return Coin(coinColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 52,
          width: 46,
          color: Colors.blue,
        ),
        Positioned.fill(
            child: Align(
          alignment: Alignment.center,
          child: _buildCoin(),
        )),
      ],
    );
  }
}
