---
title: "Stack Data Structure"
---

## Introduction

A stack is a linear data structure that follows a **last-in-first-out (LIFO)** principle. That means the last element added to a stack is the first one to be removed. A stack has only one end, called the **top**, where elements can be inserted or deleted.

You can think of a stack as a pile of books. You can only add or remove books from the top of the pile. The book that you added last will be on top, and you have to remove it first before you can access any other book below it.

Stacks are useful for many applications that require reversing, backtracking, or undoing operations. For example, when you use an undo button in a text editor, you are using a stack to store your previous actions and revert them in reverse order.

## Operations on a Stack

The two basic operations of a stack are **push** and **pop**. Push adds a new element to the top of the stack, while pop removes an element from the top of the stack. Both operations take constant time, that is **O(1)**, because they only involve changing one pointer.

Another operation that can be useful for stacks is **peek**. Peek returns the top element of the stack without removing it. This can be helpful for checking what is on top of the stack before performing any other operation. Peek also takes constant time, **O(1)**, because it only accesses one element.

Here is an example of how these operations work on a stack:

- Initially, the stack is empty: `[]`
- Push 10: `[10]`
- Push 20: `[10, 20]`
- Push 30: `[10, 20, 30]`
- Pop: returns 30 and removes it from the stack: `[10, 20]`
- Peek: returns 20 but does not remove it from the stack: `[10, 20]`
- Pop: returns 20 and removes it from the stack: `[10]`
- Pop: returns 10 and removes it from the stack: `[]`
- Pop: returns an error or null because there is nothing to pop

## Applications of a Stack

Stacks have many applications in various domains, such as expression evaluation, backtracking, function calls, undo/redo operations, browser history, etc. In this section, we will focus on one application: expression evaluation.

Expression evaluation is the process of computing the value of an arithmetic or logical expression. For example, given an expression like `2 + 3 4 - 5 / (6 + 7)`, we want to find its value according to some rules of precedence and associativity.

So, for the problem of "Expression evaluation", the input is a **string** like `"2 + 3 * 4 - 5 / (6 + 7)"`, and the output is the **value** of the expression as an integer or a floating point number. This is much harder to do than it initially appears to be, particularly when we consider the rules of precedence and associativity.

To solve this problem, we can first convert an expression from infix notation (where operators are between operands) to postfix notation (where operators are after operands) using a stack.

It is useful to convert infix expressions to postfix expressions because postfix expressions are easier for computers to evaluate. Postfix expressions do not need parentheses or precedence rules to determine the order of operations. They can be evaluated from left to right using a stack.

- Infix: `2 + 3 * 4` (=> `2 + 12` => `14`)
- Postfix: `2 3 4 * +` (=> `2 12 +` => `14`)
- Infix: `2 + 3 * 4 - 5 / (6 + 7)`
- Postfix: `2 3 4 * + 5 6 7 + / -`

For example, to evaluate a postfix expression like `2 3 4 * +`, we can use a stack as follows:

1. Scan the expression from left to right
2. If we encounter an operand (a number), we push it onto the stack
3. If we encounter an operator (+, -, *, /), we pop two operands from the stack, apply the operator on them, and push the result back onto the stack
4. At the end of the expression, there will be only one value on the stack, which is the final result.

Here are the steps in action -

1. Scan the expression from left to right - `2 3 4 * +`
2. Encounter 2, push it onto the stack (stack: [2])
3. Encounter 3, push it onto the stack (stack: [2, 3])
4. Encounter 4, push it onto the stack (stack: [2, 3, 4])
5. Encounter \, pop two operands (4 and 3) from the stack and apply \ on them. Push the result (12) onto the stack.(stack: [2, 12])
6. Encounter +, pop two operands (12 and 2) from the stack and apply + on them. Push the result (14) onto the stack. (stack: [14])
7. Reach the end of the expression, pop the final result (14) from the stack and output it. (stack: [])  

As for how you convert an infix expression to a postfix expression, you can use stacks again! Here are the steps:

1. If we encounter an operand (a number), we append it to the output string.
2. If we encounter an operator (+, -, *, /), we push it onto the stack if it has higher precedence than the top of the stack. Otherwise, we pop all operators with equal or higher precedence than it from the stack and append them to the output string. Then we push it onto the stack.
3. If we encounter a left parenthesis ‘(’, we push it onto the stack.
4. If we encounter a right parenthesis ‘)’, we pop all operators from the stack until we reach a left parenthesis ‘(’ and append them to the output string. Then we discard both parentheses.
5. If we reach the end of the input, pop all operators from the stack and append them to the output string.
6. The final output string is the postfix expression.

For example, to convert the infix expression `2 + 3 * 4 - 5 / (6 + 7)` to postfix, we can use a stack as follows:

1. Scan the expression from left to right - 2 + 3 * 4 - 5 / (6 + 7)
2. Encounter 2, append it to the output string `(output: 2)`
3. Encounter +, push it onto the stack `(stack: [+])`
4. Encounter 3, append it to the output string `(output: 2 3)`
5. Encounter *, push it onto the stack `(stack: [+, *])`
6. Encounter 4, append it to the output string `(output: 2 3 4)`
7. Encounter -, push it onto the stack `(stack: [+, *, -])`
8. Encounter 5, append it to the output string `(output: 2 3 4 5)`
9. Encounter /, pop all operators with higher or equal precedence from the stack and append them to the output string. Then push / onto the stack `(output: 2 3 4 5 * /, stack: [+, -])`
10. Encounter (, push it onto the stack `(stack: [+, -, (])`
11. Encounter 6, append it to the output string `(output: 2 3 4 5 * / 6)`
12. Encounter +, push it onto the stack `(stack: [+, -, (, +])`
13. Encounter 7, append it to the output string `(output: 2 3 4 5 * / 6 7)`
14. Encounter ), pop all operators from the stack until we reach the matching left parenthesis and append them to the output string. Discard both parentheses `(output: 2 3 4 5 * / 6 7 + -, stack: [+])`
15. Pop the remaining operator (+) from the stack and append it to the output string `(output: 2 3 4 5 */ 6 7 + - +)`

The final output string is `2 3 4* + 5 6 7 + / -`, which is the postfix notation of the original infix expression.
