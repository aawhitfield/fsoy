import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsoy/chance_card.dart';
import 'package:fsoy/providers.dart';

class GameBoard extends ConsumerStatefulWidget {
  const GameBoard({super.key, required this.title});

  final String title;

  @override
  ConsumerState<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends ConsumerState<GameBoard> {
  @override
  Widget build(BuildContext context) {
    bool isV2 = ref.watch(gameProvider).isV2;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // a reset button that is circular and shows a reset icon
                    ElevatedButton.icon(
                        // rounded corners
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                        onPressed: () {
                          ref.read(gameProvider).reset();
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('Reset')),

                    // V2 iOS style toggle switch with a label that says V2
                    Row(
                      children: [
                        const Text('V2'),
                        Switch(
                          value: isV2,
                          onChanged: (value) {
                            ref.read(gameProvider).toggleVersion();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // a gridview of 15 elevated buttons that are 5 columns and 3 rows and that say 'Pick Me',
              GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3,
                  children: List.generate(
                      15,
                      (index) => ElevatedButton(
                          onPressed: () {
                            // open an alert dialog
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const ChanceCard();
                                });
                          },
                          child: const Text('Pick Me',
                              style: TextStyle(fontSize: 20))))),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SizedBox(
                  // height that is 1/3 of the screen height
                  height: MediaQuery.of(context).size.height / 6,
                  child: ListView.builder(
                      // 8 rectangles that are 100x100 and that say 'I am a rectangle'
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 11,
                      itemBuilder: (context, index) {
                        TextStyle style = const TextStyle(fontSize: 20);
                        late Widget child;
                        switch (index) {
                          case 0:
                            child = Text('Hell', style: style);
                            break;
                          case 10:
                            child = Text('Heaven', style: style);
                            break;
                          case 5:
                            child = Text('X', style: style);
                            break;
                          default:
                            child = Container();
                        }

                        return Container(
                          height: 100,
                          width: 100,
                          // black border
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.black,
                            width: 2,
                          )),
                          child: Center(
                            child: child,
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
