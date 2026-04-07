import 'package:just_audio/just_audio.dart';

/// Global controller for Home tab background music.
class HomeBgmController {
  HomeBgmController._();

  static final AudioPlayer player = AudioPlayer();
  static bool _ready = false;

  static bool get isReady => _ready;

  static Future<void> init() async {
    if (_ready) return;
    await player.setAsset('assets/audio/home_lofi.mp3');
    await player.setLoopMode(LoopMode.one);
    await player.setVolume(0.5);
    _ready = true;
  }

  static Future<void> play() async {
    if (!_ready) return;
    await player.play();
  }

  static Future<void> pause() async {
    if (!_ready) return;
    await player.pause();
  }

  static Future<void> setMuted(bool muted) async {
    if (!_ready) return;
    await player.setVolume(muted ? 0 : 1);
  }
}
