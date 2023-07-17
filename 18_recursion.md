---
title: Recursion
---

Recursion is a computational technique in which a function refers to itself in its own definition to solve a problem. The essence of creating recursive functions is ensuring that the recursive call addresses a smaller version of the initial problem. This strategy enables the efficient and elegant decomposition of complex problems into more manageable sub-problems.

Let's consider some key characteristics of recursive functions:

- **Base cases** must exist in any recursive function. These are simple scenarios of the problem that can be solved directly without necessitating a recursive call. Base cases are vital to avoid infinite recursion, a situation where the function endlessly calls itself without termination.
- The **recursive case** comprises a call to the same function but on a smaller scale of the original problem. The arguments passed on during this recursive call should progressively approach the base case.
- Data flows through the recursive calls via function parameters and return values. Parameters help in propagating information forward through the recursive calls until reaching the base case. Conversely, return values relay information back from the base case.

Some Advantages of Recursion -

- Recursive solutions often embody elegance and simplicity that make them easier to understand than their iterative counterparts. The code tends to naturally mirror the structure of the problem.
- Some problems are inherently recursive, such as navigating tree data structures. Here, the tree is a common type of recursive data structure where each node links to smaller subtrees. We will learn more about trees in the next module, but this characteristic makes them ideally suited to recursive approaches.
- Recursive code is typically more concise than equivalent iterative code.

Some Disadvantages of Recursion -

- Recursive calls come with overheads, such as stacking parameters, return addresses, and local variables during each invocation. This additional resource consumption often makes iterative solutions more efficient.
- Recursive code can pose debugging and tracing challenges. Understanding the program flow often involves mentally "unraveling" each recursive call.
- Deeply recursive algorithms risk causing stack overflow exceptions if the recursion depth exceeds the stack's capacity.

Some Examples of Recursive Problems -

- Manipulation of recursive data structures like trees and linked lists. These structures contain smaller instances of themselves, making recursion a natural fit for processing them.
- Certain sorting algorithms, such as quicksort and merge sort, implement recursion.
- Mathematical problems, including the computation of factorials, Fibonacci numbers, and so on, often rely on recursive methods.
- Advanced computational paradigms like divide-and-conquer, backtracking, and dynamic programming frequently use recursion.

## Writing Recursive Functions

Understanding and implementing recursive functions often necessitates thinking of the broader problem in terms of smaller, similar instances. If you can decompose the main problem into subproblems that echo the original, you're in a position to use recursion.

Follow these general steps when designing a recursive function:

1. **Identify the base case(s)**: Determine the simplest version of the problem that can be resolved directly without invoking recursion. This serves as the recursion's termination point.
2. **Reduce the problem**: Consider how the main problem can be diminished to a smaller but similar subproblem.
3. **Invoke the recursive call**: Initiate the recursive call on the smaller subproblem, passing any necessary parameters.
4. **Construct the solution**: Utilize the result of the recursive call to assemble the solution for the original problem.
5. **Return the result**: Once the solution is obtained, return the result.

Let's delve into examples of recursive functions that exhibit diverse structures:

### Single Base Case, Single Recursive Case

This is the most straightforward recursive structure featuring a solitary base case and a single recursive call on a reduced subproblem.

```java
// Calculate factorial of n
int factorial(int n) {
  // Base case
  if (n == 0) {
    return 1; 
  }
  
  // Recursive call
  return n * factorial(n-1);
}
```

In the above code, the base case is when `n` is zero, and the recursive call is made on `n-1` (a smaller instance of the original problem).

### Multiple Base Cases

Some problems might need multiple base cases to accommodate different elementary variants of the problem:

```java
// Count ways to climb n steps 
// Can climb 1 or 2 steps at a time
int countWays(int n) {

  // Base cases
  if (n == 1) {
    return 1;
  }
  if (n == 2) {
    return 2;
  }

  // Recursive calls
  return countWays(n-1) + countWays(n-2);

}
```

Here, there are two base cases (`n == 1` and `n == 2`), reflecting the two possible ways of ascending a short staircase.

### Multiple Recursive Cases

More intricate problems might necessitate multiple recursive calls on diverse subproblems:

```java
// Fibonacci number
int fib(int n) {
  // Base case
  if (n <= 1) { 
    return n;
  } 
  
  // Recursive calls
  return fib(n-1) + fib(n-2);
}
```

The Fibonacci sequence computation involves two recursive calls, each on a different subproblem (`n-1` and `n-2`).

