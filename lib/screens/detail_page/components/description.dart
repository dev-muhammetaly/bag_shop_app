import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        decorationStyle: TextDecorationStyle.dotted,
      ),
    );
  }
}
