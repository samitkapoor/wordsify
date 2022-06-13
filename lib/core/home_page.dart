import 'package:fading_widget_animation/core/fading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsify/controllers/list_controller.dart';
import 'package:wordsify/core/my_form.dart';
import 'package:wordsify/core/my_list.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return FadingWidgetAnimator(
      duration: const Duration(seconds: 1),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('wordsify'),
        ),
        body: Consumer<ListController>(
          builder: (context, listController, child) {
            if (listController.wordsFound.isEmpty) {
              return MyForm();
            } else {
              return MyList();
            }
          },
        ),
      ),
    );
  }
}
