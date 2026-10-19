# Chapter 2 - Data Types and Naming Conventions

## 1. Basic Data Types in Dart

Dart supports numbers, strings, booleans, and collections. Here are six common types we can use in beginner programs.

### Integers (`int`)

An `int` stores a whole number, which can be positive, negative, or zero.

```dart
int age = 20;
int temperature = -5;
```

### Floating-Point Numbers (`double`)

A `double` stores numbers that can have a decimal part. Dart uses `double` rather than a separate built-in `float` type.

```dart
double price = 12.5;
double height = 1.75;
```

### Strings (`String`)

A `String` stores text using single or double quotation marks.

```dart
String name = 'Alex';
String message = "Welcome to Dart!";
```

We can insert values into strings using **string interpolation**. `$name` inserts a variable's value, and `${...}` inserts an expression's result.

```dart
print('Name: $name');                 // Name: Alex
print('Name length: ${name.length}'); // Name length: 4
```

### Booleans (`bool`)

A `bool` stores either `true` or `false`.

```dart
bool isStudent = true;
bool isFinished = false;
```

### Lists (`List`)

A `List` stores an ordered collection of values, similar to an array. Its indexes start at `0`. In `List<String>`, every element must be a string.

```dart
List<String> hobbies = ['reading', 'coding'];
print(hobbies[0]); // reading
```

### Maps (`Map`)

A `Map` stores key-value pairs, like a dictionary. In `Map<String, int>`, the keys are strings and the values are integers.

```dart
Map<String, int> scores = {'math': 95, 'science': 90};
print(scores['math']); // 95
```

### Other Type Features

Dart has no separate built-in `char` type; `'A'` is a `String`. Ordinary Dart programs do not work directly with memory addresses using C-style pointers. Variables refer to objects, and every Dart value is an object, including numbers, booleans, and `null`.

