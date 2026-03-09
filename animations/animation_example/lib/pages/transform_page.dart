import 'package:flutter/material.dart';

// Needed for pi
import 'dart:math' as math;

class TransformPage extends StatelessWidget {
  const TransformPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transform Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Rotation Transform
            Transform.rotate(
              angle: 45 * math.pi / 180, // converting from degrees to radians
              child: Text('Rotation', style: TextStyle(fontSize: 30)),
            ),
            SizedBox(height: 100),
            // Scale Transform
            Transform.scale(
              // scale: 3, // combination of x and y
              scaleY: 0.5,
              scaleX: 2,
              child: Text('Scale', style: TextStyle(fontSize: 30)),
            ),
            SizedBox(height: 100),
            // Translation Transform
            Transform.translate(
              // x and y offset (positive is right, down)
              offset: Offset(60, -200),
              child: Text('Translate', style: TextStyle(fontSize: 30)),
            ),

            // Nested Transform
            // When doing nested transforms be cautious of how they impact each other
            Transform.rotate(
              angle: 45 * math.pi / 180,
              child: Transform.scale(
                scale: 0.5,
                child: Transform.translate(
                  offset: Offset(50, 100),
                  child: Text('Nested', style: TextStyle(fontSize: 30)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
