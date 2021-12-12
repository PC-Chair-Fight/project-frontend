import 'package:flutter/material.dart';

class CardGridEntry extends StatelessWidget {
  final Widget child;
  final double aspectRatio;

  const CardGridEntry({
    Key? key,
    required double this.aspectRatio,
    required Widget this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: AspectRatio(
        aspectRatio: 1.78,
        child: child,
      ),
    );
  }
}
