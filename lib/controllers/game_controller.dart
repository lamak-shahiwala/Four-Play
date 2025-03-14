import 'package:get/get.dart';

import '../utilities/game_screen_utilities/cell.dart';

class GameController extends GetxController {
  RxList<List<int>> _board = RxList<List<int>>();
  List<List<int>> get board => _board.value;
  set board(List<List<int>> value) => _board.value = value;

  RxBool _turnYellow = true.obs;
  bool get turnYellow => _turnYellow.value;

  void _buildBoard() {
    _turnYellow.value = true;
    board = [
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
    ];
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _buildBoard();
  }

  void playColumn(int columnNumber) {

    final int playerNumber = turnYellow ? 1 : 2;

    final selectedColumn = board[columnNumber];


    if (selectedColumn.contains(0)) {

      final int rowIndex = selectedColumn.indexWhere((cell) => cell == 0);

      selectedColumn[rowIndex] = playerNumber;

      _turnYellow.value = !_turnYellow.value;
      update();

      winner = checkVictory();

      if (winner != 0) {
        declareWinner();
      }

      if (boardIsFull()) {
        Get.defaultDialog(
            title: 'Draw! Nobody won.',
            content: Cell(
              currentCellMode: cellMode.EMPTY,
            )).then((value) => resetGame());
      }
    } else {
      Get.snackbar('Not available',
          'This column is already filled up. Choose another column.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(milliseconds: 800));
    }
  }

  int winner = 0;

  void declareWinner() {
    Get.defaultDialog(
        title: winner == 1 ? 'YELLOW WON' : 'RED WON',
        content: Cell(
          currentCellMode: winner == 1 ? cellMode.YELLOW : cellMode.RED,
        )).then((value) => resetGame());
  }

  void resetGame() => _buildBoard();

  bool boardIsFull() {
    for (final col in board) {
      for (final val in col) {
        if (val == 0) {
          return false;
        }
      }
    }
    return true;
  }

  int checkHorizontals() {
    int yellowInARow = 0;
    int redInARow = 0;
    List<List<int>> rows = [];

    for (var i = 0; i < 6; i++) {
      final List<int> currentRow = getRowList(i);
      rows.add(currentRow);
    }

    for (final row in rows) {
      for (final cell in row) {
        if (yellowInARow >= 4) {
          return 1;
        } else if (redInARow >= 4) {
          return 2;
        } else {
          if (cell == 1) {
            yellowInARow++;
            redInARow = 0;
          } else if (cell == 2) {
            redInARow++;
            yellowInARow = 0;
          } else {
            yellowInARow = 0;
            redInARow = 0;
          }
        }
      }
    }
    return 0;
  }

  List<int> getRowList(int rowNumber) {
    List<int> rowList = [];
    for (final column in board) {
      rowList.add(column[rowNumber]);
    }
    return rowList;
  }

  int checkVerticals() {
    int yellowInARow = 0;
    int redInARow = 0;

    for (final column in board) {
      for (final cell in column) {
        if (yellowInARow >= 4) {
          return 1;
        } else if (redInARow >= 4) {
          return 2;
        } else {
          if (cell == 1) {
            yellowInARow++;
            redInARow = 0;
          } else if (cell == 2) {
            redInARow++;
            yellowInARow = 0;
          } else {
            yellowInARow = 0;
            redInARow = 0;
          }
        }
      }
    }
    return 0;
  }

  int checkDiagonals() {
    final List<int> diagonalDown1 = [];
    final List<int> diagonalDown2 = [];
    final List<int> diagonalDown3 = [];
    final List<int> diagonalDown4 = [];
    final List<int> diagonalDown5 = [];
    final List<int> diagonalDown6 = [];
    final List<int> diagonalUp1 = [];
    final List<int> diagonalUp2 = [];
    final List<int> diagonalUp3 = [];
    final List<int> diagonalUp4 = [];
    final List<int> diagonalUp5 = [];
    final List<int> diagonalUp6 = [];

    //* Fill list 1
    diagonalDown1.add(getCellValue(0, 3));
    diagonalDown1.add(getCellValue(1, 2));
    diagonalDown1.add(getCellValue(2, 1));
    diagonalDown1.add(getCellValue(3, 0));
    //* Fill list 2
    diagonalDown2.add(getCellValue(0, 4));
    diagonalDown2.add(getCellValue(1, 3));
    diagonalDown2.add(getCellValue(2, 2));
    diagonalDown2.add(getCellValue(3, 1));
    diagonalDown2.add(getCellValue(4, 0));
    //* Fill list 3
    diagonalDown3.add(getCellValue(0, 5));
    diagonalDown3.add(getCellValue(1, 4));
    diagonalDown3.add(getCellValue(2, 3));
    diagonalDown3.add(getCellValue(3, 2));
    diagonalDown3.add(getCellValue(4, 1));
    diagonalDown3.add(getCellValue(5, 0));
    //* Fill list 4
    diagonalDown4.add(getCellValue(1, 5));
    diagonalDown4.add(getCellValue(2, 4));
    diagonalDown4.add(getCellValue(3, 3));
    diagonalDown4.add(getCellValue(4, 2));
    diagonalDown4.add(getCellValue(5, 1));
    diagonalDown4.add(getCellValue(6, 0));
    //* Fill list 5
    diagonalDown5.add(getCellValue(2, 5));
    diagonalDown5.add(getCellValue(3, 4));
    diagonalDown5.add(getCellValue(4, 3));
    diagonalDown5.add(getCellValue(5, 2));
    //* Fill list 6
    diagonalDown6.add(getCellValue(3, 5));
    diagonalDown6.add(getCellValue(4, 4));
    diagonalDown6.add(getCellValue(5, 3));
    diagonalDown6.add(getCellValue(6, 2));
    //* Fill list 1
    diagonalUp1.add(getCellValue(0, 2));
    diagonalUp1.add(getCellValue(1, 2));
    diagonalUp1.add(getCellValue(2, 3));
    diagonalUp1.add(getCellValue(3, 4));
    //* Fill list 2
    diagonalUp2.add(getCellValue(0, 1));
    diagonalUp2.add(getCellValue(1, 2));
    diagonalUp2.add(getCellValue(2, 3));
    diagonalUp2.add(getCellValue(3, 4));
    diagonalUp2.add(getCellValue(4, 5));
    //* Fill list 3
    diagonalUp3.add(getCellValue(0, 0));
    diagonalUp3.add(getCellValue(1, 1));
    diagonalUp3.add(getCellValue(2, 2));
    diagonalUp3.add(getCellValue(3, 3));
    diagonalUp3.add(getCellValue(4, 4));
    diagonalUp3.add(getCellValue(5, 5));
    //* Fill list 4
    diagonalUp4.add(getCellValue(1, 0));
    diagonalUp4.add(getCellValue(2, 1));
    diagonalUp4.add(getCellValue(3, 2));
    diagonalUp4.add(getCellValue(4, 3));
    diagonalUp4.add(getCellValue(5, 4));
    diagonalUp4.add(getCellValue(6, 5));
    //* Fill list 5
    diagonalUp5.add(getCellValue(2, 0));
    diagonalUp5.add(getCellValue(3, 1));
    diagonalUp5.add(getCellValue(4, 2));
    diagonalUp5.add(getCellValue(5, 3));
    diagonalUp5.add(getCellValue(6, 4));
    // //* Fill list 6
    diagonalUp6.add(getCellValue(3, 0));
    diagonalUp6.add(getCellValue(4, 1));
    diagonalUp6.add(getCellValue(5, 2));
    diagonalUp6.add(getCellValue(6, 3));

    List<List<int>> diagonals = [];
    diagonals.addAll([
      diagonalDown1,
      diagonalDown2,
      diagonalDown3,
      diagonalDown4,
      diagonalDown5,
      diagonalDown6,
      diagonalUp1,
      diagonalUp2,
      diagonalUp3,
      diagonalUp4,
      diagonalUp5,
      diagonalUp6
    ]);

    for (final diagonal in diagonals) {
      final String diagonalStr = diagonal.join();
      if (diagonalStr.contains('1111')) {
        return 1;
      } else if (diagonalStr.contains('2222')) {
        return 2;
      }
    }

    return 0;
  }

  int getCellValue(int columnNumber, int rowNumber) {
    return board[columnNumber][rowNumber];
  }

  int checkVictory() {
    //* Board dimensions
    const int maxx = 7;
    const int maxy = 6;
    List<List<int>> directions = [
      [1, 0],
      [1, -1],
      [1, 1],
      [0, 1]
    ];

    for (List<int> d in directions) {
      int dx = d[0];
      int dy = d[1];

      for (int x = 0; x < maxx; x++) {

        for (int y = 0; y < maxy; y++) {
          int lastx = (x + (3 * dx));
          int lasty = (y + (3 * dy));

          if ((((0 <= lastx) && (lastx < maxx)) && (0 <= lasty)) &&
              (lasty < maxy)) {
            int w = board[x][y];

            if ((((w != 0) && (w == board[x + dx][y + dy])) &&
                (w == board[x + (2 * dx)][y + (2 * dy)])) &&
                (w == board[lastx][lasty])) {
              return w;
            }
          }
        }
      }
    }
    return 0;
  }
}