import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsoy/models/choice.dart';

class Game extends ChangeNotifier {
  bool isV2 = false;
  int position = 5;
  List<bool> availableToChoose = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true
  ];
  List<Choice> choices = [];

  void toggleVersion() {
    isV2 = !isV2;
    notifyListeners();
  }

  void reset() {
    position = 5;
    isV2 = false;
    availableToChoose = [
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true
    ];
    notifyListeners();
  }

  void move(int spaces) {
    position += spaces;
    notifyListeners();
  }

  void setPosition(int newPosition) {
    position = newPosition;
    notifyListeners();
  }

  void goBack(int spaces) {
    position -= spaces;
    notifyListeners();
  }

  void choose(int choice) {
    availableToChoose[choice] = false;
    notifyListeners();
  }

  Future<List<Choice>> getChoices() async {
    // parse json from choices.json in the assets folder
    // return a list of choices

    final String choiceJSON =
        await rootBundle.loadString('assets/choices.json');
    choices = choiceFromJson(choiceJSON);
    notifyListeners();
    return choices;
  }
}
