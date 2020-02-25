import 'package:flutter/material.dart';

class GameBar extends StatelessWidget implements PreferredSizeWidget {
  final bool gameWon;
  final Function onRestartGame;

  GameBar({
    @required this.gameWon,
    @required this.onRestartGame,
  });

  Color _getColor() {
    if (gameWon == null) {
      return Colors.yellow[500];
    } else if (gameWon == true) {
      return Colors.green[400];
    } else {
      return Colors.red[400];
    }
  }

  IconData _getIcon() {
    if (gameWon == null) {
      return Icons.sentiment_neutral;
    } else if (gameWon == true) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: _getColor(),
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 45,
              ),
              onPressed: onRestartGame,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
