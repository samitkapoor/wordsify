import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyForm extends StatelessWidget {
  MyForm({super.key});

  OutlineInputBorder outlineInputBorder({required Color color}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: color,
          width: 5,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'wordsify',
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    border: outlineInputBorder(color: Colors.white),
                    errorBorder: outlineInputBorder(color: Colors.white),
                    enabledBorder: outlineInputBorder(color: Colors.white),
                    focusedBorder: outlineInputBorder(
                        color: Theme.of(context).appBarTheme.backgroundColor
                            as Color),
                    disabledBorder: outlineInputBorder(color: Colors.white),
                    focusedErrorBorder: outlineInputBorder(color: Colors.white),
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
                  onChanged: (val) {},
                  validator: (query) {
                    if (query!.isEmpty) {
                      return "This field cannot be empty";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
