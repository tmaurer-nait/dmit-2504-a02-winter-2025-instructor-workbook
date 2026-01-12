import 'dart:io';

String promptForName() {
  // Write the prompt to the console
  stdout.writeln('What is your name?');

  // Read the user input
  var name = stdin.readLineSync();

  // return the user input with null safety check
  return name ?? '';
}

double promptForDouble(String msg) {
  stdout.writeln(msg);

  var input = stdin.readLineSync();

  var isValid = false;
  late double value;

  while (!isValid) {
    try {
      value = double.parse(input!);
      isValid = true;
    } catch (e) {
      stdout.writeln('Please enter a number');
      input = stdin.readLineSync();
    }
  }

  return value;
}
