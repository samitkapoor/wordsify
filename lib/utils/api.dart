import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wordsify/constants/dictionary_api.dart';

Future<bool> isItAWord(String word) async {
  String url = dictionaryApi + word;

  var response = await http.get(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  var extractedData = await json.decode(response.body);

  if (extractedData is List) {
    return Future.value(true);
  }

  return Future.value(false);
}
