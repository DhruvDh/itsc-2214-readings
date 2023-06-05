---
title: "Introduction to Mutation Testing"
---

## Unit Testing, a Recap

Writing *correct* code is challenging. Owning your code, maintaining it, and ensuring it always performs as expected can be even more difficult. After all, we are human, and mistakes are a part of our nature. Therefore, we can't always rely solely on our ability to catch these mistakes. Instead, automated processes that can help us identify and correct these errors are truly invaluable.

Unit testing is one such automated process that tests your code. These tests target individual units of your code and are designed to verify their behavior. In programming, a method can be thought of as the smallest unit of code, and Classes, Packages, and Modules are larger units of code. Every unit test is designed to validate a single behavior of a single unit of code.

Unit testing is so crucial that they are a mandatory requirement for many software development projects. For instance, if you are contributing a Java source class to most projects, you are also required to provide unit tests for that class. In this course, where we deal with Data Structures and Algorithms, learning how to implement them in Java, etc., submitting your implementations without Unit tests would be like submitting a paper without a bibliography. It might make us question, "Sure, you wrote this and it looks convincing, but where's your evidence? Why should I believe you?"

And that's why you will be required to write unit tests for your Data Structures and Algorithms implementations. But then, how do you know that your unit tests are correct?

Consider this example:

```java
@Test
public void testAdd() {
   assertTrue(1 == 1);
}
```

The test passes, but does it mean it's correct? Let's examine the test.

## Writing *Correct* Unit Tests

Taking a closer look at the unit test above, two problems become evident:

- The `add` method isn't called in the test.
- The test can't fail.

To address the first issue, we can leverage tools that detect when a unit test doesn't cover a particular line of code. Here "cover" means "execute".

So what about a test like this?

```java
@Test
public void testAdd() {
   assertTrue(add(1, 1) == add(1, 1));
}
```

The `add` method is called, and test coverage is at 100%. However, this test can't fail, meaning it is not *correct*.

## Mutation Testing: A Solution to Test the Correctness of Your Unit Tests

Mutation testing provides a way to test the correctness of your unit tests. It can help you find tests that can't fail, tests that need more test cases, and even logic errors in your code.

The basic idea of mutation testing is as follows: if you claim your source code is correct, and that the tests prove it, mutation testing will challenge that claim. Mutation testing introduces small changes, called *mutations*, to your source code. If your tests still pass after these changes, it suggests that your test or source code may not be correct.

These mutations are created by algorithms called *mutators* or *mutation operators*. Each time a mutator runs, it receives a fresh copy of your source code and makes only one change. The result of a mutator is a *mutant* - a mutated version of your source code.

## Mutation Testing in Practice

Here's how mutation testing works in practice:

- Apply a set of mutators to your source code to produce a collection of mutants.
- For each mutant, run your unit tests.
  - If the unit tests pass, the mutant has *survived*.
  - If the unit tests fail, the mutant was *killed*

.

The aim is to kill as many mutants as possible. If too many mutants survive, it indicates that your unit tests are not sufficient to prove that your source code is correct. If you manage to kill all mutants, you can use your unit tests to argue that your source code is indeed correct.

In our course, only unit tests that leave no surviving mutants will be accepted as a valid submission.

### What are these mutators?

Mutators introduce specific types of changes to your code. For instance, a primitive returns mutator (PRIMITIVE_RETURNS) replaces int, short, long, char, float, and double return values with 0. So, for example, this method:

```java
public int add(int lhs, int rhs) {
    return lhs + rhs;
}
```

becomes:

```java
public int add(int lhs, int rhs) {
    return 0;
}
```

This mutant would survive in two cases: if the `add` method is never tested or if the only test cases for `add` are ones where the result is 0. To fix this, you can add more test cases that test `add` with non-zero results.

Another example of a mutator is the Remove Conditionals Mutator (REMOVE_CONDITIONALS), which removes all conditional statements such that the guarded statements always execute.

For example, this code:

```java
if (a == b) {
  // do something
}
```

becomes:

```java
if (true) {
  // do something
}
```

This mutant would survive if the source method is never tested, if all test cases for the source method only ever test the true case, or if both branches have the exact same code or equivalent code, to begin with. To fix this, you can add more test cases that test the false case, and ensure that the true and false branches are not equivalent.

Through mutation testing, you will get valuable feedback to improve your code and tests, making them more robust and reliable.

Remember, a well-tested code base is not just about coverage—it's about the quality of tests, their ability to catch mistakes, and their resilience against possible errors. Mutation testing is an invaluable tool in achieving this.

Certainly, let's decipher the feedback from the Coding Rooms.

## Understanding CodingRooms Feedback

In the feedback provided by the autograder in Coding Rooms, you can find two main parts. The first part lists the mutation tests that have been run, and the second part provides a grading overview.

### Understanding Mutation Test Feedback

Each mutation test feedback starts with "Running Mutation tests", followed by details about each mutation test performed.

```
Running Mutation tests -
Ran mutation tests for Calculator.CalculatorTest -
-[ RECORD 0 ]---------+------------------------------------
Mutation type         | RemoveConditionalMutator_EQUAL_ELSE
Source method mutated | divide
Line no. of mutation  | 56
Test examined         | None
Result                | SURVIVED
```

In the example above, the autograder has run a mutation test on the "divide" method of your "Calculator" class. Here is what each line in the record means:

- **Mutation type:** The type of mutation that was made to your code. In this case, a RemoveConditionalMutator_EQUAL_ELSE mutation was made. This mutation type removes a conditional (==) operator and always takes the else branch.

- **Source method mutated:** The method in your code that was mutated for the test. In this case, it's the "divide" method.

- **Line no. of mutation:** The line number in your code where the mutation was applied.

- **Test examined:** This line indicates which test case was run against the mutant. "None" means no specific test case was chosen, and all available tests were run.

- **Result:** The outcome of the mutation test. If your tests fail against the mutated code (which is a good thing!), this line will read "KILLED". If your tests pass (which implies your tests didn't catch the error introduced by the mutation), this line will read "SURVIVED". In this case, the mutant has survived, indicating your tests didn't catch the error.

If any mutants survive, the autograder lists those under the line, "Problematic mutation test failures printed about."

### Understanding the Grading Overview

The grading overview gives you a quick summary of how your code has performed in the tests. It breaks down the grading by requirements.

```
┌──────────────────────────────────────────────────────┬
│                   Grading Overview                   │
├──────────────────────────────────────────────────────┼
│ Requirement │    Grade    │          Reason          │
├─────────────┼─────────────┼──────────────────────────┤
│      1      │ 10.00/10.00 │   - 4/4 tests passing.   │
├─────────────┼─────────────┼──────────────────────────┤
│      2      │ 32.00/40.00 │ -8 Penalty due to surviv │
│             │             │       ing muations       │
├─────────────┼─────────────┼──────────────────────────┤
│                  Total: 42.00/50.00                  │
└──────────────────────────────────────────────────────┴
```

In the example above, we have:

- **Requirement 1:** This section corresponds to the first requirement of the assignment. The student received a full score (10.00/10.00) because all 4 test cases associated with this requirement passed.

- **Requirement 2:** This section corresponds to the second requirement of the assignment. The student lost 8 points because of surviving mutations, resulting in a score of 32.00/40.00 for this requirement.

The total grade of the assignment is

42.00/50.00, indicating the need for further improvement.

Remember, each surviving mutation indicates a flaw in your test cases—they didn't catch an erroneous mutation. To improve your grade, aim to update your test cases to ensure that they effectively detect the mutations.
