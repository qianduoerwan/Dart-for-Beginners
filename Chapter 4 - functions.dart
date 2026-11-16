void main() {
  print('=== 1. Multiplying Numbers ===');
  final num wholeProduct = multiply(6, 7);
  final num decimalProduct = multiply(2.5, 3);
  print('6 * 7 = $wholeProduct');
  print('2.5 * 3 = $decimalProduct');

  print('\n=== 2. Local Functions ===');
  final String name = 'Sam';

  String greet() {
    return 'Hi, $name';
  }

  final String greeting = greet();
  print(greeting);

  print('\n=== 3. Recursion ===');
  final int factorialResult = factorial(5);
  print('5! = $factorialResult');

  print('\n=== 4. Returning Two Strings ===');
  final (String, String) parts = splitAtFirstSpace('Dart is fun');
  final String first = parts.$1;
  final String rest = parts.$2;
  print('First part: "$first"');
  print('Second part: "$rest"');

  print('\n=== 5. Passing Arguments ===');
  int number = 10;
  List<String> words = ['original'];
  print('Before the call: number = $number, words = $words');

  final int returnedNumber = testParameterPassing(number, words);

  print('Returned number: $returnedNumber');
  print('After the call: number = $number, words = $words');

  print('\n=== 6. Variable Scope ===');
  final int score = 10;
  if (score > 0) {
    // print(message); // Error: message is declared below
    final String message = 'Positive score';
    print(message);
  }
  // print(message); // Error: message is outside its block
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
  final String trimmed = text.trim();
  final int space = trimmed.indexOf(' ');

  if (space == -1) {
    return (trimmed, '');
  }

  final String first = trimmed.substring(0, space);
  final String rest = trimmed.substring(space + 1).trimLeft();
  return (first, rest);
}

int testParameterPassing(int number, List<String> words) {
  number = 99;

  // Add to the shared list
  words.add('added inside');

  // Point the parameter at a new list
  words = ['replacement'];
  print('Inside the function: number = $number, words = $words');
  return number;
}
