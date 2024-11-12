import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    if (kDebugMode) {
      print('Jogo carregado');
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (kDebugMode) {
      print('Update: $dt');
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    Paint cor = Paint();
    cor.color = Colors.white;

    canvas.drawCircle(Offset(size.x / 2, size.y / 2), 100, cor);
  }
}

void main() {
  runApp(
    GameWidget(game: MyGame()),
  );
}