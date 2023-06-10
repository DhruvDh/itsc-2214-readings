---
title: "Linear Search"
---


Linear search is one of the simplest searching algorithms. The linear search algorithm scans one item at a time, without jumping to any item. It starts at the beginning of a list (or array) and sequentially checks each element until it finds a match.

Here's a general breakdown of how the linear search algorithm works:

1. It starts at the first item in the list.
2. It moves from item to item, checking if the current item is equal to the item being searched.
3. If a match is found, the algorithm stops and returns the index of the item.
4. If the algorithm reaches the end of the list without finding a match, it returns a signal that no match was found (often this is -1 or null).

Linear search can be applied to any type of data. However, since it searches element-by-element, it can be inefficient for large lists or arrays.

## Pseudocode

The pseudocode for linear search is straightforward:

```plaintext
procedure LinearSearch(A, key)
    for i from 1 to length(A)
        if A[i] equals key
            return i
    return -1
```

This pseudocode represents a function called `LinearSearch` that takes two parameters: a list (or array) `A` and a `key` to search for in `A`. The function returns the index of `key` if found, otherwise it returns `-1`.

## An Example

Let's consider the following example: We have an array `[10, 15, 20, 25, 30, 35]` and we want to find the number 20.

1. **Iteration 1**: The first element is 10. 10 is not equal to 20, so we move on to the next element.
2. **Iteration 2**: The second element is 15. 15 is not equal to 20, so we move on to the next element.
3. **Iteration 3**: The third element is 20. 20 is equal to 20, so we stop searching. The index of the number 20 is 2 (considering the first index as 0).

Therefore, the linear search algorithm would return `2` as the index of the number 20 in the given array.

## Instructions

Here are some instructions to help you start working on the assignment:

1. The template uses Java generics to create a generic class Main that can search for a key element in an array of any type that implements the Comparable interface. Generics are a way of implementing generic programming in Java, which allows you to write code that can work with different types of objects without casting or risking ClassCastException.
2. The constructor of the Main class takes an array of type T as a parameter and assigns it to the array field. The array field is also of type T, which means it can store any type of object that implements Comparable.
3. The `LinearSearch` method returns an int that is the index of the key element in the array, or -1 if the key element is not found. The method uses a for loop to iterate over the array and compare each element with the key using the `compareTo` method of the Comparable interface. The `compareTo` method returns a negative integer, zero, or a positive integer if the current object is less than, equal to, or greater than the specified object.
    For example, if you want to compare the element at index i with the key, you can write:

    ```java
    if (array[i].compareTo(key) == 0) {
        // return the index
    }
    ```

    The `LinearSearch` method has a time complexity of O(n), where

 n is the size of the array, because it may have to scan the entire array to find the key element.
4. To test your code, you can create an object of the Main class with different types of arrays, such as Integer, String, or Double, and call the `LinearSearch` method on them. You can print the key element and the index returned by the methods to check the output. For example, you can write:

    ```java
    Integer[] intArray = {1, 2, 4, 5, 8};
    Main<Integer> intMain = new Main<>(intArray);
    Integer key = 4;
    int linearIndex = intMain.LinearSearch(key);
    System.out.println("Key element: " + key);
    System.out.println("Linear search index: " + linearIndex);
    ```

    The output of the above code should be:

    ```
    Key element: 4
    Linear search index: 2
    ```
