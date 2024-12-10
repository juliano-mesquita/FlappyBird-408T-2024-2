import 'package:flappy_bat/states/game_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StateManager Tests', () {
    late StateManager stateManager;

    setUp(() {
      stateManager = StateManager();
    });

    test('Estado inicial deve ser PreStart', () {
      expect(stateManager.currentState, GameState.preStart);
    });

    test('Mudança para Running', () {
      stateManager.changeState(GameState.running);
      expect(stateManager.isRunning(), true);
    });

    test('Mudança para Paused', () {
      stateManager.changeState(GameState.paused);
      expect(stateManager.isPaused(), true);
    });

    test('Mudança para GameOver', () {
      stateManager.changeState(GameState.gameOver);
      expect(stateManager.isGameOver(), true);
    });

    test('Retorno para PreStart', () {
      stateManager.changeState(GameState.preStart);
      expect(stateManager.isPreStart(), true);
    });
  });
}
