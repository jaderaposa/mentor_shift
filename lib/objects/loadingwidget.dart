import 'package:flutter/material.dart';

enum UserRole { mentee, mentor }

class LoadingWidget extends StatelessWidget {
  final UserRole role;

  const LoadingWidget({Key? key, required this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize background color as transparent to ensure it has a value
    Color backgroundColor = Colors.transparent;
    // Initialize background gradient as null
    LinearGradient? backgroundGradient;

    switch (role) {
      case UserRole.mentee:
        backgroundColor = const Color(0xFF4C9A91); // Example color for mentee
        break;
      case UserRole.mentor:
        backgroundColor = const Color(0xFF0B6E6D); // Example color for mentor
        break;
      default:
        // Correctly setting the backgroundGradient in the default case
        backgroundGradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0080B7), // Top color
            Color(0xFF0B8274), // Bottom color
          ],
        );
    }

    return Container(
      // Use background color or gradient based on what's available
      decoration: backgroundGradient != null
          ? BoxDecoration(gradient: backgroundGradient)
          : BoxDecoration(color: backgroundColor),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
