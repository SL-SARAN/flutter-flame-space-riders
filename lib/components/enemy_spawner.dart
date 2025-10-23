import 'dart:math';

import 'package:flame/components.dart';
import 'package:space_riders/components/enemy_craft.dart';
import 'package:space_riders/my_game.dart';

class EnemySpawner extends PositionComponent with HasGameReference<MyGame> {
  final Random _random = Random();
  double _elapsed = 0;
  final double _nextSpawnTime = 2.0;
  final int _enemyCount = 5;

  @override
  void update(double dt) {
    if (game.paused) return;

    _elapsed += dt;
    if (_elapsed >= _nextSpawnTime) {
      _spawnEnemies();
      _elapsed = 0.0;
    }

    super.update(dt);
  }

  void _spawnEnemies() {
    for (int i = 0; i < _enemyCount; i++) {
      game.add(EnemyCraft(position: _spawnPositionGenerator()));
    }
  }

  Vector2 _spawnPositionGenerator() {
    return Vector2(
      game.safeArea + _random.nextDouble() * (game.size.x - 2* game.safeArea),
      -100,
    );
  }
}
