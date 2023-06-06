---
title: "Unit Testing and Test-Driven Development" 
---

## Background

Imagine you are an architect and you've just designed a large, complex building - let's say a skyscraper. This skyscraper is not merely a single entity; it's composed of thousands of individual components - the plumbing, the electrical wiring, the elevators, the heating system, and the building's structural elements, among many others. Now, how would you ensure that the skyscraper works as intended? Would you wait until the entire building is constructed and then start testing every possible scenario? Obviously, this approach is time-consuming, and it exposes you to significant risk.

A similar challenge exists in the world of software development. Take, for example, a web browser. This is a complex piece of software with hundreds of classes interacting in intricate ways. These classes and methods perform various tasks such as rendering HTML and CSS, processing JavaScript, managing cookies, implementing security features, and many others. Ensuring the correct functionality of this software is a daunting task, given the vast range of potential inputs. After all, there are billions of web pages on the internet, each with its unique combination of technologies, designs, and user interactions. How can you guarantee that your browser works flawlessly with all of them? A naive approach would be to load each web page and observe the output, but this process is not only time-consuming but also practically impossible.

This conundrum begs the question: How can we validate the correct functionality of a software product efficiently? The direction points towards automation - the ability to conduct tests without manual intervention. But how can we achieve this, especially given the enormous application surface area?

This is where unit testing and Test-Driven Development (TDD) come in.

## The Power of Unit Testing

While the surface area of an entire application is vast, the surface area of individual classes and units of code within the software project is significantly smaller. If we can write tests to verify that each method within each class functions correctly for all possible inputs, we reduce the complexity of the problem.

At first glance, it might seem like an overwhelming task. Even a moderately complex software project can have thousands of methods spread across hundreds of classes. Writing tests for all of them could result in thousands of test cases. But this is precisely where automation proves its worth. By automating these tests, we can execute them each time we modify our code, ensuring the functionality remains intact. This method gives us confidence that our changes have not inadvertently introduced bugs into existing functionality.

The key principle here is that by ensuring each individual unit of our software behaves correctly, we can be reasonably confident that the application as a whole operates as expected, provided the software architecture is sound. In this manner, unit testing allows us to break down the monumental task of verifying a complex software system's functionality into manageable, automated tasks.

In the following sections, we will delve deeper into the concept of unit testing, its implementation in Java, and the practice of Test-Driven Development, where tests actually guide and shape the development of the software. Buckle up, for we're about to embark on an exciting journey that will fundamentally change how you approach software development!

## A Basic Approach to Unit Testing

In order to illustrate the process of unit testing in Java, let's consider a simple utility class named `MathUtil`. This class defines basic arithmetic operations such as `add`, `subtract`, etc.

```java
public class MathUtil {
    public int add(int a, int b) {
        return a + b;
    }
    
    // More methods for subtract, multiply, etc.
}
```

As we discussed in the previous section, to ensure our `MathUtil` functions correctly, we associate it with a `MathUtilTest` class. This class contains multiple test methods, each designed to verify a different scenario of the operations provided by `MathUtil`.

```java
public class MathUtilTest {

    public boolean testAdd1() {
        MathUtil m = new MathUtil();
        int lhs = 5;
        int rhs = 7;

        if (m.add(lhs, rhs) == lhs + rhs) {
            return true;
        } else {
            return false;
        }
    }
    
    // More test methods for other cases...
}
```

In the above example, the `testAdd1` method tests the addition of two positive numbers. We could also add methods like `testAdd2` to test adding a positive and a negative number, `testAdd3` to test adding two negative numbers, and so forth. Each of these methods tests a specific scenario and validates that the result is as expected.

## Recognizing the Inefficiencies and Redundancies

While the above approach accomplishes our objective of validating the methods in our `MathUtil` class, you might have already noticed that it's far from optimal. There are several glaring issues that can make this method tedious and inefficient:

### Redundancy

Every test method follows a similar pattern - we perform an operation and then verify if the result matches the expected outcome. This redundancy suggests we could abstract out the verification part into a separate method.

In the following expanded `MathUtilTest` class, you can observe that `testAdd2` and `testAdd3` follow the exact same pattern as `testAdd1`. They create an instance of `MathUtil`, perform an operation, and then compare the result with the expected outcome. This repetitive pattern across multiple tests highlights the redundancy and inefficiency of this approach.

