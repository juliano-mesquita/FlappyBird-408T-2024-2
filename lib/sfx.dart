import 'package:audioplayers/audioplayers.dart';

AudioCache audioCache = AudioCache();

void playJumpSound() {
  audioCache.play('sounds/asas.mp4');
}

void playCollectSound() {
  audioCache.play('sounds/coin.mp4');
}

void playCollisionSound() {
  audioCache.play('sounds/defeat.mp4');
}
