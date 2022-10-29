import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsoy/models/choice.dart';
import 'package:fsoy/providers.dart';
import 'package:fsoy/result_dialog.dart';

class ChanceCard extends ConsumerWidget {
  const ChanceCard(
    this.choice, {
    Key? key,
  }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String title = (choice.points > 0) ? 'A Righteous Choice' : 'You Sinned!';
    bool isRighteous = (choice.points > 0);
    String decision = (isRighteous)
        ? ' Move forward ${choice.points} space.'
        : ' Move back ${choice.points.abs()} spaces.';
    String description = choice.description + decision;

    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        TextButton(
            onPressed: () {
              if (choice.points > 0) {
                ref.read(gameProvider).move(choice.points);
              } else {
                ref.read(gameProvider).goBack(choice.points
                    .abs()); // don't want to subtract a NEGATIVE number now do we 😉
              }
              int position = ref.read(gameProvider).position;
              Navigator.pop(context);
              if (position <= 0) {
                // show an alert dialog that says 'You Lose!'
                showDialog(
                  context: context,
                  builder: (context) {
                    return const ResultDialog(GameResult.lose);
                  },
                );
              } else if (position >= 10) {
                // show an alert dialog that says 'You Win!'
                showDialog(
                  context: context,
                  builder: (context) {
                    return const ResultDialog(GameResult.win);
                  },
                );
              }
            },
            child: const Text('OK'))
      ],
    );
  }
}
