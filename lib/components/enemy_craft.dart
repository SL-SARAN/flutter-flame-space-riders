import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:space_riders/components/laser.dart';
import 'package:space_riders/components/player.dart';
import 'package:space_riders/my_game.dart';

class EnemyCraft extends SpriteComponent
    with HasGameReference<MyGame>, CollisionCallbacks {
  final Random _random = Random();
  late Vector2 _velocity;
  late int _health;

  EnemyCraft({required super.position}) : super(size: Vector2(50, 50)) {
    _velocity = _velocityGenerator();
    _health = 3;
  }

  @override
  FutureOr<void> onLoad() async {
    int imageNum = _random.nextInt(6) + 1;
    sprite = await game.loadSprite("enemy$imageNum.png");
    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position += _velocity * dt;
    if (position.y > game.size.x) {
      removeFromParent();
    }

    super.update(dt);
  }

  Vector2 _velocityGenerator() {
    return Vector2(0, 100 + _random.nextDouble() * 60);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {
      game.health--;
      removeFromParent();
    }
    if (other is Laser) {
      _flashEffect();
      if (_health-- == 0) {
        removeFromParent();
        game.explosionOnDestruction(position.clone());
        game.incrementScore(2);
      }
      other.removeFromParent();
      game.incrementScore(1);
    }
    super.onCollision(intersectionPoints, other);
  }

  void _flashEffect() {
    final ColorEffect colorFlash = ColorEffect(
      Colors.black,
      EffectController(
        duration: 0.05,
        alternate: true,
        curve: Curves.easeInOut,
      ),
    );
    add(colorFlash);
  }
}
