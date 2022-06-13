import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UpDownAnimator extends StatefulWidget {
  UpDownAnimator({required this.color, required this.startAfter, super.key});

  Duration startAfter;

  Color color;

  @override
  State<UpDownAnimator> createState() => _UpDownAnimatorState();
}

class _UpDownAnimatorState extends State<UpDownAnimator>
    with SingleTickerProviderStateMixin {
  Animation? firstDot;

  AnimationController? firstDotController;

  @override
  void initState() {
    firstDotController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));

    firstDot = Tween<double>(begin: 25, end: 0).animate(
        CurvedAnimation(parent: firstDotController!, curve: Curves.linear));

    Future.delayed(widget.startAfter).then((value) {
      firstDotController?.repeat(reverse: true);
    });
    super.initState();
  }

  @override
  void dispose() {
    firstDotController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: firstDotController!,
      builder: (context, child) {
        return Container(
          height: firstDot!.value + 5,
          alignment: Alignment.bottomCenter,
          child: child,
        );
      },
      child: CircleAvatar(
        backgroundColor: widget.color,
        radius: 5,
      ),
    );
  }
}
