import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:simple_puzzle_game/model/game_piece.dart';

class GameBoard {
  final int rows;
  final int columns;

  List<GamePiece> _gamePieces = [];

  GameBoard({
    @required this.rows,
    @required this.columns,
  }) {
    _createGamePieces();
    _assignNeighbors();
    _suffleGame();
  }

  List<GamePiece> get gamePieces => _gamePieces;

  void _createGamePieces() {
    int gpIndex = 0;

    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < columns; c++) {
        gpIndex++;

        _gamePieces.add(
          GamePiece(
            index: gpIndex,
            rowIndex: r,
            columnIndex: c,
            caption:
                ((r == (rows - 1) && c == (columns - 1))) ? '' : '$gpIndex',
          ),
        );
      }
    }
  }

  void _assignNeighbors() {
    for (GamePiece gamePiece in _gamePieces) {
      gamePiece.removeNeighbors();
      int index = 0;
      for (var r = 0; r < rows; r++) {
        for (var c = 0; c < columns; c++) {
          if (_gamePieces[index].caption != gamePiece.caption) {
            gamePiece.addNeighbor(_gamePieces[index]);
          }

          index++;
        }
      }
    }
  }

  void _suffleGame() {
    int maxValue = (this.rows * this.columns);
    int nextNumber = 1;

    for (GamePiece gamePiece in _gamePieces) {
      gamePiece.caption = '';
    }

    while (nextNumber < maxValue) {
      int position = Random().nextInt(maxValue);

      if (gamePieces[position].caption == '') {
        gamePieces[position].caption = '$nextNumber';
        nextNumber++;
      }
    }
  }

  bool finished() {
    bool ret = true;

    for (var i = 0; i < _gamePieces.length - 1; i++) {
      if (!((_gamePieces[i].index).toString() == _gamePieces[i].caption)) {
        ret = false;
        break;
      }
    }

    return ret;
  }

  bool moveGamePiece(GamePiece gamePiece) {
    bool ret = false;
    String currentCaption = gamePiece.caption;

    if (finished()) {
      return ret;
    }

    if (currentCaption == "") {
      return ret;
    }

    for (var neighbor in gamePiece.neighbors) {
      if (neighbor.caption == "") {
        gamePiece.caption = "";
        neighbor.caption = currentCaption;
        ret = true;
        break;
      }
    }

    return ret;
  }
}
