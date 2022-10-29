// To parse this JSON data, do
//
//     final choice = choiceFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';

List<Choice> choiceFromJson(String str) => List<Choice>.from(json.decode(str).map((x) => Choice.fromJson(x)));

String choiceToJson(List<Choice> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Choice extends ChangeNotifier{
    Choice({
        required this.position,
        required this.points,
        required this.description,
    });

    int position;
    int points;
    String description;

    factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        position: json["Position"],
        points: json["Points"],
        description: json["Description"],
    );

    Map<String, dynamic> toJson() => {
        "Position": position,
        "Points": points,
        "Description": description,
    };
}
