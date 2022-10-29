import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Character extends StatelessWidget {
  const Character(this.position, {Key? key}) : super(key: key);

  final int position;

  @override
  Widget build(BuildContext context) {
    if (position == 1 || position == 2) {
      return Lottie.asset('assets/cry.json');
    } else if (position == 3 || position == 4) {
      return Lottie.asset('assets/angry.json');
    } else if (position == 5 || position == 6) {
      return Lottie.asset('assets/middle.json');
    } else if (position == 7 || position == 8) {
      return Lottie.asset('assets/happy.json');
    } else if (position == 9 || position == 10) {
      return Lottie.asset('assets/excited.json');
    } else {
      return Lottie.asset('assets/middle.json');
    }
  }
}
