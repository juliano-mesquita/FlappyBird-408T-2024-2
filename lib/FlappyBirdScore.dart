import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

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
    } else { // else if (gameover == true){ - tem q verificar o nome certo
     FileManager.saveHighScore(score);
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

  //file de salvar score
  class FileManager {
    static Future<void> saveHighScore(int score) async {
      try {  
        final directory = await getApplicationDocumentsDirectory();
        final path = await '${directory.path}/score.cfg';
        final file = File(path);
        await file.writeAsString(score.toString());
        debugPrint('Score: $score');
      } catch (e) {
        debugPrint('Error $e');
      }
    }  
  }

}
