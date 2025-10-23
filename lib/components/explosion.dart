import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:space_riders/my_game.dart';

class Explosion extends PositionComponent with HasGameReference<MyGame> {
  Explosion({required super.position})
    : super(size: Vector2(50, 50), priority: 1);

  @override
  FutureOr<void> onLoad() {
    _flashEffectOnDestruction();
    add(RemoveEffect(delay: 1.0));
    return super.onLoad();
  }

  void _flashEffectOnDestruction() {
    final CircleComponent circleFlash = CircleComponent(
      radius: size.x / 2,
      paint: Paint()..color = Colors.white,
    );

    final OpacityEffect opacityEffect = OpacityEffect.fadeOut(
      EffectController(duration: 0.5),
    );
    circleFlash.add(opacityEffect);
    add(circleFlash);
  }
}
