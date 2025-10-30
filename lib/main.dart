import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:space_riders/menus/home_page.dart';
import 'package:space_riders/menus/home_restart_menu.dart';
import 'package:space_riders/menus/pause_menu.dart';
import 'package:space_riders/my_game.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: "PixelFont", useMaterial3: false),
      home: GameWidget<MyGame>.controlled(
        loadingBuilder: (_) => BufferLoader(),
        gameFactory: MyGame.new,
        overlayBuilderMap: {
          "HomePage": (_, game) => HomePage(game: game),
          "PauseMenu": (_, game) => PauseMenu(game: game),
          "RestartMenu": (_, game) => HomeRestartMenu(game: game),
        },
        initialActiveOverlays: ["HomePage"],
      ),
    ),
  );
}

class BufferLoader extends StatelessWidget {
  const BufferLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(40.0)
          ),
          constraints: BoxConstraints(maxWidth: 300, maxHeight: 300),
          padding: const EdgeInsets.all(30.0),
          child: Text(
            "Loading...",
            style: TextStyle(
              letterSpacing: 5,
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
