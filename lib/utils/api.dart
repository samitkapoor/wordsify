import 'package:wordsify/constants/a_lot_of_words.dart';

bool isItAWord(String word) {
  if (words.contains(word)) {
    return true;
  }

  return false;
}
