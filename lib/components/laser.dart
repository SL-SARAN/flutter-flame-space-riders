import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:space_riders/my_game.dart';

class Laser extends SpriteComponent
    with HasGameReference<MyGame>, CollisionCallbacks {
  Laser({required super.position}) : super(size: Vector2(32, 32), priority: -1);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await game.loadSprite("laser.png");
    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position.y -= 150 * dt;
    if (position.y < 0) {
      removeFromParent();
    }
    super.update(dt);
  }  
}
