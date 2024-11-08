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
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

class SquareAnimationState extends State<SquareAnimation> {
  static const _squareSize = 50.0;

 /// using value notifier to only update the required part of screen rather rebuilding all ui 
  ValueNotifier<double> positionNotifier = ValueNotifier(0.0); 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: positionNotifier,
           builder: (context, postion, child) {
          return Container(
            width: _squareSize,
            height: _squareSize,
            transform: Matrix4.translationValues(postion, 0, 0), // moves only on x axis , not on y and z 
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(),
            ),
          );
        },),
        const SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton(
              onPressed: moveRight,
              child: const Text('Right'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: moveLeft,
              child: const Text('Left'),
            ),
          ],
        ),
      ],
    );
  }
 /// Function for moving the container to right by 100px 
  void moveRight() {

      positionNotifier.value = positionNotifier.value +100; // adding 100px to move to right
    
  } 
 /// Function for moving the container to left by 100px 
  void moveLeft() {
    positionNotifier.value = positionNotifier.value - 100; // decreasing 100 px to move to left
  }
}
