---
title: "Writing JUnit Tests and Test-Driven Development"
---

Unit testing is crucial to ensure the accuracy and performance of your code. But as we've seen, managing and writing tests can be a bit cumbersome. This is where testing frameworks, like JUnit, come in. They automate the tedious parts of testing and provide us with a plethora of tools to write effective tests.

## Introduction to JUnit

JUnit is a widely used testing framework in the Java world. It automates the process of running tests and provides us with a wide range of assertion methods to validate our code. JUnit helps to simplify our test code, making it easier to read and maintain.

So, why is JUnit so popular?

1. **Simplicity:** JUnit simplifies the process of writing and running tests. The framework handles the boilerplate code, allowing us to focus solely on writing the test cases.

2. **Assertion Library:** JUnit provides a comprehensive set of assertion methods that help us validate our code against a wide range of conditions.

3. **Annotations:** JUnit uses annotations to define test methods and setup methods, making our test code easier to read and understand.

4. **Automatic Test Discovery:** JUnit automatically finds and runs all test methods, so we don't have to manually list them in our code.

5. **IDE Integration:** Most modern IDEs provide first-class support for JUnit, including features such as generating test cases and displaying test results in a friendly format.

Now that you understand what JUnit is and why it's beneficial let's see how to use it in our `MathUtil` class.

## Useful JUnit Assertions

JUnit provides a set of methods called assertions that are used to test the expected output of your code. These assertions help verify that your code behaves as expected under different conditions.

Let's take a look at some commonly used assertions:

### `assertEquals`

This assertion checks if two values are equal:

```java
assertEquals(expected, actual);
```

If `actual` is not equal to `expected`, the assertion fails, and the test method will terminate immediately.

Let's rewrite our `addTest1` method using JUnit's `assertEquals`:

```java
@Test
public void addTest1() {
    MathUtil m = new MathUtil();
    int lhs = 5;
    int rhs = 7;

    assertEquals(lhs + rhs, m.add(lhs, rhs));
}
```

### `assertTrue` and `assertFalse`

These assertions verify if a condition is `true` or `false`, respectively:

```java
assertTrue(condition);
assertFalse(condition);
```

If the `condition` does not meet the expectation (i.e., `true` for `assertTrue` and `false` for `assertFalse`), the assertion fails, and the test method will terminate immediately.

### `assertNotNull` and `assertNull`

These assertions check if an object is `null` or not:

```java
assertNotNull(object);
assertNull(object);
```

If the `object` does not meet the expectation (i.e., not `null` for `assertNotNull` and `null` for `assertNull`), the assertion fails, and the test method will terminate immediately.

These are just a few examples. JUnit provides a comprehensive set of assertions to cover almost any condition you might want to verify.

## Setting Up JUnit

Before you can use JUnit, you need to make sure the library is on your classpath. This process can vary depending on the IDE and build system you're using.

For our labs, we will ensure the `JUnit` library is on our classpath by pre-configuring the project and IDE for you. However, if you're working on your own project, you'll need to add the `JUnit` library to your project's classpath.

