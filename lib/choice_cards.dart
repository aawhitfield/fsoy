import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsoy/chance_card.dart';
import 'package:fsoy/models/choice.dart';
import 'package:fsoy/providers.dart';

// a gridview of 15 elevated buttons that are 5 columns and 3 rows and that say 'Pick Me',
class ChoiceCards extends ConsumerStatefulWidget {
  const ChoiceCards({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ChoiceCards> createState() => _ChoiceCardsState();
}

class _ChoiceCardsState extends ConsumerState<ChoiceCards> {
  late List<Choice> choices;

  @override
  void initState() {
    choices = ref.read(gameProvider).choices;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: 5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 3,
        children: List.generate(15, (index) {
          List<bool> availableToChoose =
              ref.watch(gameProvider).availableToChoose;
          bool canSelect = availableToChoose[index];

          return (canSelect)
              ? ElevatedButton(
                  onPressed: () async {
                    // open an alert dialog
                    await showDialog(
                        context: context,
                        builder: (context) {
                          Choice choice = choices[index];
                          return ChanceCard(choice);
                        });
                    // refresh the state of the gameboard
                    ref.read(gameProvider).choose(index);
                  },
                  child: const Text('Pick Me', style: TextStyle(fontSize: 20)))
              : Container();
        }));
  }
}
