# Chapter 4 - Functions

A function lets us give a piece of code a name and use it again. We can give it different values each time and save what it returns.

## 1. Declaring and Calling a Function

Here is a function that multiplies two numbers.

```dart
num multiply(num first, num second) {
  return first * second;
}
```

The first `num` is the return type, and `multiply` is the function name. Inside the parentheses, `first` and `second` are the parameters. Each parameter has a type. The braces hold the code that runs when we call the function.

In `main()`, we call `multiply()` twice and save each result.

```dart
final num wholeProduct = multiply(6, 7);    // 42
final num decimalProduct = multiply(2.5, 3); // 7.5
```

In the first call, `6` and `7` are the arguments. Dart gives `6` to `first` and `7` to `second`. The `return` statement sends the product back to `main()`, where we can save it and print it later.

A Dart function can take more than one parameter. Both parameters in `multiply()` use `num`, so each can take an `int` or a `double`. Parameters can also have different types. In Section 5, `testParameterPassing()` takes an `int` and a `List<String>` in the same call.

Sources: [Functions — Dart Documentation](https://dart.dev/language/functions), [Built-in Types — Numbers](https://dart.dev/language/built-in-types#numbers)

## 2. Where Functions Go

Dart starts the program at `main()`. In the example file, `main()` calls `multiply()` even though `multiply()` is written farther down. Both are top-level functions, which means they are written outside a class or another function. In the same file, a top-level function can go above or below the code that calls it.

We can also write a helper inside another function. This is called a local function. Here is an example from inside `main()`.

```dart
final String name = 'Sam';

String greet() {
  return 'Hi, $name';
}

final String greeting = greet();
print(greeting); // Hi, Sam
```

We write `greet()` before we call it. Its name is available inside `main()`, where we declared it. We will come back to this example in Section 8 to see why `greet()` can use `name`.

Sources: [Functions — Dart Documentation](https://dart.dev/language/functions), [Dart Analyzer — Referenced Before Declaration](https://dart.dev/tools/diagnostics/referenced_before_declaration)

## 3. Recursive Functions

Dart lets a function call itself. This is called recursion. For factorial, we multiply `n` by the factorial of `n - 1` until we reach `0`.

```dart
int factorial(int n) {
  if (n < 0) {
    throw ArgumentError.value(n, 'n', 'Use a non-negative integer');
  }

  if (n == 0) {
    return 1;
  }

  return n * factorial(n - 1);
}
```

The `n == 0` check is the base case. It gives the function a place to stop. For example, `factorial(3)` calls `factorial(2)`, then `factorial(1)`, then `factorial(0)`. Once the last call returns `1`, the waiting calls finish and give us `3 * 2 * 1 * 1`, which is `6`.

The first check reports an error if we pass in a negative number. If we started at `-1` and kept subtracting `1`, we would move farther away from `0`. In `main()`, we save `factorial(5)` in `factorialResult` and get `120`.

Sources: [Functions — Dart Documentation](https://dart.dev/language/functions), [ArgumentError.value — Dart API](https://api.dart.dev/dart-core/ArgumentError/ArgumentError.value.html)

## 4. Returning Two Strings

A Dart function returns one value per call. We can use a record to put two results into that value. We first saw records in [Chapter 2](Chapter%202%20-%20Data%20Types%20and%20Naming%20Conventions.md#records-record). Here, `(String, String)` is the return type for a record that holds two strings.

```dart
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
```

The function trims the ends of the string and looks for the first space. The first part is the text before that space. The second part keeps the rest of the text together. If there is no space, as in `'Dart'`, the second string is empty.

```dart
final (String, String) parts = splitAtFirstSpace('Dart is fun');
final String first = parts.$1; // 'Dart'
final String rest = parts.$2;  // 'is fun'
```

We save the record in `parts`, then use `$1` and `$2` to save the strings separately. A `List<String>` could also hold both strings. The record type tells us that the result has exactly two fields.

Sources: [Records — Multiple Returns](https://dart.dev/language/records#multiple-returns), [String.indexOf — Dart API](https://api.dart.dev/dart-core/String/indexOf.html), [String.substring — Dart API](https://api.dart.dev/dart-core/String/substring.html)

## 5. Passing Arguments and Side Effects

### Pass-by-Value

Dart is pass-by-value. When we pass a list to a function, the parameter gets a copy of the reference to the list. The caller and the function have separate variables, and both start out pointing to the same list.

```dart
int testParameterPassing(int number, List<String> words) {
  number = 99;

  // Add to the shared list
  words.add('added inside');

  // Point the parameter at a new list
  words = ['replacement'];
  print('Inside the function: number = $number, words = $words');
  return number;
}
```

In `main()`, `number` starts at `10` and `words` starts as `['original']`. Here is what happens when we call the function.

| Inside the function | What `main()` sees afterward |
| --- | --- |
| `number = 99` | Its own `number` is still `10`. It saves the returned `99` in `returnedNumber`. |
| `words.add('added inside')` | The original list now contains `['original', 'added inside']`. Both variables pointed to that list when we called `add()`. |
| `words = ['replacement']` | Its `words` still points to the original list. Only the parameter points to the new list. |

On Stack Overflow, lrn explains that Dart passes object references by value. This is also called call by sharing. In our example, `words.add()` changes the list that both variables point to. When we give `words` a new list, only the parameter points to that new list. With pass-by-reference, that assignment would also replace the list in `main()`.

Sources: [Dart Language Specification — Function Invocation](https://spec.dart.dev/DartLangSpecDraft.pdf), [lrn — Why Dart Is Acting as Pass by Reference?](https://stackoverflow.com/questions/64080400/why-dart-is-acting-as-pass-by-reference)

### Side Effects and Guard Rails

A Dart function can have side effects. In our example, `words.add()` changes the list that `main()` is using. Printing to the terminal is another side effect.

We can choose how to protect the original list. One way is to make a copy with `words.toList()` and change the copy. Another way is to use `List.unmodifiable(words)` to make a list with fixed contents. If we call `add()` on that list, Dart throws an error when that line runs.

As we saw in [Chapter 2](Chapter%202%20-%20Data%20Types%20and%20Naming%20Conventions.md#4-mutable-and-immutable-variables), a `const` list also has fixed contents. With `final`, the variable can be assigned only once, but it can still refer to a list whose contents can change.

Sources: [Variables — Final and Const](https://dart.dev/language/variables#final-and-const), [Iterable.toList — Dart API](https://api.dart.dev/dart-core/Iterable/toList.html), [List.unmodifiable — Dart API](https://api.dart.dev/dart-core/List/List.unmodifiable.html)

## 6. Scope and Lifetime

In [Chapter 3](Chapter%203%20-%20Control%20Flow.md#8-variable-scope-in-loops-and-functions), we saw that a variable declared inside a block can be used inside that block. Scope tells us where we can use a name. Lifetime tells us how long a variable stays around while the program runs.

```dart
final int score = 10;
if (score > 0) {
  // print(message); // Error: message is declared below
  final String message = 'Positive score';
  print(message);
}
// print(message); // Error: message is outside its block
```

Inside the `if` block, we can use `message` after we declare it. Once we leave the block, the name is out of scope. If the condition is false, the line that creates `message` never runs.

A function parameter is available in the body of that function. Each call to `factorial()` gets its own `n`. In `factorial(3)`, for example, the first call still has `n` set to `3` while the next call is working with `n` set to `2`.

Sources: [Functions — Lexical Scope and Closures](https://dart.dev/language/functions#lexical-scope), [Dart Analyzer — Referenced Before Declaration](https://dart.dev/tools/diagnostics/referenced_before_declaration)

## 7. Where Arguments and Local Values Are Stored

When we call `testParameterPassing(number, words)`, Dart gets the values of the arguments and gives them to the function's parameters. On the native Dart VM, one way to picture a function call is as a stack frame. This is space for the call to keep track of things like parameters and local values.

The parameter `words` holds a reference to the list. The reference can be stored in the stack frame, while the list itself usually lives on the heap. For a small integer like `10`, the VM can store the number directly without making a separate object on the heap.

When the call ends, its stack space can be reused. The original list is still available because `main()` still has a reference to it. The exact storage depends on the platform and how the compiler runs the code.

Sources: [Dart VM — Garbage Collection](https://mrale.ph/dartvm/gc.html), [Dart Overview — Platforms](https://dart.dev/overview)

## 8. Other Things to Know About Functions

The `greet()` function in Section 2 is a closure. It uses `name` from the `main()` block where we wrote it. We say that `greet()` captures `name`.

Dart uses where a function is written to figure out which variables it can see. This is called lexical scope, or static scope. If we save an inner function and call it later, it can still use a variable it captured earlier, even after the outer function returns.

Source: [Functions — Lexical Scope and Closures](https://dart.dev/language/functions#lexical-scope)

## 9. Running the Example Program

The full program is in [Chapter 4 - functions.dart](Chapter%204%20-%20functions.dart). Open a terminal in the folder that contains the file and run this command.

```
dart run "Chapter 4 - functions.dart"
```

You should see this output.

```text
=== 1. Multiplying Numbers ===
6 * 7 = 42
2.5 * 3 = 7.5

=== 2. Local Functions ===
Hi, Sam

=== 3. Recursion ===
5! = 120

=== 4. Returning Two Strings ===
First part: "Dart"
Second part: "is fun"

=== 5. Passing Arguments ===
Before the call: number = 10, words = [original]
Inside the function: number = 99, words = [replacement]
Returned number: 99
After the call: number = 10, words = [original, added inside]

=== 6. Variable Scope ===
Positive score
```

We can also format the file and check it for issues.

```
dart format "Chapter 4 - functions.dart"
```

```
dart analyze "Chapter 4 - functions.dart"
```

For help installing Dart, see [Chapter 1 - Dart Overview and Setup](Chapter%201%20-%20Dart%20Overview%20and%20Setup.md).

Sources: [Dart Run](https://dart.dev/tools/dart-run), [Dart Format](https://dart.dev/tools/dart-format), [Dart Analyze](https://dart.dev/tools/dart-analyze)

## 10. Resources

### References and Tools

1. [Functions — Dart Documentation](https://dart.dev/language/functions)
2. [Built-in Types — Numbers](https://dart.dev/language/built-in-types#numbers)
3. [Dart Analyzer — Referenced Before Declaration](https://dart.dev/tools/diagnostics/referenced_before_declaration)
4. [ArgumentError.value — Dart API](https://api.dart.dev/dart-core/ArgumentError/ArgumentError.value.html)
5. [Records — Multiple Returns](https://dart.dev/language/records#multiple-returns)
6. [String.indexOf — Dart API](https://api.dart.dev/dart-core/String/indexOf.html)
7. [String.substring — Dart API](https://api.dart.dev/dart-core/String/substring.html)
8. [Dart Language Specification — Function Invocation](https://spec.dart.dev/DartLangSpecDraft.pdf)
9. [lrn — Why Dart Is Acting as Pass by Reference?](https://stackoverflow.com/questions/64080400/why-dart-is-acting-as-pass-by-reference)
10. [Variables — Final and Const](https://dart.dev/language/variables#final-and-const)
11. [Iterable.toList — Dart API](https://api.dart.dev/dart-core/Iterable/toList.html)
12. [List.unmodifiable — Dart API](https://api.dart.dev/dart-core/List/List.unmodifiable.html)
13. [Functions — Lexical Scope and Closures](https://dart.dev/language/functions#lexical-scope)
14. [Dart VM — Garbage Collection](https://mrale.ph/dartvm/gc.html)
15. [Dart Overview — Platforms](https://dart.dev/overview)
16. [Dart Run](https://dart.dev/tools/dart-run)
17. [Dart Format](https://dart.dev/tools/dart-format)
18. [Dart Analyze](https://dart.dev/tools/dart-analyze)

### Additional Learning Resources

- [Dart's Official Tutorial](https://dart.dev/learn/tutorial)
- [DartPad](https://dartpad.dev/)
