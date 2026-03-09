import 'package:animation_example/widgets/rainbow_button.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  // Allows us to sync with device refresh rate

  // This will drive all our animations. It goes from 0-1, linearly, over some duration
  late final AnimationController _controller;
  late final Animation _animation;

  var _endVal = 2 * math.pi;

  @override
  void initState() {
    super.initState();

    // Create the controller, link to this widgets ticker, and set duration
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat(); // this ..repeat() is equivalent to the line below
    // _controller.repeat();

    _animation = _controller.drive(CurveTween(curve: Curves.bounceIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Explicit animation using basic controller
            AnimatedBuilder(
              animation: _controller,
              // Any time the animation updates, call the builder function
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: Text(
                    'Animated rotation',
                    style: TextStyle(fontSize: 30),
                  ),
                );
              },
            ),
            SizedBox(height: 100),
            // No longer takes in a controller, now needs a tween and duration
            TweenAnimationBuilder(
              // To get a tween animation to run again, change the end value
              // Not intended to do repeating animations
              tween: Tween<double>(begin: 0, end: _endVal),
              duration: Duration(seconds: 6),
              // value is effectively like controller.value
              // it's the current value of the tween
              builder: (context, value, widget) {
                return Transform.rotate(
                  angle: value,
                  child: Text('Tween builder'),
                );
              },
              onEnd: () => setState(() {
                _endVal = _endVal == 0 ? 2 * math.pi : 0;
              }),
            ),
            SizedBox(height: 100),
            AnimatedBuilder(
              animation: _animation,
              // Any time the animation updates, call the builder function
              builder: (context, child) {
                return Transform.scale(
                  scale: (1 + (_animation.value * 0.5)) as double,
                  child: Text(
                    'Curved animation',
                    style: TextStyle(fontSize: 30),
                  ),
                );
              },
            ),
            SizedBox(height: 100),
            RotationTransition(
              turns: _controller,
              child: Text('Implicit Rotation'),
            ),
            SizedBox(height: 100),
            RainbowButton(child: Text('Button')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.repeat();
          }
        },
      ),
    );
  }
}