When working on your own projects, you might be interested in using a build system like [Maven](https://maven.apache.org/) or [Gradle](https://gradle.org/) to manage your dependencies. These build systems make it easy to add and manage dependencies in your project. For example, if you're using Maven, you can add the following dependency to your `pom.xml` file:

```xml
<dependency>
    <groupId>org.junit.jupiter</groupId>
    <artifactId>junit-jupiter-api</artifactId>
   

 <version>5.7.0</version>
    <scope>test</scope>
</dependency>
```

This will automatically download the JUnit library and add it to your project's classpath.

Regardless of how you added the `JUnit` library to your project, next, we need to import the necessary classes and annotations from JUnit. At the top of our `MathUtilTest` class, we add the following import statements:

```java
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
```

The first import statement statically imports all assertion methods from `Assertions`, allowing us to use them directly in our code. The second import statement imports the `Test` annotation, which we use to denote our test methods. The third import statement imports the `BeforeEach` annotation, which we'll discuss in a moment.

## Utilizing `@Test` and `@BeforeEach` Annotations

In JUnit, we use the `@Test` annotation to indicate that a method is a test method. This allows JUnit to automatically discover and run this method as a test.

```java
@Test
public void addTest1() {
    // test code...
}
```

However, what if we have some setup code that we want to run before each test? This is where the `@BeforeEach` annotation comes in. Any method annotated with `@BeforeEach` will be run before each `@Test` method.

Let's say we want to create a new `MathUtil` instance before each test:

```java
MathUtil m;

@BeforeEach
public void setup() {
    m = new MathUtil();
}
```

Now, before each test method is run, JUnit will first execute the `setup` method, ensuring that we have a fresh `MathUtil` instance for each test.

## Interpreting JUnit Test Runner Output

Understanding the output of the JUnit test runner is crucial for interpreting the results of your tests. This helps you diagnose issues in your code and identify exactly what went wrong. Let's analyze the output of the `junit-platform-console-standalone` test runner to get a feel for how this works.

```plaintext
╷
├─ JUnit Jupiter ✔
├─ JUnit Vintage ✔
│  └─ BinarySearchTreeHiddenTest ✔
│     ├─ testInsertAndSearch ✔
│     ├─ testDeleteSingleNode ✔
│     ├─ testTreeTraversals ✘ expected:<[2, 3, 4, 5, [6, 7], 8]> but was:<[2, 3, 4, 5, [7, 6], 8]>
│     ├─ testContainsElementNotInTree ✔
│     ├─ testContainsEmptyTree ✔
│     ├─ testDeleteEmptyTree ✔
│     ├─ testContainsElementInTree ✔
│     ├─ testSearchElementInTree ✔
│     ├─ testInsertMultipleElements ✔
│     ├─ testDeleteDuplicateElements ✔
│     ├─ testDeleteElementNotInTree ✔
│     ├─ testInsertNegativeNumbers ✔
│     ├─ testInsertAndSize ✔
│     ├─ testSearchEmptyTree ✔
│     ├─ testDeleteNodeWithMultipleElements ✔
│     ├─ testInsertDuplicatesAndRemove ✔
│     ├─ testInsertSingleElement ✔
│     └─ testSearchElementNotInTree ✔
└─ JUnit Platform Suite ✔

Failures (1):
  JUnit Vintage:BinarySearchTreeHiddenTest:testTreeTraversals
    => org.junit.ComparisonFailure: expected:<[2, 3, 4, 5, [6, 7], 8]> but was:<[2, 3, 4, 5, [7, 6], 8]>
       DataStructures.BinarySearchTreeHiddenTest.testTreeTraversals(BinarySearchTreeHiddenTest.java:220)
       [...]
```

The JUnit console output provides a tree structure representing the test execution. The topmost nodes represent the test engines used, in this case, `JUnit Jupiter` and `JUnit Vintage`. Underneath each engine are the individual test classes, such as `BinarySearchTreeHiddenTest`.

Within each test class node, there are child nodes representing each test method, such as `testInsertAndSearch` or `testDeleteSingleNode`. These methods are marked with a ✔ symbol if they passed, and with a ✘ symbol if they failed. In this case, we see that `testTreeTraversals` has failed.

Accompanying the failure symbol is a brief description of the failure, which is the assertion message from the test method. In this example, the test expected the array `[2, 3, 4, 5, 6, 7, 8]`, but received the array `[2, 3, 4, 5, 7, 6, 8]`. This discrepancy caused the test to fail.

After the tree structure, there is a section titled `Failures` which provides more detailed information about each failure. For each failure, it lists:

1. The test class and method that failed.
2. The type of assertion failure that occurred, which is `org.junit.ComparisonFailure` in this case.
3. The detailed assertion failure message, which is the same as what's shown in the tree structure.
4. The location in the code where the failure occurred, which can be very useful (and is often the first thing you should look at when debugging a test failure). In this case, the failure occurred on line 220 of `BinarySearchTreeHiddenTest.java` (see the `DataStructures.BinarySearchTreeHiddenTest.testTreeTraversals(BinarySearchTreeHiddenTest.java:220)` line).

## Conclusion

In conclusion, JUnit simplifies the process of writing and managing tests. It provides a comprehensive set of assertion methods to verify our code and uses annotations to define and organize our tests, making them easier to read and understand. By taking advantage of these features, we can write more effective and maintainable tests. In the next section, we'll dive deeper into Test-Driven Development, a methodology that leverages the power of testing to guide and improve the development process.

## Test-Driven Development

Test-Driven Development (TDD) is a software development methodology that is centered around the idea of writing tests before writing the actual code. It is a highly disciplined process that follows a strict order of operations: red, green, refactor. This method has profound implications on the design, quality, and reliability of the software.

Let's dive into what these steps entail.

1. **Red**: Write a test that covers a specific functionality you want to implement. This test should fail initially because you haven't written the actual code yet. This stage helps you think about the functionality in detail, ponder on the inputs and expected outputs, and outline the structure of your code.

2. **Green**: Write the minimal amount of code needed to pass the test. At this stage, don't worry about the elegance of your code. Your primary focus is on functionality. Run your test, and it should pass this time.

3. **Refactor**: Refactor the code you just wrote in the green stage to eliminate duplication, improve readability, and ensure the code adheres to the best practices. After refactoring, all tests should still pass. If a test fails, it means the refactoring broke the functionality, and you need to revise your changes.

This cycle repeats for every small chunk of functionality you add to your software. With this approach, you are incrementally building your software with the assurance that at each step, the implemented functionality is working as expected.

### The Motivation Behind Test-Driven Development

You might be wondering, why would you want to put in the extra effort to write tests before writing the actual code? Here are a few motivating factors:

1. **Confidence**: With TDD, you can be confident that your code works because you have tests that prove it. This confidence is especially important when you need to modify your code later. Changes can break existing functionality, but with a robust set of tests, you can quickly catch and fix these regressions.

2. **Better Design**: Writing tests first forces you to think about your code from a user's perspective. This shift in viewpoint often results in better code organization and modularity because you design your code to be easy to test, which typically means it is also easy to use and modify.

3. **Documentation**: Tests act as a form of documentation that shows how the code is supposed to work. New team members can look at the tests to understand what each function is supposed to do and what edge cases it handles.

4. **Development Speed**: While TDD might seem to slow you down at the beginning, it typically results in faster development in the long run. With TDD, you spend less time debugging and fixing bugs because you catch them early in the development process, before they become entangled with other parts of the code.

In conclusion, TDD is a powerful methodology that can significantly improve the quality of your code and your efficiency as a developer. While it might seem difficult at first, with practice, it becomes a natural part of the development process.
