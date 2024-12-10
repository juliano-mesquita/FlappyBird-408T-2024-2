import 'package:flutter/material.dart';
import 'dart:async';

class FlappyBirdScore extends StatefulWidget {
  @override
  _FlappyBirdScoreState createState() => _FlappyBirdScoreState();
}

class _FlappyBirdScoreState extends State<FlappyBirdScore> {
  int score = 0;
  int highScore = 0;
  bool isPlaying = false;
  Timer? gameTimer;

  void startGame() {
    setState(() {
      score = 0;
      isPlaying = true;
    });

    // Simula o aumento da pontuação durante o jogo
    gameTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (isPlaying) {
        setState(() {
          score++;
          if (score > highScore) {
            highScore = score;
          }
        });
      }
    });
  }

  void gameOver() {
    setState(() {
      isPlaying = false;
      gameTimer?.cancel();
    });
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Score: $score',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 3.0,
                  color: Colors.black,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'High Score: $highScore',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 3.0,
                  color: Colors.black,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          if (!isPlaying)
            ElevatedButton(
              onPressed: startGame,
              child: Text(
                'Iniciar Jogo',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          if (isPlaying)
            ElevatedButton(
              onPressed: gameOver,
              child: Text(
                'Game Over',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
        ],
      ),
    );
  }
}