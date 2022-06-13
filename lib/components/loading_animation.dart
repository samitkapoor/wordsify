import 'package:flutter/material.dart';

class LoadingMoreAnimationWidget extends StatefulWidget {
  const LoadingMoreAnimationWidget({super.key});

  @override
  State<LoadingMoreAnimationWidget> createState() =>
      _LoadingMoreAnimationWidgetState();
}

class _LoadingMoreAnimationWidgetState extends State<LoadingMoreAnimationWidget>
    with TickerProviderStateMixin {
  Animation? firstDot;
  Animation? secondDot;
  Animation? thirdDot;

  AnimationController? firstDotController;
  AnimationController? secondDotController;
  AnimationController? thirdDotController;

  @override
  void initState() {
    firstDotController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    secondDotController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    thirdDotController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    firstDot = Tween<double>(begin: 50, end: 0).animate(
        CurvedAnimation(parent: firstDotController!, curve: Curves.linear));
    secondDot = Tween<double>(begin: 50, end: 0).animate(
        CurvedAnimation(parent: secondDotController!, curve: Curves.linear));
    thirdDot = Tween<double>(begin: 50, end: 0).animate(
        CurvedAnimation(parent: thirdDotController!, curve: Curves.linear));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
