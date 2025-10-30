import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:space_riders/my_game.dart';

class Shoot extends SpriteComponent with HasGameReference<MyGame>, TapCallbacks {
  Shoot({required super.position}) : super(size: Vector2(100, 85));

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite("shoot1.png");
    anchor = Anchor.center;
    return super.onLoad();
  }

  @override
  Future<void> onTapDown(TapDownEvent event) async {
    sprite = await game.loadSprite("shoot2.png");
    game.player.isShooting = true;
    super.onTapDown(event);
  }

  @override
  Future<void> onTapUp(TapUpEvent event) async {
    sprite = await game.loadSprite("shoot1.png");
    game.player.isShooting = false;
    super.onTapUp(event);
  }
}