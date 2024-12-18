import 'package:flutter/material.dart';

// Widget principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game App',
      home: const GameScreen(),
    );
  }
}
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: PauseMenuClipper(),
          child: Container(
            width: 400,
            height: 600,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(
                  onPressed: () => Navigator.of(context).pop(),
                  iconPath: 'assets/imagens/play.png',
                ),
                const SizedBox(height: 40),

                _buildButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const GameScreen()),
                    );
                  },
                  iconPath: 'assets/imagens/restart.png',
                ),
                const SizedBox(height: 40),

                _buildButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const MainMenuScreen()),
                    );
                  },
                  iconPath: 'assets/imagens/exit.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildButton(
      {required VoidCallback onPressed, required String iconPath}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/imagens/botão-1.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Image.asset(
              iconPath,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const GameScreen()),
            );
          },
          child: const Text('Iniciar Jogo'),
        ),
      ),
    );
  }
}
class PauseMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(45, 0);
    path.lineTo(size.width - 45, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 45);
    path.lineTo(size.width, size.height - 45);
    path.quadraticBezierTo(
        size.width, size.height, size.width - 45, size.height);
    path.lineTo(45, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 45);
    path.lineTo(0, 45);
    path.quadraticBezierTo(0, 0, 45, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
