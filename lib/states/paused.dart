import 'game_state.dart';

class PausedState {
void showPauseMenu() {
print("Exibindo menu de pausa...");
}

void resumeGame(StateManager stateManager) {
print("Retomando o jogo...");
stateManager.changeState(GameState.running);
}
}