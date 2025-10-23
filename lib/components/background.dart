import 'dart:async';

import 'package:flame/components.dart';

class Background extends SpriteComponent with HasGameReference {
  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite("background.png");
    size = Vector2(game.size.x + 20, game.size.y + 50);
    priority = -1;
    return super.onLoad();
  }
}