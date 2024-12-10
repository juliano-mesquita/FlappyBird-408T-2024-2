import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class FlappyBirdScore extends Component {
  int score = 0;
  int highScore = 0;
  bool isPlaying = false;
  late Timer gameTimer;

  void startGame() {
      score = 0;
      isPlaying = true;
  }

  void onUpdate(){
    if(isPlaying == true){
      Timer(const Duration(seconds: 1) as double, onTick: timer);
    }
  }

  void timer(){
    score++;
    if(score > highScore){
      highScore = score;
      debugPrint('Score: $score');
    }
  }

  // void gameOver() {
  //     isPlaying = false;
  //     gameTimer?.cancel();
  // }

  // @override
  // void dispose() {
  //   gameTimer?.cancel();
  // }


}
