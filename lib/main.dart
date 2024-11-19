import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flappy_bat/player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {
  late final SpriteComponent player;

  int cont = 0;
  
  @override
  Future<void> onLoad() async {
    super.onLoad();

    final image = await images.load('spritesPersonagem.png');
    final size = Vector2.all(250.0);

    final playerFrame = Sprite(
      image,
      srcPosition: Vector2(600, 1250),
      srcSize: size,
    );

    player = SpriteComponent(sprite: playerFrame);

    add(player);

    if (kDebugMode) {
      print('Jogo carregado');
    }
  }

  @override
  void update(double dt){
    super.update(dt);
    if (kDebugMode) {
      print('Update: $dt');
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    //Paint cor = Paint();
    //cor.color = Colors.white;

    //canvas.drawCircle(Offset(size.x / 2, size.y / 2), 100, cor);
  }
}

void main() {
  runApp(
    GameWidget(game: MyGame()),
  );
}