```java
public class MathUtilTest {

    public boolean testAdd1() {
        MathUtil m = new MathUtil();
        int lhs = 5;
        int rhs = 7;

        if (m.add(lhs, rhs) == lhs + rhs) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean testAdd2() {
        MathUtil m = new MathUtil();
        int lhs = -5;
        int rhs = 7;

        if (m.add(lhs, rhs) == lhs + rhs) {
            return true;
        } else {
            return false;
        }
    }

    public boolean testAdd3() {
        MathUtil m = new MathUtil();
        int lhs = -5;
        int rhs = -7;

        if (m.add(lhs, rhs) == lhs + rhs) {
            return true;
        } else {
            return false;
        }
    }
    
    // More test methods for other cases...
}
```

### Lack of Automation

Let's see how we need to currently run the tests we've written.

```java
public class MathUtilTest {

    // testAdd1, testAdd2, testAdd3, etc. test methods...

    public static void main(String[] args) {
        MathUtilTest test = new MathUtilTest();

        System.out.println("testAdd1 result: " + (test.testAdd1() ? "PASS" : "FAIL"));
        System.out.println("testAdd2 result: " + (test.testAdd2() ? "PASS" : "FAIL"));
        System.out.println("testAdd3 result: " + (test.testAdd3() ? "PASS" : "FAIL"));

        // add more prints for other test cases
    }
}
```

With this `main` method, you can now run the `MathUtilTest` class, and it will execute each of the `testAdd` methods and print whether each test passed or failed. This method is a basic way to manually execute the tests and check their results.

Currently, we need to call each test method manually to run our tests. An automated system that could execute all tests for us would save time and reduce the chances of human error. However, as we will see later, there are better approaches to automation than the one we've used here.

## A slightly more sophisticated approach to Unit Testing

To alleviate the redundancy, we can create a method that compares the expected and actual results and raises an error if they do not match. This method, which we can call `assertEquals`, would look something like this:

```java
public static void assertEquals(String testCaseName, int expected, int actual) {
    if (expected != actual) {
        System.out.println(testCaseName + " result: FAIL");
    } else {
        System.out.println(testCaseName + " result: PASS");
    }
}
```

Then we can simplify our test methods by using `assertEquals`:

```java
public void testAdd() {
    MathUtil m = new MathUtil();

    assertEquals("testAddTwoPositive", m.add(5, 7), 13);
    assertEquals("testAddTwoNegative", m.add(-5, -7), -13);
    assertEquals("testAddNegPos", m.add(-5, 7), 2);
}
```

Now, our test case looks cleaner and easier to understand. The `assertEquals` method abstracts away the comparison details, leaving only the test logic in the test case. We can apply this simplification to all our test methods.

This approach significantly reduces the redundancy in our test code, making it easier to write and maintain our tests. However, we are still manually running each test method from the `main` method. What if we could also automate the execution of all test methods?

## Automating Test Execution

What if we could just call a single method that runs all our test methods? Let's define a simple `runTests` method that does exactly that.

```java
public void runTests() {
    testAdd();
    // Call all other test methods here...
}
```

And then you can simply call the `runTests` method to execute all your tests:

```java
public static void main(String[] args) {
    MathUtilTest test = new MathUtilTest();
    test.runTests();
}
```

This approach is an improvement over manually running each test. However, it still has some drawbacks. For instance, when you add a new test method, you need to remember to add a call to this method in the `runTests` method. It would be better if our test framework could automatically detect and run all test methods without requiring any modifications to the `runTests` method. As we'll see later, this is precisely what test frameworks like JUnit offer.

## Summary

So far, we have seen how unit testing can be a powerful tool in ensuring that individual units of code within a larger software application function as expected. We have also discussed and implemented a basic system for automating unit tests in Java, gradually refining this system to make it more efficient and less redundant.

In the following sections, we will discuss JUnit, a popular unit testing framework in Java that takes automation and convenience to the next level. We will also explore the practice of Test-Driven Development, where we let our tests guide the development of our software, helping us to write cleaner, more robust code. Stay tuned!