## Writing Advanced Recursive Functions

While some recursive functions feature only a single base case and a single recursive call, it's often the case that a function may have multiple base cases, multiple recursive cases, or a combination of both.

Here's the general template for such a recursive function in Java:

```java
if ( base case 1 ) {
  // return some simple expression
}
else if ( base case 2 ) {
  // return some simple expression
}
...
else if ( recursive case 1 ) {
  // some work before 
  // recursive call 
  // some work after 
 }
...
else { // last recursive case 
  // some work before 
  // recursive call 
  // some work after 
 }
```

Each base case returns a simple expression, whereas each recursive case performs some work before and after the recursive call.

Let's now explore some specific examples.

### Example 1: Prime Number Determination

Consider a function that checks whether a given integer `X` is a prime number. Here, `Y` is a helper variable acting as the divisor. When the function is initially invoked, `Y` is set to `X - 1`.

```java
boolean prime(int x, int y) {
  if (y == 1) {
    return true;
  }
  else if (x % y == 0) {
    return false; 
  }
  else {
    return prime(x, y-1);
  }
}
```

Let's understand how the `prime` function works. Remember, the purpose of this function is to check if a number `X` is prime.

A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself. For instance, the first six prime numbers are 2, 3, 5, 7, 11, and 13.

In our `prime` function, we recursively check if `X` can be evenly divided by any number from `X - 1` down to `2`. If `X` can be evenly divided by any such number (i.e., `x % y == 0` is `true` for some `y`), then `X` is not a prime number, and the function returns `false`.

