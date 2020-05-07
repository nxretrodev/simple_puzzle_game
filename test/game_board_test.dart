import 'package:flutter_test/flutter_test.dart';
import 'package:simple_puzzle_game/model/game_board.dart';

void main() {
  group('GameBoard Tests', () {
    test('_createGamePieces', () {
      GameBoard gb = GameBoard(
        rows: 3,
        columns: 3,
      );

      //bool b2 = gb.gamePieces[7].move();

      //b2.toString();

      expect(gb.gamePieces.length, 9);
    });

    test('_assignNeighbors', () {});
  });
}
