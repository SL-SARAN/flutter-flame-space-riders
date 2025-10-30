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
import 'package:space_riders/managers/audio_manager.dart';

class MyGame extends FlameGame with HasCollisionDetection {
  late Background _background;
  late Player player;
  late Shoot shootButton;
  late Knob leftKnob;
  late Knob rightKnob;
  late EnemySpawner _spaceCraftSpawner;
  late PauseResumeButton pauseResumeButton;
  late TextComponent _scoreText;
  late Explosion _explosion;
  late HealthBar healthBar;

  late int hitDamage;
  late int _score;
  double get safeArea => (size.y * 0.1).clamp(60.0, 120.0);

  int get score => _score;
  MyGame() {
    pauseEngine();
  }

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    await Flame.device.setLandscape();
    await Flame.images.loadAll([
      "background.png",
      "left1.png",
      "left2.png",
      "right1.png",
      "right2.png",
      "player.png",
      "resume.png",
      "pause.png",
      "laser.png",
      "enemysprite1.png",
      "enemysprite2.png",
      "enemysprite3.png",
      "enemysprite4.png",
      "explosion1.png",
      "explosion2.png",
      "explosion3.png",
      "explosion4.png",
      "health_bar1.png",
      "health_bar2.png",
      "health_bar3.png",
      "health_bar4.png",
      "health_bar5.png",
      "health_bar6.png",
      "health_bar7.png",
    ]);
    
    _startGame();
  }

  @override
  void update(double dt) {
    if (hitDamage == 7) {
      overlays.add("RestartMenu");
      pauseEngine();
    }
    super.update(dt);
  }

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:

      case AppLifecycleState.detached:
        AudioManager.pauseMusic();
        break;
      case AppLifecycleState.resumed:
        AudioManager.resumeMusic();
        break;
      case AppLifecycleState.hidden:
        AudioManager.pauseMusic();
        break;
    }
    super.lifecycleStateChange(state);
  }

  Future<void> _startGame() async {
    hitDamage = 1;
    _score = 0;

    await _initializeBackground();
    await _loadMusics();
    await _createPlayer();
    await _createShootButton();
    await _createKnob();
    await _createEnemyCraftSpawner();
    await _pauseButton();
    await _displayScoreText();
    await _createHealthBar();
  }

  Future<void> _loadMusics() async {
    await AudioManager.initializeMusic();
    await AudioManager.playMusic();
  }

  Future<void> restartGame() async {
    removeAll(children.whereType<PositionComponent>().toList());

    _startGame();
    await Future.delayed(Durations.medium1);
    resumeEngine();
  }

  Future<void> _initializeBackground() async {
    _background = Background();
    await add(_background);
  }

  Future<void> _createPlayer() async {
    player = Player(size: size * 0.1);
    await add(player);
  }

  Future<void> _createShootButton() async {
    shootButton = Shoot(position: Vector2(size.x * 0.8, size.y - safeArea));
    await add(shootButton);
  }

  Future<void> _createKnob() async {
    leftKnob = Knob(
      path: "left1.png",
      position: Vector2(size.x * 0.20, size.y - safeArea),
      anchor: Anchor.center,
      direction: "left",
    );
    rightKnob = Knob(
      path: "right1.png",
      position: Vector2(size.x * 0.30, size.y - safeArea),
      anchor: Anchor.center,
      direction: "right",
    );
    await add(leftKnob);
    await add(rightKnob);
  }

  Future<void> _createEnemyCraftSpawner() async {
    _spaceCraftSpawner = EnemySpawner();
    await add(_spaceCraftSpawner);
  }

  Future<void> explosionOnDestruction(Vector2 position) async {
    _explosion = Explosion(position: position);
    await add(_explosion);
  }

  Future<void> _pauseButton() async {
    pauseResumeButton = PauseResumeButton();
    await add(pauseResumeButton);
  }

  Future<void> _displayScoreText() async {
    _scoreText = TextComponent(
      text: "$_score",
      position: Vector2(size.x / 2, size.y * 0.1),
      textRenderer: TextPaint(
        style: TextStyle(fontFamily: "PixelFont", fontSize: 35.0),
      ),
    );
    await add(_scoreText);
  }

  void incrementScore(int amount) {
    _score += amount;
    _scoreText.text = _score.toString();
    _scorePopEffect();
  }

  Future<void> _scorePopEffect() async {
    final ScaleEffect scaleEffect = ScaleEffect.by(
      Vector2.all(1.3),
      EffectController(alternate: true, duration: 0.2, curve: Curves.easeInOut),
    );
    await _scoreText.add(scaleEffect);
  }

  Future<void> _createHealthBar() async {
    healthBar = HealthBar();
    await add(healthBar);
  }
}
