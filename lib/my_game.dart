import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:space_riders/components/background.dart';
import 'package:space_riders/components/enemy_spawner.dart';
import 'package:space_riders/components/explosion.dart';
import 'package:space_riders/components/health_bar.dart';
import 'package:space_riders/components/knob.dart';
import 'package:space_riders/components/pause_resume_button.dart';
import 'package:space_riders/components/player.dart';
import 'package:space_riders/components/shoot.dart';

class MyGame extends FlameGame with HasCollisionDetection {
  late Player player;
  late Shoot shootButton;
  late Knob leftKnob;
  late Knob rightKnob;
  late EnemySpawner _spaceCraftSpawner;
  late PauseResumeButton pauseResumeButton;
  late TextComponent _scoreText;
  late Explosion _explosion;
  late HealthBar healthBar;

  int hitDamage = 1;
  int _score = 0;
  double get safeArea => (size.y * 0.1).clamp(60.0, 120.0);

  MyGame() {
    pauseEngine();
  }

  @override
  FutureOr<void> onLoad() async {
    await Flame.device.setLandscape();
    await add(Background());
    startGame();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (hitDamage == 7) {
      pauseEngine();
    }
    super.update(dt);
  }

  void startGame() {
    _createPlayer();
    _createShootButton();
    _createKnob();
    _createEnemyCraftSpawner();
    _pauseButton();
    _displayScoreText();
    _createHealthBar();
  }

  void _createPlayer() async {
    player = Player(size: size * 0.1);
    await add(player);
  }

  void _createShootButton() async {
    shootButton = Shoot(position: Vector2(size.x / 2, size.y - safeArea));
    await add(shootButton);
  }

  void _createKnob() async {
    leftKnob = Knob(
      path: "lb.png",
      position: Vector2(size.x * 0.35, size.y - safeArea),
      anch: Anchor.center,
      direction: "left",
    );
    rightKnob = Knob(
      path: "rb.png",
      position: Vector2(size.x * 0.65, size.y - safeArea),
      anch: Anchor.center,
      direction: "right",
    );
    await add(leftKnob);
    await add(rightKnob);
  }

  void _createEnemyCraftSpawner() async {
    _spaceCraftSpawner = EnemySpawner();
    await add(_spaceCraftSpawner);
  }

  void explosionOnDestruction(Vector2 position) {
    _explosion = Explosion(position: position);
    add(_explosion);
  }

  void _pauseButton() {
    pauseResumeButton = PauseResumeButton();
    add(pauseResumeButton);
  }

  void _displayScoreText() {
    _scoreText = TextComponent(
      text: "$_score",
      position: Vector2(size.x / 2, size.y * 0.1),
    );
    add(_scoreText);
  }

  void incrementScore(int amount) {
    _score += amount;
    _scoreText.text = _score.toString();
    _scorePopEffect();
  }

  void _scorePopEffect() {
    final ScaleEffect scaleEffect = ScaleEffect.by(
      Vector2.all(1.3),
      EffectController(alternate: true, duration: 0.2, curve: Curves.easeInOut),
    );
    _scoreText.add(scaleEffect);
  }

  void _createHealthBar() {
    healthBar = HealthBar();
    add(healthBar);
  }
}
