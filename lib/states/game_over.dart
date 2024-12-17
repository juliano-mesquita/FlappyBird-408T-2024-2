class GameOverState {

void restartGame(StateManager stateManager) {
print("Reiniciando o jogo...");
stateManager.changeState(GameState.preStart);
}
