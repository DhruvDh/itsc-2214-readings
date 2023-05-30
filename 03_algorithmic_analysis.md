---
title: "Algorithmic Analysis"
---

In this chapter, we will delve into the exciting world of algorithmic analysis. The objectives of this chapter are to learn to communicate the speed of an algorithm effectively and to appraise the performance of an algorithm from pseudocode or Java code.

## Problems, Algorithms, and Programs

Before understanding algorithmic analysis, it's essential to differentiate between problems, algorithms, and computer programs. These are three distinct concepts that are interrelated.

### Problems

A problem in computer science refers to a specific task that needs to be solved. It can be thought of in terms of inputs and matching outputs. For instance, to solve the problem of finding the youngest student in our class, the input would be the names and ages of all students in the class. The output would be the name of the youngest student.

It's helpful to perceive problems as functions in a mathematical sense. In mathematics, a function is a relationship or correspondence between two sets — the input set (domain) and the output set (range).

### Algorithms

An algorithm, on the other hand, is a method or a process followed to solve a problem. If we perceive the problem as a function, then an algorithm can be seen as an implementation of this function that transforms an input into the corresponding output.

Since there are typically numerous ways to solve a problem, there could be many different algorithms for the same problem. Having multiple solutions is advantageous because a specific solution might be more efficient than others for certain variations of the problem or specific types of inputs.

For instance, one sorting algorithm might be best suited for sorting a small collection of integers. Another might excel in sorting a large collection of integers, while a third might be ideal for sorting a collection of variable-length strings.

By definition, a sequence of steps can only be called an algorithm if it fulfills the following properties:

- It must be correct.
- It consists of a series of concrete steps.
- There is no ambiguity about the step to be performed next.
- It must comprise a finite number of steps.
- It must terminate.

### Programs and Their Building Blocks

Before discussing programs in detail, let's briefly review two essential components that make a program run: the CPU (Central Processing Unit) and memory.

A CPU is the electronic circuitry within a computer that has the ability to execute certain instructions. Its primary function is to fetch, decode, and execute instructions. It has slots to store data, referred to as registers. Communicating with a CPU involves telling it what operation you want to perform and on which data. For instance, you might instruct the CPU to add two numbers stored in registers `A` and `B` and store the result in register `C`.

CPU instructions are binary codes that specify which operation the CPU should perform. Here's an example of what they look like:

```
10010011001100111110000111011111
```

Some bits in the instruction form the `opcode`, the operation code. The opcode is a unique identifier for an operation, like adding integers. Other bits form the `operand`(s), the data on which to operate. The operand can be where the data is stored (the name of a register or an address in memory), or where to store the result of the operation (again, the name of a register or an address in memory).

For human readability, there are notations to represent these binary instructions. Here is an example of a set of instructions in a human-readable form:

```asm
.global main
main:
addi   sp, sp, -16
sd     t0, 0(sp)
sd     t1, 8(sp)
call   some_function
ld     t0, 0(sp)
ld     t1, 8(sp)
# Use t0 and t1 here as if nothing happened.
addi   sp, sp, 16
```

Programs are structured into sections. They include code sections, which contain a list of instructions, and data sections, which hold binary data such as text, images, or numbers that the program needs to use. Typically, there is a designated "main" section that contains the instructions to be executed first.

When you initiate an executable (with the exception of Mac "applications"), the binary data ("bits") are read from the hard disk and transferred to the main memory (RAM). The execution of the program begins when the first instruction from the "main" section is transferred to the CPU.

In this context, a computer program’s code can be seen as an instance, or concrete representation, of an algorithm. Although the terms “algorithm” and “program” are distinct, they are often used interchangeably for simplification.

## Comparing the Performance of Programs

When you compile or build a program, its code is converted into a series of instructions and data in memory. However, the execution time of the same program can vary across different machines due to differences in the processor's capabilities.

As each machine can potentially have a different processor, comparing the speed of programs can be a complex task, and is only meaningful when the processor is the same or standardized. Even when the processor is standardized, many factors affect performance -

- Background tasks on one machine can interfere with performance measurements.
- Even if you have the exact same processor, differences in manufacturing mean each can run at a different clock frequency.
- Small differences in ambient temperature affect how high a processor can clock.
- The mounting pressure of a cooler can affect heat transfer and in turn how high a processor can clock.
- Many cooling solutions involve vapor chambers. The orientation of vapor chambers can affect heat transfer and in turn how high a processor can clock.
- Even cosmic radiation can affect processors and memory.

