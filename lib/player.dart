import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class Player extends SpriteComponent{
  double posicao;
  double velocidade;
  bool estadoInicial;

  Player({
    required this.posicao,
    this.velocidade = 0,
    this.estadoInicial = true,
  });

  @override
  FutureOr<void> onLoad() async {
    
    final image = await Flame.images.load('spritesPersonagem.png');
    final size = Vector2(948, 865);

    final playerFrame = Sprite(
      image,
      srcSize: size,
    );

    const playerSize = 128.0;
    
    sprite = playerFrame;
    this.size = Vector2(playerSize, playerSize*(size.y/size.x));
    return super.onLoad();
  }
}