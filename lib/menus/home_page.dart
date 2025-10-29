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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "SPACE RIDERS",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 60.0,
                  letterSpacing: 4,
                  shadows: [
                    Shadow(color: Colors.white, blurRadius: 15),
                    Shadow(
                      color: const Color.fromARGB(255, 23, 179, 246),
                      blurRadius: 25,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                game.overlays.remove("HomePage");
                game.resumeEngine();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.rocket_launch, color: Colors.white, size: 32),
                  Text(
                    "START",
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 4,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Column(
                children: [
                  SizedBox(height: game.safeArea),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.cyan),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.air,
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ),
                          Text(
                            "Start Your Mission",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.5),
                              wordSpacing: 2,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
