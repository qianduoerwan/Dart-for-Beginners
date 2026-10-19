# Chapter 3 - Control Flow

## 1. Boolean Values and Conditions

Dart uses the `bool` type for conditions. The only two boolean values are `true` and `false`, written in lowercase. Unlike some languages, Dart does not use `1` and `0` as boolean values. An `if` condition must be a `bool`.

```dart
bool isSunny = true;
bool isCold = false;

print('Sunny: $isSunny'); // Sunny: true
print('Cold: $isCold');   // Cold: false
```

A comparison such as `age >= 18` also gives us a boolean result. We can use these results to decide which code should run.

Source: [Built-in Types — Dart Documentation](https://dart.dev/language/built-in-types), [Branches — Dart Documentation](https://dart.dev/language/branches)

## 2. If, Else If, and Else

### One-Condition If/Else

An `if` statement runs its code when a condition is `true`. The `else` block runs when it is `false`.

```dart
int temperature = 18;

if (temperature >= 20) {
  print('Warm day');
} else {
  print('Cool day'); // Runs because 18 is less than 20
}
```

### Multiple Conditions

We can check more than one condition using logical operators:

- `&&` means **AND**, so both conditions must be true.
- `||` means **OR**, so at least one condition must be true.
- `!` means **NOT**, so it reverses a boolean value.

```dart
int age = 20;
bool hasTicket = true;

if (age >= 18 && hasTicket) {
  print('Entry allowed');
} else {
  print('Entry denied');
}
```

Both conditions are true here, so the program prints `Entry allowed`.

### If / Else If / Else

To choose from more than two possibilities, Dart uses `else if` (not `elif`). It checks the conditions in order and runs the first matching block.

```dart
int score = 75;

if (score >= 90) {
  print('Excellent');
} else if (score >= 60) {
  print('Passed');
} else {
  print('Try again');
}
```

This example prints `Passed`.

Dart does not have an `unless` keyword, but we can use `!` to check the opposite of a condition:

```dart
bool isRaining = false;

if (!isRaining) {
  print('No rain today');
}
```

Dart also supports `switch` statements, which we will use in Section 6. For a short choice between two values, it has the `condition ? value1 : value2` expression as well.

Source: [Branches — Dart Documentation](https://dart.dev/language/branches), [Operators — Dart Documentation](https://dart.dev/language/operators)

## 3. Code Blocks and Curly Braces

Dart normally uses curly braces `{ }` to group statements under `if`, `else if`, and `else`. These braces make it clear which statements belong to each condition. Indentation makes code easier to read, but indentation alone does not define a block.

```dart
int number = 5;

if (number > 0) {
  int inside = 10;
  print(inside); // 10
}

// print(inside); // Error: inside only exists in the block above
```

Dart allows some one-line `if` statements without braces, but using braces is the recommended style and helps avoid mistakes with nested conditions.

Source: [Effective Dart: Style](https://dart.dev/effective-dart/style), [Functions — Dart Documentation](https://dart.dev/language/functions)

## 4. Short-Circuit Logic

Dart supports **short-circuit evaluation** with `&&` and `||`:

- With `&&`, Dart skips the right side if the left side is `false`.
- With `||`, Dart skips the right side if the left side is `true`.

Dart also allows `&` and `|` with `bool` values. These give AND and OR results, but **both sides are evaluated**. We can see the difference by making the right side print a message whenever it runs.

```dart
bool checkRightSide() {
  print('Right side checked');
  return true;
}

void showLogic(bool first) {
  print('First value: $first');
  print('&& result: ${first && checkRightSide()}');
  print('& result: ${first & checkRightSide()}');
  print('|| result: ${first || checkRightSide()}');
  print('| result: ${first | checkRightSide()}');
}
```

When we call `showLogic(false)` from `main()`, we get:

```text
First value: false
&& result: false
Right side checked
& result: false
Right side checked
|| result: true
Right side checked
| result: true
```

Notice that `&&` does not print `Right side checked`, because the first value is already `false`. The `&` operator still checks the right side. With `showLogic(true)`, `||` skips the right side, but `|` does not.

Source: [Operators — Dart Documentation](https://dart.dev/language/operators), [bool.operator & — Dart API](https://api.dart.dev/dart-core/bool/operator_bitwise_and.html), [bool.operator | — Dart API](https://api.dart.dev/dart-core/bool/operator_bitwise_or.html)

## 5. The Dangling Else Problem

The **dangling else problem** happens when nested `if` statements make it unclear which `if` an `else` belongs to. In Dart, if braces are missing, an `else` belongs to the closest `if` that does not already have an `else`.

We can avoid confusion by using braces:

```dart
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
```

The output is `Only x is positive`. The first `else` belongs to `if (y > 0)`, while the second belongs to `if (x > 0)`. The braces show exactly where each block starts and ends.

Source: [Curly Braces in Flow Control Structures — Dart Documentation](https://dart.dev/tools/linter-rules/curly_braces_in_flow_control_structures)

## 6. Switch and Case Statements

A `switch` compares one value against different `case` options. The matching case runs, and `default` runs if none of the cases match.

```dart
String action = 'start';

switch (action) {
  case 'start':
    print('Starting');
  case 'stop':
    print('Stopping');
  default:
    print('Unknown action');
}
```

This prints `Starting`.

### Do We Need `break`?

In **Dart 3**, a non-empty `case` normally ends automatically after its code runs. We do not need to put `break` after every case. We can still use `break` if we want to leave a case early.

### Can `continue` Run Other Cases?

In a Dart `switch`, `continue` can jump to a **labeled case**. It does not make Dart check every case or run all the conditions.

```dart
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
```

This prints `Level 1` and then `Level 2`. The label `nextLevel` tells Dart exactly where to continue. The `default` case does not run. This is different from `continue` inside a loop, which skips to the next loop iteration.

Source: [Branches — Dart Documentation](https://dart.dev/language/branches), [Loops — Dart Documentation](https://dart.dev/language/loops)

## 7. Loops in Dart

Loops let us repeat code. Dart supports `for`, `for-in`, `while`, and `do-while` loops.

| Loop | When to use it |
| --- | --- |
| `for` | When we want to count or repeat a known number of times |
| `for-in` | When we want to go through items in a collection |
| `while` | When we want to repeat while a condition stays true; it checks first |
| `do-while` | When the body should run at least once; it checks after running |

### For Loop

```dart
for (int i = 1; i <= 3; i++) {
  print('For: $i');
}
```

This prints `For: 1`, `For: 2`, and `For: 3`.

### For-In Loop (For Each Item)

```dart
List<String> fruits = ['apple', 'banana'];

for (String fruit in fruits) {
  print('For-in: $fruit');
}
```

This visits each item in the list. Lists also have a `.forEach()` method, but `for-in` is often easier to read when learning Dart.

### While Loop

```dart
int counter = 1;

while (counter <= 2) {
  print('While: $counter');
  counter++;
}
```

A `while` loop might run zero times if its condition is false at the start.

### Do-While Loop

```dart
int step = 1;

do {
  print('Do-while: $step');
  step++;
} while (step <= 2);
```

A `do-while` loop always runs its body at least once, because the condition comes at the end. Notice the semicolon after `while (step <= 2);`.

### Break and Continue in Loops

`break` stops a loop. `continue` skips the rest of the current iteration and moves to the next one.

```dart
for (int i = 1; i <= 4; i++) {
  if (i == 2) {
    continue;
  }
  if (i == 4) {
    break;
  }
  print('Loop control: $i');
}
```

This prints only `Loop control: 1` and `Loop control: 3`.

Source: [Loops — Dart Documentation](https://dart.dev/language/loops), [Collections — Dart Documentation](https://dart.dev/language/collections)

## 8. Variable Scope in Loops and Functions

**Scope** means where a variable can be used. Dart follows the code's blocks to decide which variables are available.

A variable created inside a loop block is only available in that block. A variable declared in the `for` loop header, such as `i`, is also limited to that loop.

```dart
for (int i = 1; i <= 2; i++) {
  int loopValue = i * 10;
  print('Loop value: $loopValue');
}

// print(i);         // Error: i is outside its loop
// print(loopValue); // Error: loopValue is outside its block
```

Functions use the same general scope rule. A local variable declared inside a function is not available in a different function.

```dart
void showFunctionScope() {
  int localValue = 100;
  print('Function value: $localValue');
}
```

We can call `showFunctionScope()` from `main()`, but we cannot directly use `localValue` there. So loop variables and function variables both have limited scope. The difference is *where* their blocks begin and end, not a completely different set of rules.

Source: [Functions — Dart Documentation](https://dart.dev/language/functions), [Variables — Dart Documentation](https://dart.dev/language/variables)

## 9. Running the Example Program

The complete program for this chapter is in [Chapter 3 - control_flow.dart](Chapter%203%20-%20control_flow.dart). It contains runnable examples of all the conditions, logical operators, switch statements, and loops explained above.

To run the file, open a terminal in the folder containing `Chapter 3 - control_flow.dart` and enter:

```
dart run "Chapter 3 - control_flow.dart"
```

For example, the Switch Statements section prints:

```text
=== 6. Switch Statements ===
Starting
Level 1
Level 2
```

The full program prints the results from the other sections too. Examples of code that would cause an error are kept as comments, so they do not stop the program.

We can also check the file with:

```
dart format "Chapter 3 - control_flow.dart"
```

```
dart analyze "Chapter 3 - control_flow.dart"
```

If you have not installed Dart yet, see [Dart Overview and Setup](Dart%20Overview%20and%20Setup.md).

Source: [Dart Run — Dart Documentation](https://dart.dev/tools/dart-run)

## 10. Resources

### References and Tools

1. [Built-in Types — Dart Documentation](https://dart.dev/language/built-in-types)
2. [Branches — Dart Documentation](https://dart.dev/language/branches)
3. [Operators — Dart Documentation](https://dart.dev/language/operators)
4. [Loops — Dart Documentation](https://dart.dev/language/loops)
5. [Functions — Dart Documentation](https://dart.dev/language/functions)
6. [Variables — Dart Documentation](https://dart.dev/language/variables)
7. [Collections — Dart Documentation](https://dart.dev/language/collections)
8. [Effective Dart: Style](https://dart.dev/effective-dart/style)
9. [Curly Braces in Flow Control Structures — Dart Documentation](https://dart.dev/tools/linter-rules/curly_braces_in_flow_control_structures)
10. [bool.operator & — Dart API](https://api.dart.dev/dart-core/bool/operator_bitwise_and.html)
11. [bool.operator | — Dart API](https://api.dart.dev/dart-core/bool/operator_bitwise_or.html)
12. [Dart Run — Dart Documentation](https://dart.dev/tools/dart-run)

### Additional Learning Resources

- [Dart's Official Tutorial](https://dart.dev/learn/tutorial)
- [DartPad](https://dartpad.dev/)