Therefore, we usually prefer to compare algorithms instead. The methods of comparing algorithms will be discussed in the following sections of this chapter.

## Analyzing Algorithms

One of the key components of this course is to provide a framework for predicting the performance of algorithms just by inspecting their structure. Let's dive into the process of analyzing an algorithm's time complexity.

### Predicting Execution Time

Consider a simple method that adds two numbers:

```java
public int add(int lhs, int rhs)
```

Suppose calling `add(2, 4)` takes 1 second. How long would `add(40, 50)` or `add(343245634, 32432423)` take? As you might expect, all these operations, despite the difference in magnitude of the numbers involved, take approximately the same time. That's because the time complexity of an addition operation does not depend on the values of the numbers but on the number of operations involved, which, in this case, is a single addition.

### Impact of Input Size

Now, let's examine a slightly more complex method that sums up a list of numbers:

```java
public int sumOfList(List<int> l)
  ```

  Assuming that adding two numbers takes one second, how long would summing a list of 10 numbers take? We can infer that the time taken by `sumOfList` depends on the size of the list we provide. For instance, summing up a list of 10 numbers would take about half the time needed to sum up a list of 20 numbers.

  Here's an implementation of `sumOfList`:

  ```java
  import java.util.ArrayList;

  class Square {
    static int sumOfList(ArrayList<Integer> l) {
      int sum = 0;
      for (int i : l) {
        sum += i;
      }
      return sum;
    }
  }
  ```

  The key insight is that the execution time of this method depends on the number of elements in the list - which is the size of the input. The time complexity is directly proportional to the number of times the addition statement is executed, which is equal to the size of the list.

### Iterations and Input Size

  Let's take it a step further. If you're summing a list of N items, each of which is another list of M items, the operation would take N * M addition statements. Here, the time complexity is a function of both N and M.

### Gauging Relative Execution Time

  The crux of analyzing an algorithm's performance lies in understanding how many times statements in the program run as a function of the size of the input. This approach enables us to estimate how long two invocations of the same method will take relative to each other, given the size of the input for each.

  Understanding this concept will allow you to better predict the performance of algorithms, which is a crucial skill in efficient programming and system design.

## Algorithm Complexities

  In order to evaluate an algorithm's efficiency, we analyze its time complexity and space complexity, both of which describe how the algorithm's performance scales with the size of the input.

### Time Complexity

  Time complexity measures how the execution time of an algorithm increases with the size of the input. For instance, counting how many times the number $5$ appears in a list requires checking each number in the list. Hence, the time complexity is directly proportional to the size of the list.

### Space Complexity

  Space complexity quantifies the amount of memory an algorithm requires relative to the size of the input. Using the previous example, we would need enough space to store the list and an additional space to store the counter. Thus, the space complexity is proportional to the size of the list, or more precisely, $N + 1$.

### Conditional Statements and Complexity

  In cases where conditional statements are present, the number of executed statements depends on which branch the program takes. One branch may contain more statements than the other. To handle such scenarios, we introduce the concept of Big-O, Big-Ω, and Big-Θ notations.

#### Big-O Notation

  The Big-O notation describes the worst-case time complexity of an algorithm, essentially providing an upper bound on the time taken. This notation considers the scenario where the program consistently takes the path with the most statements. While Big-O is commonly used for time complexity, it can also describe space complexity.

  The notation comprises two parts: the function itself and the variable representing the input size. Generally, 'n' is used to represent the input size, and constants and coefficients are typically ignored. For instance, the following functions are all $O(n)$:

- $n + 1$
- $2n$
- $103n + 124$

  Only the highest degree of 'n' is considered when determining Big-O notation. Therefore, functions such as n², n/2, or √n are not considered O(n).

#### Big-Ω Notation

  The Big-Ω notation represents the best-case complexity of an algorithm. It follows the same format as Big-O notation but focuses on the scenario where the program consistently takes the path with the fewest statements.

#### Big-Θ Notation

  The Big-Θ notation is used to denote the average-case complexity of an algorithm. It again follows the same structure as Big-O, but it considers both the best and worst-case scenarios to provide an average estimate of the algorithm's performance.

  Remember, these notations and complexities are pivotal in estimating the performance of an algorithm based on the size or other properties of the input, correlating to the number of steps taken by the algorithm. This understanding is crucial when designing efficient and effective solutions in computer science.

## Common Big-O Complexities

