import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ObstacleData extends SpriteComponent {
  ObstacleData({required super.position});
}

class GameComponent extends PositionComponent {
  double get bottomY => middlePoint + offset;
  double get topY => middlePoint - offset;
  int middlePoint = 0;

  double offset = 100;
  late final max = (size.y * 0.8).round();
  late final min = (size.y * 0.2).round();
  late ObstacleData top;
  late ObstacleData bottom;

  bool isInitialized = false;

  GameComponent({super.size});

  @override
  FutureOr<void> onLoad() async {
    final topImage = await Flame.images.load('Estaca.png');
    final bottomImage = await Flame.images.load('Estaca.png');

    top = ObstacleData(position: Vector2(size.x, topY));
    top.sprite = Sprite(topImage);
    top.angle = 180 * (pi / 180);
    bottom = ObstacleData(position: Vector2(size.x, bottomY));
    bottom.sprite = Sprite(bottomImage);

    add(top);
    add(bottom);
    isInitialized = true;
  }

  FutureOr<void> move(double position, double endOfScreen) {
    if (isInitialized) {
      top.position.x -= position;
      bottom.position.x -= position;
      debugPrint('positionX: ${top.position.x}');
      debugPrint('positionY: ${top.position.y}');
      debugPrint('positionY: ${bottom.position.y}');

      if (top.position.x <= 0) {
        middlePoint = Random().nextInt(max - min) + min;
        top.position.x = endOfScreen + 87;
        bottom.position.x = endOfScreen;

        top.position.y = topY;
        bottom.position.y = bottomY;
      }
    }
  }
}
