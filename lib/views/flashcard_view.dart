import 'package:flutter/material.dart';

class FlashCardView extends StatelessWidget {
  final String text;
  const FlashCardView({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      elevation: 10,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
