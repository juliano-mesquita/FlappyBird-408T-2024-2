import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flappy_bat/FlappyBirdScore.dart';

class FlappyGame extends FlameGame {
    FlappyBirdScore score = FlappyBirdScore();

  @override
  Future<void> onLoad() async {
    super.onLoad();

    debugPrint('Jogo carregado');
  }

  @override
  void update(double dt) {
    super.update(dt);
    score.onUpdate;
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
