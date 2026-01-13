import 'package:change_counter/change_helpers.dart';

void main(List<String> arguments) {
  var counts = promptUserForCoins();
  var total = getTotal(counts);

  print('Your total change is \$${total / 100}');
}
