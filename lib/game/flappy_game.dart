import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class FlappyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    debugPrint('Jogo carregado');
  }

  @override
  void update(double dt) {
    super.update(dt);
    debugPrint('Update: $dt');
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    Paint cor = Paint();
    cor.color = Colors.white;

    canvas.drawCircle(Offset(size.x / 2, size.y / 2), 100, cor);
  }
}


enum GameState {
  preStart,
  running,
  paused,
  gameOver,
}

class GameLoop {
  GameState currentState = GameState.preStart;
  Timer? _loopTimer;

  void startLoop() {
    _loopTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      switch (currentState) {
        case GameState.preStart:
          handlePreStart();
          break;
        case GameState.running:
          handleRunning();
          break;
        case GameState.paused:
          handlePaused();
          break;
        case GameState.gameOver:
          handleGameOver();
          break;
      }
    });
  }

  
  void stopLoop() {
    _loopTimer?.cancel();
  }


  void handlePreStart() {
    print("Estado: PreStart - Exibindo menu inicial...");
    Future.delayed(const Duration(seconds: 3), () {
      changeState(GameState.running);
    });
  }

  void handleRunning() {
    print("Estado: Running - Jogo em execução... Aplicando gravidade e verificando colisões.");

    Future.delayed(const Duration(seconds: 5), () {
      changeState(GameState.gameOver);
    });
  }

 
  void handlePaused() {
    print("Estado: Paused - Jogo pausado.");

  }


  void handleGameOver() {
    print("Estado: GameOver - Jogo encerrado. Mostrando tela de reinício.");
   
    Future.delayed(const Duration(seconds: 5), () {
      changeState(GameState.preStart);
    });
  }

  void changeState(GameState newState) {
    currentState = newState;
    print("Mudando para o estado: $newState");
  }
}

void main() {
  final gameLoop = GameLoop();

  print("Iniciando o Game Loop...");
  gameLoop.startLoop();


  Future.delayed(const Duration(seconds: 4), () {
    print("Pausando o jogo...");
    gameLoop.changeState(GameState.paused);
  });

 
  Future.delayed(const Duration(seconds: 6), () {
    print("Retomando o jogo...");
    gameLoop.changeState(GameState.running);
  });
} 