Source: [Built-in Types — Dart Documentation](https://dart.dev/language/built-in-types), [Collections — Dart Documentation](https://dart.dev/language/collections), [Introduction to Dart](https://dart.dev/language)

## 2. Variable Naming Rules and Conventions

### Naming Rules

Dart is **case-sensitive**, so `studentAge` and `studentage` are different names. Variable names can start with a letter, `_`, or `$`, but not a number. They cannot contain spaces or hyphens.

| Name | Allowed? | Why? |
| --- | --- | --- |
| `studentAge` | Yes | Starts with a letter |
| `StudentAge` | Yes | Capital letters are allowed, but `lowerCamelCase` is recommended for variables |
| `last_name` | Yes | Underscores are allowed |
| `_total` | Yes | Can start with `_` |
| `$total` | Yes | Can start with `$` |
| `age2` | Yes | Digits can come after the first character |
| `2students` | No | Cannot start with a number |
| `first-name` | No | Hyphens are not allowed in names |
| `class` | No | `class` is a reserved word |

At the top level or inside a class, a name beginning with `_` is private to its **library**. A library can be a single `.dart` file.

### Naming Conventions

Dart recommends `lowerCamelCase` for variables and functions. This starts with a lowercase letter and capitalizes later words.

```dart
int studentAge = 21;
String lastName = 'Lee';
bool hasFinishedHomework = false;
```

Classes use `UpperCamelCase` (such as `StudentProfile`), and files use `lowercase_with_underscores` (such as `data_types.dart`). These are **style recommendations**, not language rules. Dart can still run code that does not follow them.

### Keywords and Reserved Words

Dart has **68 different keywords** in its [official keyword table](https://dart.dev/language/keywords). **33 are fully reserved**, such as `class` and `return`, so they cannot be used as variable names. The others can be used as names in some situations. For beginners, it is usually easier to avoid keywords when naming variables.

Source: [Effective Dart: Style](https://dart.dev/effective-dart/style), [Keywords — Dart Documentation](https://dart.dev/language/keywords), [Libraries and Imports — Dart Documentation](https://dart.dev/language/libraries)

## 3. Understanding Dart's Type System

### Statically or Dynamically Typed?

Dart is **statically typed**. Its *analyzer* can check many type errors before the program runs.

```dart
int number = 10;
// number = 'ten'; // Error: cannot assign a String to int
```

Dart also supports **type inference**, which means it can work out types for us. We will see this with `var` below. Using `var` does not mean a variable can freely change types.

### Strongly or Weakly Typed?

Dart is **strongly typed**. For example, Dart will not automatically treat `'5'` as a number when adding it to `6`. There is no single agreed definition of *strongly typed* and *weakly typed*, but Dart's official documentation describes it as strongly typed.

### Explicitly or Implicitly Typed?

Dart supports both **explicit type annotations** and **type inference**. We can write `String name` ourselves or use `var` and let Dart determine the type.

```dart
String name = 'Alex'; // Explicit type
var age = 20;         // Inferred int

dynamic value = 10;
value = 'Now a string';
```

`dynamic` is different from `var`: it allows values of different types and moves some checks to run time. This is flexible, but errors may be found later.

Source: [Introduction to Dart](https://dart.dev/language), [The Dart Type System](https://dart.dev/language/type-system), [Variables — Dart Documentation](https://dart.dev/language/variables)

## 4. Mutable and Immutable Variables

A normal variable can be assigned a new value. `final` allows only one assignment, while `const` needs a value already known before the program runs.

```dart
var counter = 1;
counter = 2; // Allowed

final String city = 'Boston';
// city = 'New York'; // Error: final cannot be reassigned

const double pi = 3.14159;
// pi = 3.14; // Error: const cannot be reassigned
```

However, a `final` list can still have its contents changed. A `const` list cannot.

```dart
final List<int> numbers = [1, 2];
numbers.add(3);
print(numbers); // [1, 2, 3]

const List<int> fixedNumbers = [1, 2];
// fixedNumbers.add(3); // Runtime error
```

Strings are also immutable. A method like `toUpperCase()` returns new text instead of changing the old string.

```dart
String original = 'hello';
String uppercase = original.toUpperCase();
print(original);  // hello
print(uppercase); // HELLO
```

Source: [Variables — Dart Documentation](https://dart.dev/language/variables), [Built-in Types — Dart Documentation](https://dart.dev/language/built-in-types)

## 5. Operators and Operations

An **operator** performs an operation on values. Different types support different operations.

### Number Operators

| Operator | Meaning | Example | Result |
| --- | --- | --- | --- |
| `+` | Addition | `7 + 2` | `9` |
| `-` | Subtraction | `7 - 2` | `5` |
| `*` | Multiplication | `7 * 2` | `14` |
| `/` | Division | `7 / 2` | `3.5` |
| `~/` | Integer division | `7 ~/ 2` | `3` |
| `%` | Remainder | `7 % 2` | `1` |
| `>` | Greater than | `7 > 2` | `true` |
| `==` | Equal to | `7 == 2` | `false` |

`/` gives a `double`, while `~/` removes the decimal part without rounding. Both `int` and `double` support arithmetic.

```dart
int a = 7;
int b = 2;
print(a + b);  // 9
print(a / b);  // 3.5
print(a ~/ b); // 3

double x = 1.5;
double y = 0.5;
print(x + y); // 2.0
```

### Operators for Other Types

| Type | Common operations | Example |
| --- | --- | --- |
| `String` | `+`, `*`, `==` | `'ha' * 3` gives `hahaha` |
| `bool` | `&&`, `\|\|`, `!` | `true && false` gives `false` |
| `List` | `[]`, `[]=`, `+` | `values[0]` gets an element |
| `Map` | `[]`, `[]=` | `scores['math']` gets a value |
| `Set` | `.add()`, `.contains()` | `.add('red')` adds an element |

`List` and `Map` also have methods such as `.add()` and `.containsKey()`. A **method** is called using parentheses; a property such as `.length` gives information without parentheses. Methods and properties are not operators, but are useful ways to work with values.

```dart
print('Hello' + ' Dart'); // Hello Dart
print('ha' * 3);          // hahaha

bool conditionA = a > b;
bool conditionB = a == b;
print(conditionA && conditionB); // false
print(conditionA || conditionB); // true
print(!conditionA);              // false

List<int> values = [1, 2];
values.add(3);
print(values); // [1, 2, 3]

Map<String, int> tickets = {'adult': 2};
tickets['child'] = 1;
print(tickets); // {adult: 2, child: 1}
```

The two conditions are `true` and `false` because `a` is `7` and `b` is `2`. Dart also has other operators, including assignment, type tests, null-aware operators, and bitwise operators. The [official operators page](https://dart.dev/language/operators) lists them all.

Source: [Operators — Dart Documentation](https://dart.dev/language/operators), [Collections — Dart Documentation](https://dart.dev/language/collections), [String.operator * — Dart API](https://api.dart.dev/dart-core/String/operator_multiply.html)

## 6. Operations with Different Data Types

### Mixing `int` and `double`

Dart allows arithmetic between `int` and `double`. When one value is a `double`, the result of ordinary addition is a `double`, even if the answer is a whole number.

```dart
int wholeNumber = 5;
double decimalNumber = 2.5;
num result = wholeNumber + decimalNumber;
print(result);             // 7.5
print(result.runtimeType); // double (native Dart)
print(5 + 2.0);            // 7.0 (native Dart)
```

`num` can hold either `int` or `double`, while `runtimeType` shows the value's type when the program runs. This kind of mixed arithmetic is related to **widening**, because the result can keep a decimal part.

An `int` variable cannot simply be assigned to a `double` variable. We can convert it using `.toDouble()`. Dart does allow an integer *literal* like `5` in a `double` declaration.

```dart
int whole = 5;
// double d = whole; // Error: int cannot be assigned to double
double fromVariable = whole.toDouble();
double fromLiteral = 5;
```

The `/` operator returns a `double` even if two integers divide evenly:

```dart
int a = 5;
double b = 2.0;
print(a / b); // 2.5
print(4 / 2); // 2.0 (native Dart)
```

### Mixing Types in a List

A `List<Object>` can store different kinds of non-null values:

```dart
List<Object> mixedList = [10, 'ten', true, 2.5];
print(mixedList); // [10, ten, true, 2.5]
```

A `List<int>` only accepts integers. For example, `numbers.add('four')` is not allowed when `numbers` is a `List<int>`.

Source: [Built-in Types — Dart Documentation](https://dart.dev/language/built-in-types), [The Dart Type System](https://dart.dev/language/type-system)

## 7. Converting Between Data Types

Dart has methods for converting between numbers and strings.

```dart
int whole = int.parse('5');           // String to int
double decimal = double.parse('2.5'); // String to double
String text = whole.toString();       // int to String
double asDouble = whole.toDouble();   // int to double

double amount = 3.9;
int convertedNumber = amount.toInt(); // 3, not 4
```

`.toInt()` removes the decimal part without rounding, so `(-3.9).toInt()` gives `-3`. Converting `double` to `int` this way is called **narrowing**, because the decimal part is lost. To round instead, we can use `.round()`.

Dart allows some values without an explicit conversion, such as using the literal `5` in a `double` variable. String interpolation also puts numbers into text for us. However, assigning an `int` variable to a `double` variable needs `.toDouble()`, and converting a `String` to an `int` needs `int.parse()`. **Type inference** (`var`) is not conversion: it only means Dart works out the type for us.

Source: [Built-in Types — Dart Documentation](https://dart.dev/language/built-in-types), [The Dart Type System](https://dart.dev/language/type-system)

## 8. Why Does `"5" + 6` Not Work?

This code does not compile:

```dart
var x = '5' + 6;
print(x);
```

The first value is a `String`, but the second is an `int`. The String `+` operator needs another string. Dart finds this type error before the program runs, so the program does not start and nothing is printed. We can fix it in different ways depending on what we want.

**For mathematical addition**, convert `'5'` into an integer:

```dart
int x = int.parse('5') + 6;
print(x); // 11
```

**For joining text**, convert the integer into a string:

```dart
int six = 6;
String x = '5' + six.toString();
print(x); // 56
```

Or use string interpolation:

```dart
String x = '5';
int six = 6;
print('$x$six'); // 56
```

String interpolation inserts the integer's value as text, so we do not need `.toString()`. If we want the character `6` directly after `x`, we can write `${x}6`. Without braces, `$x6` would refer to a variable called `x6`.

Source: [Built-in Types — Dart Documentation](https://dart.dev/language/built-in-types), [Operators — Dart Documentation](https://dart.dev/language/operators), [Introduction to Dart](https://dart.dev/language)

## 9. When Are Names and Operators Bound?

**Binding** means connecting a name or symbol to what it refers to. Different parts of a Dart program are bound at different times.

### Variable Names, Types, and Addresses

Dart checks names and types before a program runs (**compile time**).

```dart
int count = 5;
var total = count + 2; // Dart infers int
```

Here, `count` refers to a variable and Dart knows `total` is an `int`. The statements assign their values when the program runs (**run time**). Dart manages the memory used for variables and objects, rather than asking us to choose their addresses.

### Function and Class Names

Dart also checks function and class names before execution. For example:

```dart
int addNumbers(int first, int second) {
  return first + second;
}

void main() {
  print(addNumbers(2, 3)); // 5
}
```

The function name refers to its declaration before execution, but the addition happens when the function is called. Similarly, the name `Score` refers to a class; a regular `Score` object is created and given memory when `Score(10)` runs. A `const` value is different because it must be known at compile time, as explained in Section 4.

### Operators

The built-in meaning of `+` for numbers and strings comes from Dart's language rules (**language design time**). A class can also define `+` for its own objects:

```dart
class Score {
  final int points;

  Score(this.points);

  Score operator +(Score other) {
    return Score(points + other.points);
  }
}
```

We do not need to know all the class syntax yet. Here, `Score(this.points)` sets the starting points, and `operator +` adds the points of two scores.

```dart
Score firstScore = Score(10);
Score secondScore = Score(5);
Score totalScore = firstScore + secondScore;
print(totalScore.points); // 15
```

Dart checks that this operation is valid before running the program. The actual addition happens at run time.

Source: [Variables — Dart Documentation](https://dart.dev/language/variables), [Classes — Dart Documentation](https://dart.dev/language/classes), [Operators — Dart Documentation](https://dart.dev/language/operators)

## 10. Limitations and Common Mistakes

Here are a few common restrictions:

1. **Strings and numbers are different.** `'5' + 6` is not allowed without conversion.
2. **Lists have element types.** A `List<int>` cannot contain a string.
3. **Division operators differ.** `/` gives a `double`; `~/` removes the decimal part.
4. **Parsing can fail.** `int.parse('five')` throws a `FormatException`.
5. **`dynamic` has risks.** Some errors are only found when the program runs.
6. **`final` does not freeze every object.** A final list can still have elements added.
7. **Null safety applies.** `String` cannot normally hold `null`; `String?` can.

Overall, Dart can work with different data types, but we need to follow type rules and convert values when necessary.

Source: [The Dart Type System](https://dart.dev/language/type-system), [Variables — Dart Documentation](https://dart.dev/language/variables), [int.parse — Dart API](https://api.dart.dev/dart-core/int/parse.html)

## 11. Other Built-in and Complex Data Types

Two other useful built-in types are `Set` and `Record`.

### Sets (`Set`)

A `Set` stores unique values, so adding the same element again does not create a duplicate.

```dart
Set<String> colors = {'red', 'blue'};
colors.add('red');
print(colors); // {red, blue}
```

An empty `{}` creates a `Map`, not a `Set`. To create an empty string set, write `<String>{}`.

### Records (`Record`)

A `Record` can group values of different types without creating a class.

```dart
var student = (name: 'Sam', age: 21);
print(student.name); // Sam
print(student.age);  // 21
```

Source: [Collections — Dart Documentation](https://dart.dev/language/collections), [Records — Dart Documentation](https://dart.dev/language/records)

## 12. Running the Example Program

The full runnable program for this chapter is [Chapter 2 - data_types.dart](Chapter%202%20-%20data_types.dart). Open it in VS Code and run:

```
dart run "Chapter 2 - data_types.dart"
```

For example, the program prints these lines when run locally:

```text
=== 6. Operations with Different Data Types ===
int + double: 7.5
Result type: double
Whole-number mixed addition: 7.0
```

The rest of the output shows the other examples in this chapter. Section 10 is a written summary, so it has no separate output. Examples that would cause errors are comments in the Dart file so the program can run normally.

Each group inside `main()` uses its own `{ }` block. This lets us reuse names such as `a` and `x` in different sections. Numbers may display differently in DartPad (web) than when using `dart run` on a computer.

We can also check the code using:

```
dart format "Chapter 2 - data_types.dart"
```

```
dart analyze "Chapter 2 - data_types.dart"
```

If Dart is not installed yet, follow [Chapter 1 - Dart Overview and Setup](Chapter%201%20-%20Dart%20Overview%20and%20Setup.md). For smaller examples, we can also use [DartPad](https://dartpad.dev/).

Source: [Dart Run — Dart Documentation](https://dart.dev/tools/dart-run), [Numbers in Dart — Dart Documentation](https://dart.dev/resources/language/number-representation)

## 13. Resources

### References and Tools

1. [Built-in Types — Dart Documentation](https://dart.dev/language/built-in-types)
2. [Introduction to Dart](https://dart.dev/language)
3. [Variables — Dart Documentation](https://dart.dev/language/variables)
4. [Keywords — Dart Documentation](https://dart.dev/language/keywords)
5. [Effective Dart: Style](https://dart.dev/effective-dart/style)
6. [The Dart Type System](https://dart.dev/language/type-system)
7. [Operators — Dart Documentation](https://dart.dev/language/operators)
8. [Collections — Dart Documentation](https://dart.dev/language/collections)
9. [Records — Dart Documentation](https://dart.dev/language/records)
10. [Classes — Dart Documentation](https://dart.dev/language/classes)
11. [Libraries and Imports — Dart Documentation](https://dart.dev/language/libraries)
12. [int.parse — Dart API](https://api.dart.dev/dart-core/int/parse.html)
13. [Dart Run — Dart Documentation](https://dart.dev/tools/dart-run)
14. [Numbers in Dart — Dart Documentation](https://dart.dev/resources/language/number-representation)
15. [String.operator * — Dart API](https://api.dart.dev/dart-core/String/operator_multiply.html)

### Additional Learning Resources

- [Dart's Official Tutorial](https://dart.dev/learn/tutorial)
- [DartPad](https://dartpad.dev/)
