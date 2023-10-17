import 'dart:math';

import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/atributes_list/presentation/atributes_list_component.dart';
import 'package:flutter/material.dart';

class MillenniumFalconLoadingIndicator extends StatefulWidget {
  const MillenniumFalconLoadingIndicator({super.key});

  @override
  State<MillenniumFalconLoadingIndicator> createState() =>
      _MillenniumFalconLoadingIndicatorState();
}

class _MillenniumFalconLoadingIndicatorState
    extends State<MillenniumFalconLoadingIndicator>
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
