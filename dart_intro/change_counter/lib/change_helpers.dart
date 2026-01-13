import 'dart:io';

// Returns an array of coins sorted by face value (p, n, d, q, l, t)
List<int> promptUserForCoins() {
  // Initialize variables
  List<int> output = [];

  var coinTypes = [
    'pennies',
    'nickels',
    'dimes',
    'quarters',
    'loonies',
    'toonies',
  ];

  // Loop through coin types
  for (var coinType in coinTypes) {
    //  Prompt user for coin count
    stdout.writeln("How many $coinType do you have?");
    var input = stdin.readLineSync();

    //  Validate input is int
    late int count;

    try {
      count = int.parse(input!);
    } catch (e) {
      throw Exception('User did not enter a number');
    }

    //  Validate input is positive
    if (count < 0) {
      throw Exception('User entered a negative number');
    }
    //  Add to output list
    output.add(count);
  }

  // Return output list
  return output;
}

// Returns a total value of coins (in cents), given an ordered list of coin counts
int getTotal(List<int> changeCounts) {
  var total = 0;

  // var dict = {1: 5, 5: 10, 10: 0, 25: 0, 100: 10, 200: 4};

  // for (var key in dict.keys){
  //   total += key * dict[key]!;
  // }

  total += changeCounts[0];
  total += changeCounts[1] * 5;
  total += changeCounts[2] * 10;
  total += changeCounts[3] * 25;
  total += changeCounts[4] * 100;
  total += changeCounts[5] * 200;

  return total;
}
