import 'package:flutter/material.dart';
import 'package:fading_widget_animation/core/fading_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wordsify/controllers/search_controller.dart';

class MyForm extends StatelessWidget {
  MyForm({super.key});
  SearchController searchcontroller = SearchController();

  OutlineInputBorder outlineInputBorder({Color color = Colors.white}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: color,
          width: 5,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FadingWidgetAnimator(
      duration: const Duration(seconds: 1),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('wordsify'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      border: outlineInputBorder(),
                      errorBorder: outlineInputBorder(),
                      enabledBorder: outlineInputBorder(),
                      focusedBorder: outlineInputBorder(
                        color: Theme.of(context).appBarTheme.backgroundColor
                            as Color,
                      ),
                      disabledBorder: outlineInputBorder(),
                      focusedErrorBorder: outlineInputBorder(),
                    ),
                    cursorHeight: 25,
                    cursorColor: Colors.white,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 25),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorWidth: 2,
                    keyboardType: TextInputType.text,
                    onChanged: (val) {
                      searchcontroller.setQuery(val);
                    },
                    validator: (query) {
                      if (query!.isEmpty) {
                        return "This field cannot be empty";
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () {},
                        child: Text(
                          'Go',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
