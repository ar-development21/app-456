import 'package:flutter/material.dart';

class ThinkingDots extends StatefulWidget {
  const ThinkingDots({super.key});

  @override
  State<ThinkingDots> createState() => _ThinkingDotsState();
}

class _ThinkingDotsState extends State<ThinkingDots> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.5).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Interval(i * 0.2, 0.6 + i * 0.2, curve: Curves.easeInOut),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              "•",
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
          ),
        );
      }),
    );
  }
}