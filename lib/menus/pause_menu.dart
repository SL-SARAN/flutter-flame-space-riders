import 'package:flutter/material.dart';
import 'package:space_riders/my_game.dart';

class PauseMenu extends StatelessWidget {
  const PauseMenu({super.key, required this.game});

  final MyGame game;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400, maxHeight: 300),
          decoration: BoxDecoration(
            color: Colors.black87,
            border: Border.all(color: Colors.cyan, width: 3),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.cyan, blurRadius: 20, spreadRadius: 5),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "GAME PAUSED",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                    shadows: [
                      Shadow(color: Colors.cyan, blurRadius: 10),
                      Shadow(color: Colors.cyan, blurRadius: 20),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                ElevatedButton.icon(
                  onPressed: () {
                    game.overlays.remove("PauseMenu");
                    game.pauseResumeButton.resetToUnselected();
                    game.resumeEngine();
                  },
                  label: Text(
                    "RESUME",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                    ),
                  ),
                  icon: Icon(Icons.play_arrow, size: 32, color: Colors.black),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
