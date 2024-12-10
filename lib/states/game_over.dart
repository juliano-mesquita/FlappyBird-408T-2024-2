import 'game_state.dart';

class GameOverState {
void showGameOverScreen() {
print("Exibindo tela de fim de jogo...");
}

void restartGame(StateManager stateManager) {
print("Reiniciando o jogo...");
stateManager.changeState(GameState.preStart);
}
}