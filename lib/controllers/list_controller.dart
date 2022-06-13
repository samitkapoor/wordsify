import 'dart:async';

import 'package:flutter/material.dart';

class ListController extends ChangeNotifier {
  List<String> wordsFound = [];
  bool isLoading = true;
  int counter = 0;

  void reset() {
    counter = 0;
    wordsFound = [];
    isLoading = true;
    notifyListeners();
  }

  void onSubmit(String value) {
    wordsFound = [
      'faint',
      'jelly',
      'roach',
      'diner',
      'group',
      'mummy',
      'booty',
      'rajah',
      'exile',
      'exelt',
      'learn',
      'moist',
      'wound',
      'audio',
      'glent',
      'foyer',
    ];

    load();
    notifyListeners();
  }

  void load() {
    Timer timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        wordsFound.add('value');
        counter++;
        print('added');
        if (counter == 10) {
          timer.cancel();
          isLoading = false;
        }

        notifyListeners();
      },
    );
  }
}
