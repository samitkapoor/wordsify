import 'package:fading_widget_animation/core/fading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsify/components/loading_animation.dart';
import 'package:wordsify/controllers/list_controller.dart';

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    ListController listController =
        Provider.of<ListController>(context, listen: true);

    return WillPopScope(
      onWillPop: () {
        listController.reset();
        return Future.value(false);
      },
      child: Container(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: listController.wordsFound.length,
              itemBuilder: (context, index) => FadingWidgetAnimator(
                startAfter: Duration(milliseconds: 250 + (index * 150)),
                child: Text(
                  listController.wordsFound[index],
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontSize: 22,
                      ),
                ),
              ),
            ),
            LoadingMoreAnimationWidget(),
          ],
        ),
      ),
    );
  }
}
