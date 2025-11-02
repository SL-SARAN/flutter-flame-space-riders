import 'dart:async';

import 'package:flame/components.dart';
import 'package:space_riders/my_game.dart';

class HealthBar extends SpriteComponent with HasGameReference<MyGame> {
  HealthBar()
    : super(
        size: Vector2(70.0, 40.0),
        position: Vector2(30.0, 100.0),
        priority: 0,
      );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await game.loadSprite("health_bar1.png");
    return super.onLoad();
  }

  Future<Sprite> updatedHealthBar(int healthNum) async {
    return await game.loadSprite("health_bar$healthNum.png");
  }
}
