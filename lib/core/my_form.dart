import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wordsify/controllers/list_controller.dart';
import 'package:wordsify/controllers/search_controller.dart';

class MyForm extends StatelessWidget {
  MyForm({super.key, required this.formKey});

  GlobalKey<FormState> formKey;

  SearchController searchController = SearchController();

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
    ListController listController = Provider.of<ListController>(context);

    return Container(
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
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter the letters: ',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 22),
                ),
              ),
              const SizedBox(height: 5),
              Form(
                key: formKey,
                child: TextFormField(
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
                  cursorHeight: 22,
                  cursorColor: Colors.white,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorWidth: 2,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: listController.onSubmit,
                  onChanged: (val) {
                    searchController.setQuery(val);
                  },
                  validator: (query) {
                    if (query!.isEmpty) {
                      return "This field cannot be empty";
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        listController.onSubmit(searchController.query);
                      }
                    },
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
    );
  }
}
