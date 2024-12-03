import 'package:flame/game.dart';
import 'package:flappy_bat/game/flappy_game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GameWidget(game: FlappyGame()),
  );
}