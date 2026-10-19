void main() {
  print('=== 1. Boolean Values ===');
  {
    bool isSunny = true;
    bool isCold = false;

    print('Sunny: $isSunny');
    print('Cold: $isCold');
  }

  print('\n=== 2. Conditional Statements ===');
  {
    int temperature = 18;
    if (temperature >= 20) {
      print('Warm day');
    } else {
      print('Cool day');
    }
    int age = 20;
    bool hasTicket = true;
    if (age >= 18 && hasTicket) {
      print('Entry allowed');
    } else {
      print('Entry denied');
    }

    int score = 75;
    if (score >= 90) {
      print('Excellent');
    } else if (score >= 60) {
      print('Passed');
    } else {
      print('Try again');
    }

    bool isRaining = false;
    if (!isRaining) {
      print('No rain today');
    }
  }
  print('\n=== 3. Code Blocks ===');
  {
    int number = 5;
    if (number > 0) {
      int inside = 10;
      print('Inside block: $inside');
    }
    // print(inside) would be an error outside this block
  }

  print('\n=== 4. Short-Circuit Logic ===');
  showLogic(false);
  showLogic(true);
  print('\n=== 5. Dangling Else ===');
  {
    int x = 5;
    int y = -1;

    if (x > 0) {
      if (y > 0) {
        print('Both numbers are positive');
      } else {
        print('Only x is positive');
      }
    } else {
      print('x is not positive');
    }
  }
  // Show a normal switch and a labeled continue
  print('\n=== 6. Switch Statements ===');
  {
    String action = 'start';
    switch (action) {
      case 'start':
        print('Starting');
      case 'stop':
        print('Stopping');
      default:
        print('Unknown action');
    }
    int level = 1;
    switch (level) {
      case 1:
        print('Level 1');
        continue nextLevel;
      nextLevel:
      case 2:
        print('Level 2');
      default:
        print('Other level');
    }
  }

  print('\n=== 7. Loops ===');
  {
    for (int i = 1; i <= 3; i++) {
      print('For: $i');
    }

    List<String> fruits = ['apple', 'banana'];
    for (String fruit in fruits) {
      print('For-in: $fruit');
    }
    int counter = 1;
    while (counter <= 2) {
      print('While: $counter');
      counter++;
    }

    int step = 1;
    do {
      print('Do-while: $step');
      step++;
    } while (step <= 2);

    // Continue skips one turn and break stops the loop
    for (int i = 1; i <= 4; i++) {
      if (i == 2) {
        continue;
      }
      if (i == 4) {
        break;
      }
      print('Loop control: $i');
    }
  }
  print('\n=== 8. Variable Scope ===');
  {
    for (int i = 1; i <= 2; i++) {
      int loopValue = i * 10;
      print('Loop value: $loopValue');
    }
    // print(i) and print(loopValue) would be errors here

    showFunctionScope();
    // print(localValue) would be an error here
  }
}

bool checkRightSide() {
  print('Right side checked');
  return true;
}
// Show the difference between && and &, and between || and |
void showLogic(bool first) {
  print('First value: $first');
  print('&& result: ${first && checkRightSide()}');
  print('& result: ${first & checkRightSide()}');
  print('|| result: ${first || checkRightSide()}');
  print('| result: ${first | checkRightSide()}');
}

void showFunctionScope() {
  int localValue = 100;
  print('Function value: $localValue');
}
