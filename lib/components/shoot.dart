import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:space_riders/my_game.dart';

class Shoot extends SpriteComponent with HasGameReference<MyGame>, TapCallbacks {
  Shoot({required super.position}) : super(size: Vector2(100, 85));

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite("fireicon.png");
    anchor = Anchor.center;
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    game.player.isShooting = true;
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    game.player.isShooting = false;
    super.onTapUp(event);
  }
}