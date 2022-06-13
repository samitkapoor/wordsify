import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wordsify/components/up_down_animation.dart';

class LoadingMoreAnimationWidget extends StatelessWidget {
  const LoadingMoreAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UpDownAnimator(
            color: Colors.blue,
            startAfter: const Duration(milliseconds: 0),
          ),
          const SizedBox(width: 10),
          UpDownAnimator(
            color: Colors.white,
            startAfter: const Duration(milliseconds: 400),
          ),
          const SizedBox(width: 10),
          UpDownAnimator(
            color: Colors.green,
            startAfter: const Duration(milliseconds: 800),
          ),
        ],
      ),
    );
  }
}
