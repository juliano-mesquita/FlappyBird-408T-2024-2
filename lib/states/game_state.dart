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