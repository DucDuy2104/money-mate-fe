import 'package:flutter/material.dart';

class MoneyMateLogo extends StatelessWidget {
  const MoneyMateLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            Colors.white,
            Color.fromARGB(255, 0, 50, 81), 
            Color.fromARGB(255, 62, 186, 244),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: const Text(
        "Money Mate",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.1, 
          color: Colors.white, 
        ),
      ),
    );
  }
}