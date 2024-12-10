import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/pallete.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final int pontuacao;
  final VoidCallBack onRetry;
  final VoidCallBack onExit;
  
  GameOverScreen(this.spriteImage);

  const GameOverScreen({
    Key? key,
    required this.pontuacao,
    required this.onRetry,
    required this.onExit,
  }) super(key: key);

  @override
  Widget WidgetGameOver(BuildContext context) {
    return Scaffold;
    backgroundColor: Color(0x564936B),
    body Column(
      mainAxisAlignment: mainAxisAlignment: center,
      chilren: [
        Text 'GAME OVER',
        style: TextStyle(
          color: Colors(0xFFFFFFFF),
          fontSize: 40,
        ),
        const SizedBox (height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.refresh, color: Colors.white), //mudar para foto
                iconSize: 48,
                onPressed: onRetry,
              ),
              const SizedBox(width: 40),
              IconButton(
                icon: Icon(Icons.exit_to_app, color: Colors.white), // mudar para foto
                iconSize: 48,
                onPressed: onExit,
              ),
            ],
          ),
        ],
      ),
    );
  }

  class GameOverClass extends FlameGame {
    late int score;

    @override
    Future<void> onLoad() async {
      score = 34234; //mudar para o score atualizado
    }

  void showGameOver(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GameOverScreen(
          score: score,
          onRetry: () {
            Navigator.of(context).pop();
            restartGame();
          },
          onExit: () {
            Navigator.of(context).pop();
            exitGame();
          },
        ),
      ),
    );
  }

  void restartGame() {
  // carrega pro jogo
  }

  void exitGame() {
  // volta pro menu
  }
}
}
