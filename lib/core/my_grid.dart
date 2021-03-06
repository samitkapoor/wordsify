import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fading_widget_animation/core/fading_widget.dart';

import 'package:wordsify/components/loading_animation.dart';
import 'package:wordsify/controllers/list_controller.dart';

class MyGrid extends StatelessWidget {
  const MyGrid({super.key});

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
            GridView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 3 / 1,
              ),
              itemCount: listController.wordsFound.length,
              itemBuilder: (context, index) => FadingWidgetAnimator(
                duration: const Duration(milliseconds: 200),
                child: Text(
                  listController.wordsFound[index],
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontSize: 22,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Consumer<ListController>(builder: (context, listController, child) {
              if (listController.isLoading) {
                return const LoadingMoreAnimationWidget();
              } else {
                String suffix = (listController.wordsFound.length == 1)
                    ? 'result!'
                    : 'results';
                return Text(
                  'Found ${listController.wordsFound.length} $suffix',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
