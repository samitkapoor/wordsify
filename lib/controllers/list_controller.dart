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

  int factorial(int n) {
    int f = 1;
    for (int i = 2; i <= n; i++) {
      f = f * i;
    }

    return f;
  }

  Future<void> addPermutations(String letters) async {
    int n = letters.length;
    int f = factorial(n);

    for (int i = 0; i < f; i++) {
      String sb = letters;
      String result = "";
      int temp = i;

      for (int div = n; div >= 1; div--) {
        int q = temp ~/ div;
        int r = temp % div;

        result = result + sb[r];
        sb = sb.substring(0, r) + sb.substring(r + 1);

        temp = q;
      }

      englishWords.add(result);
    }
  }

  void onSubmit(String value) async {
    await addPermutations(value);

    for (int i = 0; i < englishWords.length; i++) {
      bool flag = await isItAWord(englishWords[i]);

      if (flag) {
        wordsFound.add(englishWords[i]);
        notifyListeners();
      }
    }

    isLoading = false;
    notifyListeners();
  }
}
