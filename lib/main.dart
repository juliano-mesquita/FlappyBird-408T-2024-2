import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flame/game.dart';
import 'package:flappy_bat/game/flappy_game.dart';
import 'package:flutter/material.dart';

import 'game/flappy_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GameWidget(game: FlappyGame()),
  );
}