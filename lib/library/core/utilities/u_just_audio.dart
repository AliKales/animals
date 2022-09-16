import 'package:just_audio/just_audio.dart';

class UJustAudio {
  final player = AudioPlayer();
  String _currentLink = "";

  Stream<PlayerState> get getPlayingStream => player.playerStateStream;

  String get getCurrentLink => _currentLink;

  void resetLink() => _currentLink = "";

  Future<Duration?> setUrl(String link) async {
    _currentLink = link;
    return await player.setUrl(link);
  }

  Future<void> play() async {
    await player.play();
  }

  Future<void> pause() async {
    await player.pause();
  }

  Future<void> stop() async {
    await player.stop();
  }
}
