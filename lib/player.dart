import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Player extends Component{
  double posicao;
  double velocidade;
  bool estadoInicial;

  Player({
    required this.posicao,
    this.velocidade = 0,
    this.estadoInicial = true,
  });
}