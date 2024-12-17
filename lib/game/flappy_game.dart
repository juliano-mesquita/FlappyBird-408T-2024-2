import 'package:flame/game.dart';
import 'package:flutter/material.dart';

enum GameState { preStart, running, paused, gameOver }

class StateManager {
  GameState _currentState = GameState.preStart;

  GameState get currentState => _currentState;

  void changeState(GameState newState) {
    _currentState = newState;
    print("Mudança de estado: $_currentState");
  }

  bool isRunning() => _currentState == GameState.running;
  bool isPaused() => _currentState == GameState.paused;
  bool isGameOver() => _currentState == GameState.gameOver;
  bool isPreStart() => _currentState == GameState.preStart;
}

class FlappyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    debugPrint('Jogo carregado');
  }

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

  void startGravity() {
    print("Aplicando gravidade ao pássaro...");
  }

  void checkCollisions() {
    print("Verificando colisões...");
  }

  void moveObstacles() {
    print("Movendo os obstáculos...");
  }

  void resumeGame(StateManager stateManager) {
    print("Retomando o jogo...");
    stateManager.changeState(GameState.running);
  }

  void restartGame(StateManager stateManager) {
    print("Reiniciando o jogo...");
    stateManager.changeState(GameState.preStart);
  }

  @override
  void update(double dt) {
    super.update(dt);
    switch (currentState) {
      case GameState.preStart:
        showMenu();
        break;
      case GameState.running:
        startGravity();
        checkCollisions();
        moveObstacles();
        break;
      case GameState.paused:
        resumeGame(StateManager());
        break;
      case GameState.gameOver:
        restartGame(StateManager());
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
