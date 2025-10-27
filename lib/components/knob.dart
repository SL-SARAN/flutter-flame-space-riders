import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:space_riders/my_game.dart';

class Knob extends SpriteComponent with HasGameReference<MyGame>, TapCallbacks {
  Knob({
    required this.path,
    required super.position,
    required this.anch,
    required this.direction,
  }) : super(size: Vector2(64, 64));
  final String path;
  final Anchor anch;
  final String direction;

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite(path);
    anchor = anch;
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (direction == "left") {
      game.player.moveLeft(100);
    }
    if (direction == "right") {
      game.player.moveRight(100);
    }

    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    game.player.stopMove();
    super.onTapUp(event);
  }
}
