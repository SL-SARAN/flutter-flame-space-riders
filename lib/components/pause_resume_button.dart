import 'package:flame/components.dart';
import 'package:space_riders/my_game.dart';

class PauseResumeButton extends ToggleButtonComponent
    with HasGameReference<MyGame> {
  PauseResumeButton()
    : super(size: Vector2.all(64.0), position: Vector2.all(30.0));

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    defaultSkin = SpriteComponent(sprite: await game.loadSprite("pause.png"));
    defaultSelectedSkin = SpriteComponent(
      sprite: await game.loadSprite("resume.png"),
    );

    onChangeState = _handleButtonState;
    return super.onLoad();
  }

  void _handleButtonState(ButtonState state) {
    if (state == ButtonState.downAndSelected) {
      Future.delayed(Duration(milliseconds: 50), () {
        game.overlays.add("PauseMenu");
        game.pauseEngine();
      });
    }
  }

  void resetToUnselected() {
    isSelected = !isSelected;
  }
}
