import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:space_riders/my_game.dart';

class Knob extends SpriteComponent with HasGameReference<MyGame>, TapCallbacks {
  Knob({
    required this.path,
    required super.position,
    required super.anchor,
    required this.direction,
  }) : super(size: Vector2(70.0, 70.0));
  final String path;
  final String direction;

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite(path);
  }

  @override
  Future<void> onTapDown(TapDownEvent event) async {
    if (direction == "left") {
      sprite = await game.loadSprite("left2.png");
      game.player.moveLeft(100);
    }
    if (direction == "right") {
      sprite = await game.loadSprite("right2.png");
      game.player.moveRight(100);
    }

    super.onTapDown(event);
  }

  @override
  Future<void> onTapUp(TapUpEvent event) async {
    if (direction == "left") {
      sprite = await game.loadSprite("left1.png");
    }
    if (direction == "right") {
      sprite = await game.loadSprite("right1.png");
    }
    game.player.stopMove();
    super.onTapUp(event);
  }
}
