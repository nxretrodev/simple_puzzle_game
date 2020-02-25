import 'package:flutter/material.dart';
import 'package:simple_puzzle_game/components/game_piece_widget.dart';
import 'package:simple_puzzle_game/model/game_board.dart';
import 'package:simple_puzzle_game/model/game_piece.dart';

class GameBoardWidget extends StatelessWidget {
  final GameBoard gameBoard;
  final void Function(GamePiece) onMove;

  GameBoardWidget({
    @required this.gameBoard,
    @required this.onMove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: gameBoard.columns,
        children: gameBoard.gamePieces.map((gp) {
          return GamePieceWidget(
            gamePiece: gp,
            onMove: this.onMove,
          );
        }).toList(),
      ),
    );
  }
}
