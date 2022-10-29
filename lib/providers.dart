import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsoy/models/choice.dart';
import 'package:fsoy/models/game.dart';

final gameProvider = ChangeNotifierProvider((ref) => Game());

final choicesProvider = ChangeNotifierProvider((ref) => Choice(points: 0, position: 0, description: ''));