On the other hand, if `X` cannot be evenly divided by any such number (i.e., we've checked all `y` from `X - 1` down to `2` without finding an even divisor), then `X` is a prime number, and the function returns `true`.

Let's walk through the example of `prime(7, 6)`:

1. Since `y` is not `1`, and `7 % 6` does not equal `0`, we make the recursive call `prime(7, 5)`.
2. Again, `y` is not `1`, and `7 % 5` does not equal `0`, so we make the recursive call `prime(7, 4)`.
3. This pattern continues until we reach `prime(7, 2)`, which again does not evenly divide `7`, so we make the last recursive call `prime(7, 1)`.
4. Now `y` is `1`, so we return `true`, unwinding the recursion and indicating that `7` is indeed a prime number.

This function correctly identifies whether a number `X` is prime. As with all recursive functions, it is important to understand the base case(s) and how the recursive calls are working towards reaching them. The process of "winding" (making recursive calls) and "unwinding" (returning from recursive calls) is central to how recursion works.

### Example 2: Subset Sum Problem

The following function, `isSubsetSum`, checks whether a subset of an integer array `set` can sum up to a given number `sum`. Here, `n` represents the number of array elements to consider. We don't directly use `set.length` as recursive calls need to examine only part of the array.

```java
boolean isSubsetSum(int set[], int n, int sum) {
  if (sum == 0) {
    return true;
  }
  if ((n == 0) && (sum != 0)) {
    return false;
  }
  if (set[n - 1] > sum) {
    return isSubsetSum(set, n - 1, sum);
  }
  return isSubsetSum(set, n - 1, sum) || isSubsetSum(set, n - 1, sum - set[n - 1]); 
}
```

To understand how this function works, we need to consider the problem it's trying to solve: checking if there is a subset of `set` that sums up to `sum`. It does this by recursively examining each element in `set` and checking two cases:

1. Is there a subset within the first `n - 1` elements of `set` that sums to `sum` (i.e., the current element is not included in the sum)?
2. Is there a subset within the first `n - 1` elements that sums to `sum - set[n - 1]` (i.e., the current element is included in the sum)?

Before checking these two cases, we have three base cases:

1. If `sum == 0`, the function returns `true`. This is because an empty set always sums to `0`.
2. If `n == 0` (i.e., there are no more elements to consider) and `sum` is not zero, the function returns `false` as there are no more numbers to add up to `sum`.
3. If the current element (i.e., `set[n - 1]`) is larger than `sum`, we cannot include this element in the sum, so we only check for a subset within the first `n - 1` elements that sum to `sum`.

To illustrate this, let's trace `isSubsetSum([3, 1, 5, 9, 12], 5, 9)`, which checks if there's a subset of `[3, 1, 5, 9, 12]` that sums to `9`.

The recursive tree will look like this:

```
isSubsetSum([3, 1, 5, 9, 12], 5, 9)
|____ isSubsetSum([3, 1, 5, 9, 12], 4, 9) 
|     |____ isSubsetSum([3, 1, 5, 9, 12], 3, 9) 
|     |     |____ isSubsetSum([3, 1, 5, 9, 12], 2, 9)
|     |     |     |____ isSubsetSum([3, 1, 5, 9, 12], 1, 9)  => False
|     |     |     |____ isSubsetSum([3, 1, 5, 9, 12], 1, 6)  => False
|     |     |____ isSubsetSum([3, 1, 5, 9, 12], 2, 4)
|     |           |____ isSubsetSum([3, 1, 5, 9, 12], 1, 4) => False
|     |           |____ isSubsetSum([3, 1, 5, 9, 12], 1, 3) => True
|     |____ isSubsetSum([3, 1, 5, 9, 12], 3, 0) => True
|____ isSubsetSum([3, 1, 5, 9, 12], 4, -3)  => False
```

So, the function will return `true` as there exists a subset (3, 1, 5) that sums up to `9`.

By recursively breaking down the problem, `isSubsetSum` can effectively and efficiently find whether there's a subset that matches the desired sum. This illustrates how recursive functions can solve complex problems that might be non-intuitive or hard to solve with iterative methods.

### Example 3: Basketball Scoring Combinations

In this example, we create a function `paths` to calculate the number of ways to reach a given score in a basketball game, given that points can be accumulated in increments of 1, 2, or 3. If `n = 3`, for instance, `paths` will return 4, since there are four different ways to accumulate 3 points: `1+1+1`, `1+2`, `2+1`, and `3`.

```java
int paths(int n) {
  if (n == 1) {
    return 1;
  }
  if (n == 2) {
    return 2;
  }
  if (n == 3) {
    return 4;
  }
  return paths(n - 1) + paths(n - 2) + paths(n - 3);
}
```

The function uses three base cases (`n == 1`, `n == 2`, `n == 3`) and three recursive calls, each corresponding to scoring 1, 2, or 3 points respectively. Let's dive into how this function works. This recursive function is a little more complex than the previous factorial example because it has three base cases and makes three recursive calls. However, the principle is the same: we build up a complex calculation from simpler parts, and then start "unwinding" once we hit the base cases.

The `paths` function takes an integer `n` as its argument and returns the number of possible ways to reach `n` points in a basketball game. This is a classic combinatorial problem: we're essentially counting the number of unique combinations of 1s, 2s, and 3s that can add up to `n`.

Let's trace the function call `paths(4)` as an example:

- First, the function checks if `n` is 1, 2, or 3 — these are our base cases. If `n` is one of these numbers, the function can immediately return the result. But in our case, `n` is 4, so we proceed to the recursive part of the function.
- Now the function makes three recursive calls: `paths(n - 1)`, `paths(n - 2)`, and `paths(n - 3)`, or `paths(3)`, `paths(2)`, and `paths(1)`. These represent the three ways we could reach 4 points: by scoring a point when we had 3, by scoring 2 points when we had 2, or by scoring 3 points when we had 1.
- Each of these calls will in turn make their own recursive calls, until they eventually hit one of the base cases. At that point, the function will start returning values back up the call stack.

So for `paths(4)`, we would have:

- `paths(4) = paths(3) + paths(2) + paths(1)`
- `paths(3) = 4` (from the base case)
- `paths(2) = 2` (from the base case)
- `paths(1) = 1` (from the base case)
- Therefore, `paths(4) = 4 + 2 + 1 = 7`

So there are seven ways to reach a score of 4 points.

This kind of tracing can help you understand how recursion builds up complex computations from simpler parts, and how the function's call stack unwinds once it hits the base cases. Try applying this method of tracing to other recursive functions to get a feel for how they work.

Remember to take the time to understand how each of these functions work. Recursion can seem complex at first, but with practice, it becomes a powerful tool in your programming arsenal.

## Tracing Recursive Code

While creating recursive functions, it is beneficial to approach the task in a top-down manner. Trust that the recursive call will correctly solve the subproblem, and then use that result, as you would with any other function, to solve the original problem.

However, when analyzing or tracing a recursive function, you do need to understand how the function operates. Tracing a few recursive functions helps you grasp the behavior of recursion. With experience, you won't need to trace through every detail. Your understanding of recursion will gradually solidify, and your confidence will grow.

Recursive calls operate in two phases: the "winding" phase, where information is passed from one recursive call to the next, and the "unwinding" phase, where return values are passed back. These phases are sometimes overlooked, but they are essential to understanding recursion.

In the winding phase, any parameter passed through the recursive call travels forward until the base case is reached. In the unwinding phase, the function's return value (if any) travels backward to the calling function.

Let's illustrate this with an example: a recursive function to compute the factorial of a number.

```java
int factorial(int n) {
  if (n == 0) {
    return 1;  // base case
  } else {
    return n * factorial(n - 1);  // recursive case
  }
}
```

In this case, the information (the decremented value of `n`) flows forward during the winding phase, and the computed factorial flows backward during the unwinding phase.

A recursive function can also pass multiple parameters forward. For instance, a function that recursively sums the values in an array might pass the array and the current index in the winding phase, and return the cumulative sum during the unwinding phase.

```java
int arraySum(int[] arr, int n) {
  if (n <= 0) {
    return 0;  // base case
  } else {
    return arr[n - 1] + arraySum(arr, n - 1);  // recursive case
  }
}
```

In this case, the array and the index (`n - 1`) are passed forward in the winding phase, while the summed value so far is passed back during the unwinding phase.

To better understand the idea of recursion, consider it as a domino effect where each recursive call is like tipping over a domino. These rules can guide your thinking:

1. Just like the first domino has to be tipped manually, the base case solution in recursion is computed non-recursively.

2. Before any given domino can fall, all preceding dominos must have been tipped over. Similarly, before any recursive call can complete, all deeper recursive calls must complete.

Through this process of tracing and understanding, recursion becomes a powerful tool in problem-solving.

## Practice Exercises

Now that we've laid out the theory of recursion and tracing recursive calls, let's get some hands-on practice with some exercises. Remember, the more you practice, the better you'll understand how recursion works.

### Exercise 1: Factorial Function

Consider the recursive function for calculating the factorial of a number:

```java
int factorial(int n) {
  if (n == 0) {
    return 1;
  }
  else {
    return n * factorial(n - 1);
  }
}
```

**Task:** Trace the recursive calls made when `factorial(4)` is called.

### Exercise 2: Fibonacci Series

Consider the recursive function for generating the Fibonacci series:

```java
int fibonacci(int n) {
  if (n <= 1) {
    return n;
  }
  else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}
```

**Task:** Trace the recursive calls made when `fibonacci(5)` is called. Pay close attention to how the same sub-problems are solved multiple times.

### Exercise 3: Sum of Array Elements

Consider the recursive function for finding the sum of all elements in an array:

```java
int sumArray(int[] arr, int n) {
  if (n <= 0) {
    return 0;
  }
  else {
    return sumArray(arr, n-1) + arr[n-1];
  }
}
```

**Task:** Given the array `{1, 2, 3, 4, 5}`, trace the recursive calls made when `sumArray(arr, 5)` is called.

Take your time working through these exercises and understand how each recursive call is made. After you've completed them, try creating your own recursive functions and tracing through their calls.

If you're still finding it difficult to understand how the tracing is done, don't hesitate to ask for help. Recursion is a difficult concept to grasp initially, but with practice and patience, it'll become much clearer.

## Solution Walkthrough: Factorial Function

Let's trace the recursive calls made when we calculate `factorial(4)` using our recursive factorial function. Here's the function again for reference:

```java
int factorial(int n) {
  if (n == 0) {
    return 1;
  }
  else {
    return n * factorial(n - 1);
  }
}
```

When we call `factorial(4)`, we're not at the base case (`n == 0`), so we go to the else clause. Here, we calculate `4 * factorial(4 - 1)`, or `4 * factorial(3)`. Now, we need to calculate `factorial(3)` before we can continue. This process repeats for each recursive call:

- `factorial(4) = 4 * factorial(3)`
- `factorial(3) = 3 * factorial(2)`
- `factorial(2) = 2 * factorial(1)`
- `factorial(1) = 1 * factorial(0)`

Once we reach `factorial(0)`, we've hit our base case, and the function returns `1`:

- `factorial(0) = 1`

Now we can start unwinding the stack of calls:

- `factorial(1) = 1 * 1 = 1`
- `factorial(2) = 2 * 1 = 2`
- `factorial(3) = 3 * 2 = 6`
- `factorial(4) = 4 * 6 = 24`

So, `factorial(4)` returns `24`. You can see how each recursive call builds on the previous one, and the base case provides the starting point for the calculation to unwind.

This same approach can be applied to other recursive functions to understand how they work. Try it out with the remaining exercises to practice tracing recursive calls.
