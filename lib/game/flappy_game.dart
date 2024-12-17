import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'game_state.dart';

class FlappyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    debugPrint('Jogo carregado');
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    switch (currentState) {
        case GameState.preStart:
         void showMenu() {
print("Exibindo menu inicial...");
}

void startGame(StateManager stateManager) {
print("Iniciando o jogo...");
stateManager.changeState(GameState.running);
}

void showScoreBoard() {
print("Exibindo placar de pontuação...");
}
          break;
        case GameState.running:
         void startGravity() {
         print("Aplicando gravidade ao pássaro...");
         }

        void checkCollisions() {
        print("Verificando colisões...");
        }

void moveObstacles() {
print("Movendo os obstáculos...");
}
          break;
        case GameState.paused:
          void resumeGame(StateManager stateManager) {
print("Retomando o jogo...");
stateManager.changeState(GameState.running);
}
          break;
        case GameState.gameOver:
         void restartGame(StateManager stateManager) {
         print("Reiniciando o jogo...");
         stateManager.changeState(GameState.preStart);
          break;
    }

  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    Paint cor = Paint();
    cor.color = Colors.white;

    canvas.drawCircle(Offset(size.x / 2, size.y / 2), 100, cor);
  }
}

