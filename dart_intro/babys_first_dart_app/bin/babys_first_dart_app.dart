import 'dart:io';

import 'package:babys_first_dart_app/prompt_helpers.dart';

void main(List<String> arguments) {
  var name = promptForName();

  var gpa = promptForDouble('What is your GPA?');

  while (gpa > 4 || gpa < 0) {
    gpa = promptForDouble('What is your GPA? (0 < gpa < 4)');
  }

  stdout.writeln('Hello $name, congrats on your $gpa GPA');
}
