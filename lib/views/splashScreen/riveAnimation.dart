import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mynotes/main.dart';
import 'package:rive/rive.dart';

class SimpleAnimation extends StatefulWidget {
  const SimpleAnimation({super.key});

  @override
  State<SimpleAnimation> createState() => _SimpleAnimationState();
}

class _SimpleAnimationState extends State<SimpleAnimation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),(){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ( (context) =>  const HomePage())));
      },
    );
    return const Scaffold(
      body: Center(
        child: RiveAnimation.asset('assets/pencil.riv'),
      ),
    );
  }
}
