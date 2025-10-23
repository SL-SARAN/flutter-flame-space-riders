import 'package:flutter/material.dart';
import 'package:space_riders/my_game.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.game});
  final MyGame game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "SpaceRiders",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  shadows: [Shadow(color: Colors.white, blurRadius: 20)],
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              game.overlays.remove("HomePage");
              game.resumeEngine();
            }, child: Text("Start")),
          ],
        ),
      ),
    );
  }
}
