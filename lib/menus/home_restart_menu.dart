import 'package:flutter/material.dart';
import 'package:space_riders/my_game.dart';

class HomeRestartMenu extends StatelessWidget {
  const HomeRestartMenu({super.key, required this.game});
  final MyGame game;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 300),
          decoration: BoxDecoration(
            color: Colors.black87,
            border: Border.all(color: Colors.cyan, width: 3.0),
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(color: Colors.cyan, blurRadius: 20, spreadRadius: 5),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "GAME OVER",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(color: Colors.cyan, blurRadius: 10.0),
                      Shadow(color: Colors.cyan, blurRadius: 20.0),
                    ],
                    letterSpacing: 4.0,
                  ),
                ),
                Text(
                  "Score: ${game.score}",
                  style: TextStyle(
                    shadows: [
                      Shadow(color: Colors.green, blurRadius: 10.0),
                      Shadow(color: Colors.green, blurRadius: 20.0),
                    ],
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        game.overlays.remove("RestartMenu");
                        game.overlays.add("HomePage");
                        game.restartGame();
                        game.pauseEngine();
                      },
                      label: Text(
                        "HOME",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          letterSpacing: 4.0,
                        ),
                      ),
                      icon: Icon(Icons.home),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        iconColor: Colors.black,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        game.restartGame();
                        game.overlays.remove("RestartMenu");
                      },
                      label: Text(
                        "RESTART",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          letterSpacing: 4.0,
                        ),
                      ),
                      icon: Icon(Icons.restart_alt, size: 25.0),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        iconColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
