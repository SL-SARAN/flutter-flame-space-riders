import 'dart:async';

import 'package:flame/components.dart';

class Background extends SpriteComponent with HasGameReference {
  Background({required super.size});
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    sprite = await game.loadSprite("background.png");
    priority = -1;
    return super.onLoad();
  }
}