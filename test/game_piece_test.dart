import 'package:flutter_test/flutter_test.dart';
import 'package:simple_puzzle_game/model/game_piece.dart';

void main() {
  group('Game Piece', () {
    test('Create', () {
      GamePiece gp = GamePiece(
        index: 0,
        caption: '1',
        rowIndex: 0,
        columnIndex: 0,
      );

      expect(gp != null, isTrue);
    });

    test('addNeighbor', () {
      GamePiece gp1 = GamePiece(
        index: 0,
        caption: '1',
        rowIndex: 0,
        columnIndex: 0,
      );
      GamePiece gp2 = GamePiece(
        index: 1,
        caption: '2',
        rowIndex: 0,
        columnIndex: 1,
      );
      GamePiece gp3 = GamePiece(
        index: 2,
        caption: '3',
        rowIndex: 0,
        columnIndex: 2,
      );

      gp1.addNeighbor(gp2);
      gp1.addNeighbor(gp3);

      expect(gp1.neighbors.length == 1, isTrue);
    });

    test('tryMove', () {
      GamePiece gp1 = GamePiece(
        index: 0,
        caption: '1',
        rowIndex: 0,
        columnIndex: 0,
      );
      GamePiece gp2 = GamePiece(
        index: 1,
        caption: '2',
        rowIndex: 0,
        columnIndex: 1,
      );
      GamePiece gp3 = GamePiece(
        index: 2,
        caption: '3',
        rowIndex: 0,
        columnIndex: 2,
      );
      GamePiece gp4 = GamePiece(
        index: 3,
        caption: '',
        rowIndex: 1,
        columnIndex: 0,
      );

      gp1.addNeighbor(gp2);
      gp1.addNeighbor(gp3);
      gp1.addNeighbor(gp4);

      //expect(gp1.move(), isTrue);
    });
  });
}
