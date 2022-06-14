import 'package:flutter/material.dart';

import 'package:wordsify/utils/api.dart';

class ListController extends ChangeNotifier {
  List<String> englishWords = [];
  List<String> wordsFound = [];
  bool isLoading = true;

  void reset() {
    wordsFound = [];
    englishWords = [];
    isLoading = true;
    notifyListeners();
  }

  Future<void> addPermutations(String value, String asf) async {
    if (value.isEmpty) {
      englishWords.add(asf);
    }

    for (int i = 0; i < value.length; i++) {
      var ch = value[i];
      String left = value.substring(0, i);
      String right = value.substring(i + 1);

      String roq = left + right;

      addPermutations(roq, asf + ch);
    }
  }

  void onSubmit(String value) async {
    await addPermutations(value, "");

    for (int i = 0; i < englishWords.length; i++) {
      bool flag = await isItAWord(englishWords[i]);

      if (flag) {
        wordsFound.add(englishWords[i]);
        notifyListeners();
      }
    }
  }
}
