import 'package:flutter/material.dart';

class AttributeCard extends StatelessWidget {
  final String name;
  final int value;

  const AttributeCard({
    super.key,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 10,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFF111827),

        borderRadius: BorderRadius.circular(15),

        border: Border.all(
          color: Colors.white12,
        ),
      ),

      child: Column(
        children: [
          Text(
            name,

            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 12,
              color: Colors.white54,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            '$value',

            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}