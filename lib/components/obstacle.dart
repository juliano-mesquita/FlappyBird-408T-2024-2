import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

// Estrutura para representar as propriedades de um obstáculo
class ObstacleData {
  final double widthInPixels = 45;
  double heightInPixels;
  Vector2 position;
  double intervalInSeconds = 3;
  ObstacleData({
    required this.heightInPixels,
    required this.position,
  });
}

class Obstacle extends SpriteComponent {
  late ObstacleData obstacleData;

  double meupau = (Random().nextDouble() * (0.9 - 0.1)) + 0.1;
}
