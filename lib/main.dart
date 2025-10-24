import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:space_riders/menus/home_page.dart';
import 'package:space_riders/menus/pause_menu.dart';
import 'package:space_riders/my_game.dart';

void main() {
  runApp(
    GameWidget<MyGame>.controlled(
      gameFactory: MyGame.new,
      overlayBuilderMap: {
        "HomePage": (_, game) => HomePage(game: game),
        "PauseMenu": (_, game) => PauseMenu(game: game),
      },
      initialActiveOverlays: ["HomePage"],
    ),
  );
}
