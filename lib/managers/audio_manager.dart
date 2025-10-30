import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioPlayer _bgm = AudioPlayer();
  static final AudioPlayer _explosion = AudioPlayer();
  static final AudioPlayer _fire = AudioPlayer();
  static final double _bgmVolume = 0.5;
  static final double _sfxVolume = 0.5;

  static Future<void> initializeMusic() async {
      await _bgm.setReleaseMode(ReleaseMode.loop);
      await _bgm.setAudioContext(AudioContext(
        android: AudioContextAndroid(
          contentType: AndroidContentType.music,
          usageType: AndroidUsageType.game,
          audioFocus: AndroidAudioFocus.gain,
        )
      ));
      await _explosion.setAudioContext(AudioContext(
        android: AudioContextAndroid(
          contentType: AndroidContentType.sonification,
          usageType: AndroidUsageType.game,
          audioFocus: AndroidAudioFocus.gainTransientMayDuck
        )
      ));
      await _fire.setAudioContext(AudioContext(
        android: AudioContextAndroid(
          contentType: AndroidContentType.sonification,
          usageType: AndroidUsageType.game,
          audioFocus: AndroidAudioFocus.gainTransientMayDuck
        )
      ));
  }

  static Future<void> playMusic() async {
    await _bgm.stop();
    await _bgm.play(AssetSource("audios/background.wav"));
    await _bgm.setVolume(_bgmVolume);
  }

  static Future<void> pauseMusic() async {
    await _bgm.pause();
  }

  static Future<void> resumeMusic() async {
    await _bgm.resume();
  }

  static Future<void> playExplosion() async {
    await _explosion.stop();
    await _explosion.play(AssetSource("audios/enemyExplosion.mp3"));
    await _explosion.setVolume(_sfxVolume);
  }

  static Future<void> playFire() async {
    await _fire.stop();
    await _fire.play(AssetSource("audios/shoot.wav"));
    await _fire.setVolume(_sfxVolume);
  }
}