import 'dart:math';

import 'package:flutter/material.dart';

class DFUMillenniumFalcon extends StatefulWidget {
  const DFUMillenniumFalcon({super.key});

  @override
  State<DFUMillenniumFalcon> createState() => _DFUMillenniumFalconState();
}

class _DFUMillenniumFalconState extends State<DFUMillenniumFalcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool shouldChangeRotationDirection = Random().nextBool();
    final int rotationFactor = shouldChangeRotationDirection ? 2 : -2;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * rotationFactor * pi,
          child: Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.all(5),
            height: 50,
            width: 50,
            child: Image.asset(
              'assets/icons/millennium_falcon.png',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
