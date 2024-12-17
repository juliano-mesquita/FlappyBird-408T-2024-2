import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'components/obstacle.dart';
import 'player.dart';

class FlappyBirdScore extends Component {
  int score = 0;
  int highScore = 0;
  Player player;  
  List<Obstacle> obstacles; 

  FlappyBirdScore({required this.player, required this.obstacles});

  bool playerPassedObstacle() {
    for (var obstacle in obstacles) {
      
      if (player.posicao > obstacle.top.position.x &&
        player.posicao < obstacle.bottom.position.x) {
      
      if (obstacle.middlePoint > 150) {  
        score += 2;  
      } else {
        score += 1; 
      }
        return true;
      }
    }
    return false; 
  }

  
  void update(double deltaTime) {
    if (playerPassedObstacle()) {
      FileManager.saveHighScore(score);
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
