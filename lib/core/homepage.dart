import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'wordsify',
          style: GoogleFonts.aBeeZee(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
