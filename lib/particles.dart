import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CollisionEffect extends StatefulWidget {
  final Offset collisionPoint;

  const CollisionEffect({Key? key, required this.collisionPoint}) : super(key: key);

  @override
  _CollisionEffectState createState() => _CollisionEffectState();
}

class _CollisionEffectState extends State<CollisionEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    // Configura a animação
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )
      ..addListener(() {
        setState(() {
          _particles.removeWhere((p) => p.opacity <= 0);
          for (final particle in _particles) {
            particle.update();
          }
        });
      })
      ..forward();

    // Gera partículas
    for (int i = 0; i < 20; i++) {
      _particles.add(Particle(
        position: widget.collisionPoint,
        velocity: Offset(
          (_random.nextDouble() - 0.5) * 6,
          (_random.nextDouble() - 0.5) * 6,
        ),
        radius: _random.nextDouble() * 5 + 2,
        color: Colors.red,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CollisionPainter(particles: _particles),
      child: Container(),
    );
  }
}

class CollisionPainter extends CustomPainter {
  final List<Particle> particles;

  CollisionPainter({required this.particles});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (final particle in particles) {
      paint.color = particle.color.withOpacity(particle.opacity);
      canvas.drawCircle(particle.position, particle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Particle {
  Offset position;
  Offset velocity;
  double radius;
  Color color;
  double opacity;

  Particle({
    required this.position,
    required this.velocity,
    required this.radius,
    required this.color,
  }) : opacity = 1.0;

  void update() {
    position += velocity;
    opacity -= 0.02; // As partículas desaparecem aos poucos
  }
}