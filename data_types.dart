void main() {
  print('=== 1. Basic Data Types ===');
  {
    int age = 20;
    int temperature = -5;
    double price = 12.5;
    double height = 1.75;
    String name = 'Alex';
    String message = "Welcome to Dart!";
    bool isStudent = true;
    bool isFinished = false;
    List<String> hobbies = ['reading', 'coding'];
    Map<String, int> scores = {'math': 95, 'science': 90};

    print('Age: $age');
    print('Temperature: $temperature');
    print('Price: $price');
    print('Height: $height');
    print('Name: $name');
    print('Name length: ${name.length}');
    print('Message: $message');
    print('Is student: $isStudent');
    print('Is finished: $isFinished');
    print('Hobbies: $hobbies');
    print('First hobby: ${hobbies[0]}');
    print('Scores: $scores');
    print('Math score: ${scores['math']}');
  }

  print('\n=== 2. Naming Rules and Conventions ===');
  {
    int studentAge = 21;
    String lastName = 'Lee';
    bool hasFinishedHomework = false;

    print('Student age: $studentAge');
    print('Last name: $lastName');
    print('Has finished homework: $hasFinishedHomework');

    // Invalid examples, such as 2students and class, cannot be used as variable declarations
  }

  print('\n=== 3. Understanding Dart\'s Type System ===');
  {
    int number = 10;
    // number = 'ten'; // Error: String cannot be assigned to int

    String greeting = 'Hello';
    var inferredNumber = 10; // Dart infers int

    String name = 'Alex'; // Explicit type annotation
    var age = 20; // Inferred to be int
    dynamic value = 10;
    value = 'Now a string';

    print('Number: $number');
    print('Greeting: $greeting');
    print('Inferred number: $inferredNumber');
    print('Name: $name');
    print('Age: $age');
    print('Dynamic value: $value');
  }

  print('\n=== 4. Mutable and Immutable Variables ===');
  {
    var counter = 1;
    counter = 2;

    final String city = 'Boston';
    // city = 'New York'; // Error: final cannot be reassigned

    const double pi = 3.14159;
    // pi = 3.14; // Error: const cannot be reassigned

    final List<int> numbers = [1, 2];
    numbers.add(3);

    const List<int> fixedNumbers = [1, 2];
    // fixedNumbers.add(3); // Runtime error: const list is unmodifiable

    String original = 'hello';
    String uppercase = original.toUpperCase();

    print('Counter: $counter');
    print('City: $city');
    print('Pi: $pi');
    print('Final list: $numbers');
    print('Constant list: $fixedNumbers');
    print('Original string: $original');
    print('Uppercase string: $uppercase');
  }

  print('\n=== 5. Operators and Operations ===');
  {
    int a = 7;
    int b = 2;

    print('Addition: ${a + b}');
    print('Subtraction: ${a - b}');
    print('Multiplication: ${a * b}');
    print('Division: ${a / b}');
    print('Integer division: ${a ~/ b}');
    print('Remainder: ${a % b}');

    double x = 1.5;
    double y = 0.5;
    print('Double addition: ${x + y}');

    print('String addition: ${'Hello' + ' Dart'}');
    print('String repetition: ${'ha' * 3}');

    bool conditionA = a > b;
    bool conditionB = a == b;

    print('AND: ${conditionA && conditionB}');
    print('OR: ${conditionA || conditionB}');
    print('NOT: ${!conditionA}');

    List<int> values = [1, 2];
    values.add(3);
    print('First list element: ${values[0]}');
    print('Updated list: $values');

    Map<String, int> tickets = {'adult': 2};
    tickets['child'] = 1;
    print('Tickets: $tickets');
  }

  print('\n=== 6. Operations with Different Data Types ===');
  {
    int wholeNumber = 5;
    double decimalNumber = 2.5;
    num result = wholeNumber + decimalNumber;
    print('int + double: $result');
    print('Result type: ${result.runtimeType}');
    print('Whole-number mixed addition: ${5 + 2.0}');

    int whole = 5;
    // double d = whole; // Error: an int variable cannot be assigned to double
    double fromVariable = whole.toDouble();
    double fromLiteral = 5;
    print('Explicit int to double: $fromVariable');
    print('Double from integer literal: $fromLiteral');

    int a = 5;
    double b = 2.0;
    print('int / double: ${a / b}');
    print('4 / 2: ${4 / 2}');

    List<Object> mixedList = [10, 'ten', true, 2.5];
    print('Mixed list: $mixedList');

    List<int> numbers = [1, 2, 3];
    // numbers.add('four'); // Error: String is not an int
    print('Integer list: $numbers');
  }

  print('\n=== 7. Converting Between Data Types ===');
  {
    int whole = int.parse('5');
    double decimal = double.parse('2.5');
    String text = whole.toString();
    double asDouble = whole.toDouble();

    double amount = 3.9;
    int convertedNumber = amount.toInt();

    print('String to int: $whole');
    print('String to double: $decimal');
    print('int to String: $text');
    print('int to double: $asDouble');
    print('double to int: $convertedNumber');
    print('Negative double to int: ${(-3.9).toInt()}');
  }

  print('\n=== 8. Why Does "5" + 6 Not Work? ===');
  {
    // var x = '5' + 6; // Error: String cannot be added to int

    // Option 1: Add numbers
    {
      int x = int.parse('5') + 6;
      print('Arithmetic: $x');
    }

    // Option 2: Join strings
    {
      int six = 6;
      String x = '5' + six.toString();
      print('String concatenation: $x');
    }

    // Another option: string interpolation
    {
      String x = '5';
      int six = 6;
      print('String interpolation: $x$six');
    }
  }

  print('\n=== 9. When Are Names and Operators Bound? ===');
  {
    int count = 5;
    var total = count + 2;
    print('Total: $total');

    print('Function call: ${addNumbers(2, 3)}');

    Score firstScore = Score(10);
    Score secondScore = Score(5);
    Score totalScore = firstScore + secondScore;
    print('Score addition: ${totalScore.points}');
  }

  // Section 10 summarizes limitations and common mistakes in the tutorial

  print('\n=== 11. Other Built-in and Complex Data Types ===');
  {
    Set<String> colors = {'red', 'blue'};
    colors.add('red');
    print('Colors: $colors');

    var emptyMap = {};
    var emptySet = <String>{};
    emptySet.add('green');
    print('Empty map: $emptyMap');
    print('Empty set: $emptySet');

    var student = (name: 'Sam', age: 21);
    print('Student name: ${student.name}');
    print('Student age: ${student.age}');
  }
}

// A function name refers to this declaration
int addNumbers(int first, int second) {
  return first + second;
}

// Classes can define certain operators for their objects
class Score {
  final int points;

  Score(this.points);

  Score operator +(Score other) {
    return Score(points + other.points);
  }
}
