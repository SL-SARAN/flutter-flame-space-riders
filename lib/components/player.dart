import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:space_riders/components/laser.dart';
import 'package:space_riders/managers/audio_manager.dart';
import 'package:space_riders/my_game.dart';

class Player extends SpriteComponent with HasGameReference<MyGame> {
  Player({required super.size});

  double velocity = 0.0;
  bool isShooting = false;
  final double _laserCoolDown = 0.3;
  double _elapsedTime = 0.0;

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite("player.png");
    anchor = Anchor.center;
    position = Vector2(game.size.x / 2, game.size.y - 2 * game.safeArea);
    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position.x += velocity * dt;
    _handlerBounds();

    _elapsedTime += dt;
    if (isShooting && _elapsedTime >= _laserCoolDown) {
      _fireLaser();
      _elapsedTime = 0.0;
    }
    super.update(dt);
  }

  void moveLeft(int value) {
    velocity -= value;
  }

  void moveRight(int value) {
    velocity += value;
  }

  void stopMove() {
    velocity = 0.0;
  }

  void _handlerBounds() {
    final double screenWidth = game.size.x;
    if (position.x < 0) {
      position.x = screenWidth;
    } else if (position.x > screenWidth) {
      position.x = 0;
    }
  }

  void _fireLaser() {
    game.add(
      Laser(
        position: Vector2(position.clone().x - 15, position.clone().y - 20),
      ),
    );
    AudioManager.playFire();
  }
}
