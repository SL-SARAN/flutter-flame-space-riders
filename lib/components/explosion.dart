import 'dart:async';

import 'package:flame/components.dart';
import 'package:space_riders/my_game.dart';

class Explosion extends SpriteAnimationComponent with HasGameReference<MyGame> {
  Explosion({required super.position})
    : super(size: Vector2(50, 50), priority: 1);

  @override
  Future<void> onLoad() async {
    animation = SpriteAnimation.spriteList(
      [for (int i = 1; i <= 4; i++) await Sprite.load("explosion$i.png")],
      stepTime: 0.5,
      loop: false,
    );
    animationTicker!.onComplete = () {
      removeFromParent();
    };

    return super.onLoad();
  }
}
