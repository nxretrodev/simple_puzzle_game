import 'package:flutter/foundation.dart';

class GamePiece {
  String caption;
  final int index;
  final int rowIndex;
  final int columnIndex;
  List<GamePiece> neighbors = [];

  GamePiece({
    @required this.index,
    @required this.caption,
    @required this.rowIndex,
    @required this.columnIndex,
  }) {
    //print(
    //    "GamePiece #$index with caption '$caption' created at position ($rowIndex, $columnIndex)");
  }

  void addNeighbor(GamePiece neighbor) {
    final deltaRow = (this.rowIndex - neighbor.rowIndex).abs();
    final deltaColumn = (this.columnIndex - neighbor.columnIndex).abs();

    if ((deltaRow == 0 && deltaColumn == 1) ||
        (deltaRow == 1 && deltaColumn == 0)) {
      this.neighbors.add(neighbor);
      //print("Neighbor '${neighbor.caption}' added");
    } else {
      //print("Neighbor '${neighbor.caption}' not added");
    }
  }

  void removeNeighbors() {
    this.neighbors = [];
    //print('Neighbors recalculated');
  }
}
