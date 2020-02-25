import 'package:flutter/material.dart';
import 'package:simple_puzzle_game/components/game_board_widget.dart';
import 'package:simple_puzzle_game/components/gamebar_widget.dart';
import 'package:simple_puzzle_game/model/game_board.dart';
import 'package:simple_puzzle_game/model/game_piece.dart';

class SimplePuzzleGame extends StatefulWidget {
  @override
  _SimplePuzzleGameState createState() => _SimplePuzzleGameState();
}

class _SimplePuzzleGameState extends State<SimplePuzzleGame> {
  int gameLevel = 4;
  bool gameWon;

  GameBoard _gameBoard = GameBoard(
    columns: 3,
    rows: 3,
  );

  void _restartGame() {
    //print('Restarting game...');
    setState(() {
      this.gameWon = null;
      _gameBoard = GameBoard(
        rows: this._gameBoard.columns,
        columns: this._gameBoard.rows,
      );
    });
  }

  void _movePiece(GamePiece gamePiece) {
    setState(() {
      _gameBoard.moveGamePiece(gamePiece);

      if (_gameBoard.finished()) {
        gameWon = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: GameBar(
          gameWon: this.gameWon,
          onRestartGame: _restartGame,
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          color: Colors.orange[400],
          child: GameBoardWidget(
            gameBoard: _gameBoard,
            onMove: _movePiece,
          ),
        ),
      ),
    );
  }
}
