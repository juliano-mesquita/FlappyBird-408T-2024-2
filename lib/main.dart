import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flame/game.dart';
import 'package:flappy_bat/game/flappy_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../components/scoreboard_modal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kDebugMode) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatelessWidget {
  final FlappyGame game = FlappyGame();

  GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GameWidget(game: game),
        Positioned(
          top: 30,
          right: 20,
          child: FloatingActionButton(
            onPressed: () => _openScoreboard(context),
            backgroundColor: Colors.amber,
            child: const Icon(Icons.leaderboard, color: Colors.black),
          ),
        ),
      ],
    );
  }

  void _openScoreboard(BuildContext context) {
    //TODO buscar score do banco

    final scores = [
      {'name': 'Jogador 1', 'score': 4500},
      {'name': 'Jogador 2', 'score': 4300},
      {'name': 'Jogador 3', 'score': 4100},
      {'name': 'Jogador 4', 'score': 3900},
      {'name': 'Jogador 5', 'score': 3700},
      {'name': 'Jogador 6', 'score': 6969},
      {'name': 'Jogador 7', 'score': 3300},
      {'name': 'Jogador 8', 'score': 3100},
      {'name': 'Jogador 9', 'score': 2900},
      {'name': 'Jogador 10', 'score': 9696},
    ];

    ScoreboardModal.show(context, scores);
  }
}
