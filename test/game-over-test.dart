import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lib/game-over.dart'; // 

void main() {
  testWidgets('Verifica score', (WidgetTester tester) async {
    const int testScore = 12345;

   
    await tester.pumpWidget(
      MaterialApp(
        home: GameOverScreen(
          score: testScore,
          onRetry: () {},
          onExit: () {},
        ),
      ),
    );

    
    expect(find.text('Score: $testScore'), findsOneWidget);
  });

 
  testWidgets('Verifica Retry e Exit', (WidgetTester tester) async {
    bool retryPressed = false;
    bool exitPressed = false;

    
    await tester.pumpWidget(
      MaterialApp(
        home: GameOverScreen(
          score: 0,
          onRetry: () {
            retryPressed = true;
          },
          onExit: () {
            exitPressed = true;
          },
        ),
      ),
    );

    
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();
    expect(retryPressed, true);

   
    await tester.tap(find.byIcon(Icons.exit_to_app));
    await tester.pump();
    expect(exitPressed, true);
  });

   
  testWidgets('Verifica tela', (WidgetTester tester) async {
    const int testScore = 99999;

    
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: Size(320, 480)),
          child: GameOverScreen(
            score: testScore,
            onRetry: () {},
            onExit: () {},
          ),
        ),
      ),
    );
    expect(find.text('Score: $testScore'), findsOneWidget);

   
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: Size(1080, 1920)),
          child: GameOverScreen(
            score: testScore,
            onRetry: () {},
            onExit: () {},
          ),
        ),
      ),
    );
    expect(find.text('Score: $testScore'), findsOneWidget);
  });
}
