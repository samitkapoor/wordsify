import 'package:flutter/material.dart';

import 'package:wordsify/core/homepage.dart';

void main() {
  runApp(const Wordsify());
}

class Wordsify extends StatelessWidget {
  const Wordsify({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
