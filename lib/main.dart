import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:wordsify/controllers/list_controller.dart';
import 'package:wordsify/core/home_page.dart';
import 'package:wordsify/core/my_form.dart';

void main() {
  runApp(const Wordsify());
}

class Wordsify extends StatelessWidget {
  const Wordsify({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ListController();
      },
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff1D1E18),
          appBarTheme: AppBarTheme(
            backgroundColor: const Color(0xff1B9AAA),
            centerTitle: true,
            titleTextStyle: GoogleFonts.aBeeZee(
              color: Colors.black,
              fontSize: 22,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
            ),
          ),
          textTheme: TextTheme(
            headline3: GoogleFonts.openSans(
              color: const Color(0xffE2B1B1),
            ),
            headline4: GoogleFonts.openSans(
              color: const Color(0xffA3F7B5),
            ),
          ),
        ),
        home: Homepage(),
      ),
    );
  }
}
