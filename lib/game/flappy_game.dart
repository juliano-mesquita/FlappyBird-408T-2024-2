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
          void changeState(GameState newState) {
_currentState = newState;
print("Mudança de estado: $_currentState");
}
          break;
        case GameState.running:
          debugPrint('Game is in runningMode');
          break;
        case GameState.paused:
          debugPrint('Game is in pauseMode');
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

