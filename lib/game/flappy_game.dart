import 'package:flame/game.dart';
import 'package:flappy_bat/components/obstacle.dart';
import 'package:flutter/material.dart';

class FlappyGame extends FlameGame {
  late GameComponent gameComponent;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    gameComponent = GameComponent(size: Vector2(0, size.y));
    add(gameComponent);
    debugPrint('Jogo carregado');
  }

  @override
  void update(double dt) {
    super.update(dt);
    gameComponent.move((size.x * 0.4) * dt, size.x);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    Paint cor = Paint();
    cor.color = Colors.white;

    canvas.drawCircle(Offset(size.x / 2, size.y / 2), 100, cor);
  }
}
