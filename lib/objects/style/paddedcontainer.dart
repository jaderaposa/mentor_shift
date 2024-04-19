import 'package:flutter/material.dart';

class PaddedContainer extends StatelessWidget {
  final Widget child;

  const PaddedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0), // adjust padding as needed
      child: child,
    );
  }
}
