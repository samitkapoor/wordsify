import 'package:flutter/material.dart';
import 'package:wordsify/constants/a_lot_of_words.dart';

class ListController extends ChangeNotifier {
  List<String> wordsFound = [];
  bool isLoading = false;
  bool gridScreen = false;

  void reset() {
    wordsFound = [];
    isLoading = false;
    gridScreen = false;
    notifyListeners();
  }

  int factorial(int n) {
    int f = 1;
    for (int i = 2; i <= n; i++) {
      f = f * i;
    }

    return f;
  }

  void getWords(String letters) {
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

      if (result.startsWith('a') ||
          result.startsWith('b') ||
          result.startsWith('c') ||
          result.startsWith('d') ||
          result.startsWith('e') ||
          result.startsWith('f') ||
          result.startsWith('g') ||
          result.startsWith('h') ||
          result.startsWith('i') ||
          result.startsWith('j') ||
          result.startsWith('k') ||
          result.startsWith('l') ||
          result.startsWith('m') ||
          result.startsWith('n')) {
        for (int index = 0; index < wordsOne.length; index++) {
          if (wordsOne[index] == result && !wordsFound.contains(result)) {
            wordsFound.add(result);

            notifyListeners();
            break;
          }
        }
      } else {
        for (int index = 0; index < wordsTwo.length; index++) {
          if (wordsTwo[index] == result && !wordsFound.contains(result)) {
            wordsFound.add(result);
            notifyListeners();
            break;
          }
        }
      }
    }
  }

  void onSubmit(String value) {
    gridScreen = isLoading = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 1)).then((val) {
      getWords(value);
      isLoading = false;
      notifyListeners();
    });
  }
}
