import 'dart:convert';
import 'package:flutter/services.dart';

class Person {
  final String acronym;
  final String firstname;
  final String lastname;
  final String imageUrl;
  final List<String> subjects;

  Person({
    required this.acronym,
    required this.firstname,
    required this.lastname,
    required this.imageUrl,
    required this.subjects,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      acronym: json['acronym'] ?? '',
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
      imageUrl: json['image_url'] ?? '',
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
    );
  }

  static Future<List<Person>> readData() async {
    // load from resources path as provided
    final raw =
    await rootBundle.loadString('resources/assets/data/dataset.json');

    // parse json
    final List<dynamic> data = json.decode(raw);

    // simulate DB delay AFTER reading as required (still small)
    await Future.delayed(const Duration(seconds: 1));

    return data.map((e) => Person.fromJson(e as Map<String, dynamic>)).toList();
  }

  String get fullName => '$firstname $lastname';

  @override
  bool operator ==(Object other) {
    return other is Person &&
        other.firstname == firstname &&
        other.lastname == lastname;
  }

  @override
  int get hashCode => Object.hash(firstname, lastname);
}
