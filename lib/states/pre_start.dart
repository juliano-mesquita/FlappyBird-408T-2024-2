import 'game_state.dart';

class PreStartState {
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

}

