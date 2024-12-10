import 'package:flame/game.dart';
import 'package:flappy_bat/components/obstacle.dart';
import 'package:flutter/material.dart';

class FlappyGame extends FlameGame {
  late Obstacle obstacle;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    obstacle = Obstacle(size: Vector2(0, size.y));
    add(obstacle);
    debugPrint('Jogo carregado');
  }

  @override
  void update(double dt) {
    super.update(dt);
    obstacle.move((size.x * 0.4) * dt, size.x);
  }
}
