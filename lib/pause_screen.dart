import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool _isPaused = false;

  void _togglePause() {
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _restartGame() {
    setState(() {
      _isPaused = false;
    });
  }

  void _exitToMenu() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MainMenuScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          if (_isPaused)
            Positioned.fill(
              child: Image.asset(
                'assets/imagens/img_de_fundo.png', 
                fit: BoxFit.cover,
              ),
            ),
          Center(
            child: Text(
              _isPaused ? 'Game Paused' : 'Game Running',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          if (_isPaused)
            Center(
              child: ClipPath(
                clipper: PauseMenuClipper(),
                child: Container(
                  width: 400,
                  height: 830,
                  decoration: BoxDecoration(
                    color: Colors.white, // Fundo do menu de pausa
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 1,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Botão para Continuar o Jogo
                      _buildPauseButton(_togglePause, 'play.png'),

                      const SizedBox(height: 40),

                      // Botão para Reiniciar o Jogo
                      _buildPauseButton(_restartGame, 'restart.png'),
                      const SizedBox(height: 40),

                      // Botão para Sair para o Menu Principal
                      _buildPauseButton(_exitToMenu, 'exit.png'),
                    ],
                  ),
                ),
              ),
            ),

          if (_isPaused)
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                // Botão para Fechar o Menu de Pausa
                icon: const Icon(Icons.close, size: 0, color: Colors.black),
                onPressed: _togglePause,
              ),
            ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: _togglePause,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Fundo do botão de pausa
            Image.asset(
              'assets/imagens/botão-1.png', // Alterado para uma imagem de fundo
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            // Sobreposição do botão (ícone de pause)
            Image.asset(
              'assets/imagens/play.png', // Alterado para o ícone de pause
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPauseButton(VoidCallback onPressed, String iconPath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Stack(
          alignment: Alignment.center,
          children: [
            // Fundo do botão
            Image.asset(
              'assets/imagens/botão-1.png', // Fundo do botão
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            // Ícone sobre o fundo (ícone personalizado)
            Image.asset(
              'assets/imagens/$iconPath', // Alterado para aceitar ícones diferentes
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

// CustomClipper para replicar o clip-path
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

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const GameScreen(),
              ),
            );
          },
          // Botão para Iniciar o Jogo no Menu Principal
          child: const Text('Start Game'),
        ),
      ),
    );
  }
}
