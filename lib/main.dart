import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Padding(
        padding: EdgeInsets.all(32.0),
        child: SquareAnimation(),
      ),
    );
  }
}

class SquareAnimation extends StatefulWidget {
  const SquareAnimation({super.key});

  @override
  State<SquareAnimation> createState() => SquareAnimationState();
}

class SquareAnimationState extends State<SquareAnimation> {
  static const _squareSize = 50.0;

  Alignment alignment = Alignment.center; // Start from center

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedAlign(
          alignment: alignment,
          duration: const Duration(seconds: 1),
          curve: Curves.linear,
          child: Container(
            width: _squareSize,
            height: _squareSize,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: alignment != Alignment.centerRight
                  ? () {
                      setState(() {
                        alignment = Alignment.centerRight;
                      });
                    }
                  : null, // Disable if already at the right
              child: const Text('Right'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: alignment != Alignment.centerLeft
                  ? () {
                      setState(() {
                        alignment = Alignment.centerLeft;
                      });
                    }
                  : null, // Disable if already at the left
              child: const Text('Left'),
            ),
          ],
        ),
      ],
    );
  }
}
