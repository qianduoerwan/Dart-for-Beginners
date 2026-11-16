void main() {
  final wholeProduct = multiply(6, 7);
  final decimalProduct = multiply(2.5, 3);
  print('6 * 7 = $wholeProduct');
  print('2.5 * 3 = $decimalProduct');

  final factorialResult = factorial(5);
  print('\n5! = $factorialResult');

  final parts = splitAtFirstSpace('Dart is fun');
  final first = parts.$1;
  final rest = parts.$2;
  print('\nFirst part: "$first"');
  print('Second part: "$rest"');

  int number = 10;
  List<String> words = ['original'];
  print('\nBefore the call: number = $number, words = $words');

  final returnedNumber = testParameterPassing(number, words);

  print('Returned number: $returnedNumber');
  print('After the call: number = $number, words = $words');
}

num multiply(num first, num second) {
  return first * second;
}

int factorial(int n) {
  if (n < 0) {
    throw ArgumentError.value(n, 'n', 'Use a non-negative integer');
  }

  if (n == 0) {
    return 1;
  }

  return n * factorial(n - 1);
}

(String, String) splitAtFirstSpace(String text) {
  final trimmed = text.trim();
  final space = trimmed.indexOf(' ');

  if (space == -1) {
    return (trimmed, '');
  }

  final first = trimmed.substring(0, space);
  final rest = trimmed.substring(space + 1).trimLeft();
  return (first, rest);
}

int testParameterPassing(int number, List<String> words) {
  number = 99;

  // Change the list that main() also uses.
  words.add('added inside');

  // Now point this parameter at a different list.
  words = ['replacement'];
  print('Inside the function: number = $number, words = $words');
  return number;
}