Big-O notation is a way of expressing the worst-case time complexity of an algorithm. It describes how the running time of an algorithm changes as the size of its input grows. The most common Big-O complexities are:

- $O(1)$: Constant time. The algorithm takes a fixed amount of time to finish, regardless of the input size. This is the best possible complexity.
- $O(log(n))$: Logarithmic time. The algorithm takes a time that is proportional to the logarithm of the input size. This means that the running time increases slowly as the input size grows. This is a very good complexity.
- $O(n)$: Linear time. The algorithm takes a time that is proportional to the input size. This means that the running time increases at the same rate as the input size grows. This is a common and acceptable complexity.
- $O(n^2)$: Quadratic time. The algorithm takes a time that is proportional to the square of the input size. This means that the running time increases rapidly as the input size grows. This is a common and often undesirable complexity.
- $O(2^n)$: Exponential time. The algorithm takes a time that is proportional to $2^n$ of the input size. This means that the running time increases exponentially as the input size grows. This is a very bad complexity and should be avoided if possible.

### Examples

Let's look at some examples of algorithms and their Big-O complexities.

```java
static int findMin(x, y) {
  if (x < y) {
    return x;
  } else {
    return y;
  }
}
```

This algorithm finds the minimum of two numbers x and y. It does not depend on the input size, since it only performs one comparison and one return statement. Therefore, its worst-case complexity is $O(1)$. Its best case and average case are also $O(1)$ since they are the same as the worst case.

```java
static int linearSearch(numbers[], target)
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] == target) {
      return i;
    }
  }
  return -1;
}
```

This algorithm performs a linear search on an array of numbers to find a target value. It iterates through each element of the array until it finds the target or reaches the end of the array. In the worst case, it has to check every element of the array, which means its worst-case complexity is $O(n)$, where n is the length of the array. In the best case, it finds the target in the first element, which means its best-case complexity is $O(1)$. In the average case, it finds the target somewhere in the middle of the array, which means its average-case complexity is also $O(n)$.

We will talk about more examples of other common worst-case complexities throughout this course.

## Growth Rate

The growth rate for an algorithm is the rate at which the cost of the algorithm grows as the size of its input grows. The cost can be measured in terms of time, space, or other resources. The worst-case complexity notation essentially denotes the growth rate of the time complexity with respect to the size of a worst-case input.

The table below summarizes how different Big-O complexities compare in terms of their growth rates.

| Complexity  | Growth Rate |
| ----- | -- |
| O(1)        | Constant    |
| O($log(n)$) | Logarithmic |
| O(n)        | Linear      |
| O(n$^2$)    | Quadratic   |
| O($2^n$)    | Exponential |

As we can see, constant and logarithmic complexities have very low growth rates, meaning that they are very efficient and scalable algorithms. Linear complexity has a moderate growth rate, meaning that it can handle reasonably large inputs but may become slow for very large inputs. Quadratic and exponential complexities have very high growth rates, meaning that they are very inefficient and unscalable algorithms that can only handle small inputs.

## Summary / Review

In this section, we learned how to analyze the performance of algorithms using Big-O notation. We saw that measuring the actual running time of an algorithm on real hardware is difficult and impractical because it depends on many factors such as the hardware specifications, the programming language, the compiler, the input size, and the input distribution. Therefore, we need a way to simplify and standardize the performance analysis across different hardware and software platforms.

We learned that one way to simplify the performance analysis is to count the number of steps or instructions that an algorithm needs to execute before finishing. We saw that these steps are analogous to the instructions generated by a compiler when it translates our code into machine code. We also learned that different steps may have different costs depending on their complexity, but we can ignore these differences for simplicity and focus on the overall number of steps.

We learned that Big-O notation is a mathematical tool that allows us to express the worst-case complexity of an algorithm. It describes how the number of steps grows as a function of the input size in the worst possible scenario. It gives us an upper bound on the performance of an algorithm, meaning that it tells us how slow an algorithm can get in the worst case. We also learned that Big-O notation ignores constant factors and lower-order terms because they become insignificant as the input size grows.

We learned about some common Big-O complexities and their growth rates, such as constant, logarithmic, linear, quadratic, and exponential. We saw some examples of algorithms and their Big-O complexities, and how to analyze them using simple rules such as adding complexities for sequential steps, multiplying complexities for nested steps, and taking the maximum complexity for conditional steps.

We learned that Big-O notation helps us compare different algorithms and choose the most efficient one for a given problem. It also helps us estimate how well an algorithm can scale to larger inputs and how it can affect the performance of our applications.
