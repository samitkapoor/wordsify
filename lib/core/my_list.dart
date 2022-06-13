import 'package:fading_widget_animation/core/fading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsify/controllers/list_controller.dart';

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    ListController listController =
        Provider.of<ListController>(context, listen: true);

    return Container(
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: listController.wordsFound.length,
            itemBuilder: (context, index) => FadingWidgetAnimator(
              startAfter: Duration(seconds: 1 + index),
              child: Text(
                listController.wordsFound[index],
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 22,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
