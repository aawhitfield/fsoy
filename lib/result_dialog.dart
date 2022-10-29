import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsoy/providers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

enum GameResult { win, lose }

class ResultDialog extends ConsumerWidget {
  const ResultDialog(this.result, {
    Key? key,
  }) : super(key: key);

  final GameResult result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double quarterWidth = MediaQuery.of(context).size.width / 4;
    bool youWin = (result == GameResult.win);

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              // 1/4 the width of the screen
              width: quarterWidth,
              height: quarterWidth,
              child: Lottie.asset((youWin) ? 'assets/win.json' : 'assets/lose.json')),
          const SizedBox(height: 16.0),
          Text(
            (youWin) ? 'You Win!' : 'You Lose!',
            style: GoogleFonts.righteous(
                textStyle: TextStyle(
                    fontSize: 40, color: Theme.of(context).primaryColor)),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            ref.read(gameProvider).reset();
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
