import 'package:flutter/material.dart';

class NewJobGridEntry extends StatelessWidget {
  final Widget child;

  const NewJobGridEntry({Key? key, required Widget this.child})
      : super(key: key);

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
