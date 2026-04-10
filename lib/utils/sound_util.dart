import 'package:audioplayers/audioplayers.dart';

class SoundUtil {
  static final AudioPlayer _player = AudioPlayer();

  static Future init() async {
    await _player.setReleaseMode(ReleaseMode.stop); //点击时播放
    // 👈 低优先级音效模式，避免点击时候打断后台媒体播放
    await _player.setAudioContext(
      AudioContext(
        android: AudioContextAndroid(
          contentType: AndroidContentType.sonification,
          usageType: AndroidUsageType.assistanceSonification,
          audioFocus: AndroidAudioFocus.none,
        ),
        iOS: AudioContextIOS(category: AVAudioSessionCategory.ambient),
      ),
    );
    // 👇 预加载
    await _player.setSource(AssetSource('sounds/click.mp3'));
  }

  //播放点击音效
  static Future playClick() async {
    await _player.seek(Duration.zero); // 👈 重头播放
    await _player.resume(); // 👈 直接播放
  }
}
