import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_puzzle_game/model/game_piece.dart';

class GamePieceWidget extends StatelessWidget {
  final GamePiece gamePiece;
  final void Function(GamePiece) onMove;

  GamePieceWidget({
    @required this.gamePiece,
    @required this.onMove,
  });

  Widget _getGamePiece() {
    return Container(
      margin: EdgeInsets.all(1.0),
      color: Colors.deepPurple[800],
      child: Center(
        child: Text(
          gamePiece.caption,
          style: TextStyle(
            fontSize: 45,
            color: Colors.yellow[600],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onMove(gamePiece),
      child: _getGamePiece(),
    );
  }
}
