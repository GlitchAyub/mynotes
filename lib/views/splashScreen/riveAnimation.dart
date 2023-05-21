import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mynotes/main.dart';
import 'package:rive/rive.dart';

class SimpleRiveAnimation extends StatefulWidget {
  const SimpleRiveAnimation({Key? key}) : super(key: key);

  @override
  State<SimpleRiveAnimation> createState() => _SimpleRiveAnimationState();
}

class _SimpleRiveAnimationState extends State<SimpleRiveAnimation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 10),
      () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => const HomePage())));
      },
    );
    return const Scaffold(
      body: Center(
        child: RiveAnimation.asset(
         'animate/pencil.riv',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
