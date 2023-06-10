---
title: "Bubble, Selection, and Insertion Sort"
---

## Bubble Sort

Bubble sort is a simple sorting algorithm that works by repeatedly comparing and swapping adjacent elements in an array until the array is sorted. Bubble sort is easy to implement and understand, but it is not very efficient for large arrays. The name bubble sort comes from the idea that the larger elements "bubble up" to the end of the array after each iteration.

### Pseudocode

The pseudocode for bubble sort is as follows:

```
procedure bubbleSort(A : list of sortable items)
    n = length(A)
    repeat
        swapped = false
        for i = 1 to n-1 inclusive do
            if A[i-1] > A[i] then
                swap(A[i-1], A[i])
                swapped = true
            end if
        end for
        n = n - 1
    until not swapped
end procedure
```

The procedure takes an array `A` of sortable items and sorts it in ascending order. The procedure uses a variable `n` to keep track of the unsorted part of the array, and a variable swapped to indicate whether any swaps occurred in the current iteration. The procedure repeats until no swaps are made, which means the array is sorted.

### An Example

1. Let us see an example of bubble sort on the following array:

    ```plaintext
    [5, 1, 4, 2, 8]
    ```

2. We start with `n = 5` and `swapped = false`. We compare the first and second elements, 5 and 1, and swap them since 5 > 1. We set swapped to true to indicate that a swap occurred. We compare the second and third elements, 5 and 4, and swap them as well. We continue to compare and swap the adjacent elements until we reach the end of the array. The array after the first iteration is:

    ```plaintext
    [1, 4, 2, 5, 8]
    ```

3. We decrement `n` by 1, since the last element 8 is now in its correct position. We repeat the process with `n = 4` and `swapped = false`. We compare and swap the first and second elements, 1 and 4, since 1 < 4. We compare and swap the second and third elements, 4 and 2, since 4 > 2. We compare the third and fourth elements, 5 and 8, but do not swap them since 5 < 8. The array after the second iteration is:

    ```plaintext
    [1, 2, 4, 5, 8]
    ```

4. We decrement `n` by 1, since the last element 5 is now in its correct position. We repeat the process with `n = 3` and `swapped = false`. We compare and swap the first and second elements, 1 and 2, since 1 < 2. We compare and swap the second and third elements, 2 and 4, since 2 < 4. The array after the third iteration is:

    ```plaintext
    [1, 2, 4, 5, 8]
    ```

5. We decrement `n` by 1, since the last element 4 is now in its correct position. We repeat the process with `n = 2` and `swapped = false`. We compare and swap the first and second elements, 1 and 2, since 1 < 2. The array after the fourth iteration is:

    ```plaintext
    [1, 2, 4, 5, 8]
    ```

6. We decrement `n` by 1, since the last element 2 is now in its correct position. We repeat the process with `n = 1` and `swapped = false`. We do not compare any elements, since there is only one element left. The array after the fifth iteration is:

    ```plaintext
    [1, 2, 4, 5, 8]
    ```

7. We exit the loop, since `swapped` is false, which means the array is sorted.

### Lab Instructions

1. The template uses Java generics to create a generic class `Main` that can sort arrays of any type that implements the `Comparable` interface. Generics are a way of implementing generic programming in Java, which allows you to write code that can work with different types of objects without casting or risking `ClassCastException`.

2. The constructor of the `Main` class takes an array of type `T` as a parameter and assigns it to the data field. The data field is also of type `T`, which means it can store any type of object that implements `Comparable`.

3. The `BubbleSort` method returns an array of type `T` that is sorted in ascending order using the bubble sort algorithm. The method uses a local variable `sorted` to store a copy of the data array and then modifies it using the pseudocode provided in the assignment instructions.

4. To compare and swap the elements of the `sorted` array, you need to use the `compareTo` method of the `Comparable` interface. The `compareTo` method returns a negative integer, zero, or a positive integer if the current object is less than, equal to, or greater than the specified object. For example, if you want to compare the elements at index `i-1` and `i`, you can write:

    ```java
    if (sorted[i-1].compareTo(sorted[i]) > 0) {
        // swap the elements
    }
    ```

5. To swap the elements of the `sorted` array, you can use a temporary variable of type `T` to store one of the elements, and then assign the other element to its place. For example, if you want to swap the elements at index `i-1` and `i`, you can write:

    ```java
    T temp = sorted[i-1];
    sorted[i-1] = sorted[i];
    sorted[i] = temp;
    ```

6. After performing the bubble sort algorithm, the method returns the sorted array.

7. To test your code, you can create an object of the `Main` class with different types of arrays, such as `Integer`, `String`, or `Double`, and call the `BubbleSort` method on them. You can print the original and sorted arrays to check the output. For example, you can write:

    ```java
    Integer[] intArray = {5, 1, 4, 2, 8};
    Main<Integer> intMain = new Main<>(intArray);
    Integer[] intSorted = intMain.BubbleSort();
    System.out.println("Original array: " + Arrays.toString(intArray));
    System.out.println("Sorted array: " + Arrays.toString(intSorted));
    ```

    The output should be:

    ```plaintext
    Original array: [5, 1, 4, 2, 8]
    Sorted array: [1, 2, 4, 5, 8]
    ```

## Selection Sort

### Introduction

Selection sort is a sorting algorithm that repeatedly finds the smallest element in the unsorted part of the array and swaps it with the first element of the unsorted part. This way, the array is divided into two subarrays: one that contains the sorted elements and one that contains the unsorted elements. The process is repeated until the entire array is sorted. Selection sort is a simple and efficient algorithm that works well for small arrays, but it has a high time complexity of O(n^2) for large arrays.

### Pseudocode

The pseudocode for selection sort is as follows:

```plaintext
Procedure selection_sort(array, N)
  array - array of items to be sorted
  N - size of array
Begin
  For i = 1 to N-1
    Begin
      Set min = i
      For j = i+1 to N
        Begin
          If array[j] < array[min] Then
            min = j
          End If
        End For
      // Swap the minimum element with the current element
      If min != i Then
        Swap array[min] and array[i]
      End If
    End For
End Procedure
```

### An Example

1. Let us see an example of how selection sort works on the following array:

    ```plaintext
    [64, 25, 12, 22, 11]
    ```

2. In the first iteration, the algorithm finds the smallest element (11) in the unsorted part of the array and swaps it with the first element of the unsorted part (64). The array becomes:

    ```plaintext
    [11, 25, 12, 22, 64]
    ```

3. In the second iteration, the algorithm finds the smallest element (12) in the remaining unsorted part of the array and swaps it with the second element of the unsorted part (25). The array becomes:

    ```plaintext
    [11, 12, 25, 22, 64]
    ```

4. In the third iteration, the algorithm finds the smallest element (22) in the remaining unsorted part of the array and swaps it with the third element of the unsorted part (25). The array becomes:

    ```plaintext
    [11, 12, 22, 25, 64]
    ```

5. In the fourth iteration, the algorithm finds the smallest element (25) in the remaining unsorted part of the array and swaps it with the fourth element of the unsorted part (25). The array becomes:

    ```plaintext
    [11, 12, 22, 25, 64]
    ```

6. In the fifth iteration, the algorithm finds the smallest element (64) in the remaining unsorted part of the array and swaps it with the fifth element of the unsorted part (64). The array becomes:

    ```plaintext
    [11, 12, 22, 25, 64]
    ```

7. The array is now sorted and the algorithm terminates.

### Instructions

1. The template is a generic class that can sort any type of data that implements the `Comparable` interface. This means that the data type `T` must have a method `compareTo(T other)` that returns a negative, zero, or positive integer depending on whether the current object is less than, equal to, or greater than the other object.

2. The constructor of the class takes an array of type `T` as a parameter and assigns it to the data field. The data field is the array that needs to be sorted.

3. The `SelectionSort()` method is where the students need

 to write the code for the selection sort algorithm. The method should return a sorted array of type `T`.

4. The students can use the pseudocode provided in the previous section as a guide for writing the code. They need to use a for loop to iterate over the unsorted part of the array, find the minimum element, and swap it with the first element of the unsorted part. They can use the `compareTo()` method to compare the elements of the array. They can use a temporary variable to store the value of the element to be swapped.

5. The students can test their code by creating an object of the `Main` class with different types of data, such as integers, strings, or custom objects, and calling the `SelectionSort()` method on it. They can print the original and sorted arrays to check the output. They can also use different sizes of arrays to see how the algorithm performs.

## Insertion Sort

### Introduction

Insertion sort is a simple and adaptive sorting technique that works by inserting each element into its correct position in a sorted subarray. The sorted subarray starts with the first element and grows by one element in each iteration. The element to be inserted is compared with the previous elements in the sorted subarray and swapped if they are larger. This process continues until the element finds its correct position or reaches the beginning of the array.

### Pseudocode

The pseudocode for insertion sort is as follows:

```plaintext
procedure insertionSort (A: list of sortable items)
    n = length (A)
    for i = 1 to n - 1 do
        j = i
        while j > 0 and A [j-1] > A [j] do
            swap (A [j], A [j-1])
            j = j - 1
        end while
    end for
end procedure
```

### An Example

Consider the array: [3, 5, 7, 11, 13, 2, 9, 6]

Below is a detailed walkthrough of each iteration:

1. **Iteration 1**: `[3, 5, 7, 11, 13, 2, 9, 6]`  
   The sorted subarray is [3] and the element to be inserted is 5. Since 5 is larger than 3, no swap is needed.

2. **Iteration 2**: `[3, 5, 7, 11, 13, 2, 9, 6]`  
   The sorted subarray is [3, 5] and the element to be inserted is 7. Since 7 is larger than 5, no swap is needed.

3. **Iteration 3**: `[3, 5, 7, 11, 13, 2, 9, 6]`  
   The sorted subarray is [3, 5, 7] and the element to be inserted is 11. Since 11 is larger than 7, no swap is needed.

4. **Iteration 4**: `[3, 5, 7, 11, 13, 2, 9, 6]`  
   The sorted subarray is [3, 5, 7, 11] and the element to be inserted is 13. Since 13 is larger than 11, no swap is needed.

5. **Iteration 5**: `[3, 5, 7, 11, 13, 2, 9, 6]`  
   The sorted subarray is [3, 5, 7, 11, 13] and the element to be inserted is 2. Since 2 is smaller than 13, 13 and 2 are swapped.

   *After swapping*: `[3, 5, 7, 11, 2, 13, 9, 6]`

6. **Iteration 6**: `[3, 5, 7, 11, 2, 13, 9, 6]`  
   The sorted subarray is [3, 5, 7, 11, 2, 13] and the element to be inserted is 2. Since 2 is smaller than 11, 11 and 2 are swapped.

   *After swapping*: `[3, 5, 7, 2, 11, 13, 9, 6]`

7. **Iteration 7**: `[3, 5, 7,

 2, 11, 13, 9, 6]`  
   The sorted subarray is [3, 5, 7, 2, 11, 13] and the element to be inserted is 2. Since 2 is smaller than 7, 7 and 2 are swapped.

   *After swapping*: `[3, 5, 2, 7, 11, 13, 9, 6]`

8. **Iteration 8**: `[3, 5, 2, 7, 11, 13, 9, 6]`  
   The sorted subarray is [3, 5, 2, 7, 11, 13] and the element to be inserted is 2. Since 2 is smaller than 5, 5 and 2 are swapped.

   *After swapping*: `[3, 2, 5, 7, 11, 13, 9, 6]`

9. **Iteration 9**: `[3, 2, 5, 7, 11, 13, 9, 6]`  
   The sorted subarray is [3, 2, 5, 7, 11, 13] and the element to be inserted is 2. Since 2 is smaller than 3, 3 and 2 are swapped.

   *After swapping*: `[2, 3, 5, 7, 11, 13, 9, 6]`

10. **Iteration 10**: `[2, 3, 5, 7, 11, 13, 9, 6]`  
    The sorted subarray is [2, 3, 5, 7, 11, 13] and the element to be inserted is 9. Since 9 is smaller than 13, 13 and 9 are swapped.

    *After swapping*: `[2, 3, 5, 7, 11, 9, 13, 6]`

11. **Iteration 11**: `[2, 3, 5, 7, 11, 9, 13, 6]`  
    The sorted subarray is [2, 3, 5, 7, 11, 9, 13] and the element to be inserted is 9. Since 9 is smaller than 11, 11 and 9 are swapped.

    *After swapping*: `[2, 3, 5, 7, 9, 11, 13, 6]`

12. **Iteration 12**: `[2, 3, 5, 7, 9, 11, 13, 6]`  
    The sorted subarray is [2, 3, 5, 7, 9, 11, 13] and the element to be inserted is 9. Since 9 is larger than 7, no swap is needed.

13. **Iteration 13**: `[2, 3, 5, 7, 9, 11, 13, 6]`  
    The sorted subarray is [2, 3, 5, 7, 9, 11, 13] and the element to be inserted is 6. Since 6 is smaller than 13, 13 and 6 are swapped.

    *After swapping*: `[2, 3, 5, 7, 9, 11, 6, 13]`

14. **Iteration

 14**: `[2, 3, 5, 7, 9, 11, 6, 13]`  
    The sorted subarray is [2, 3, 5, 7, 9, 11, 6, 13] and the element to be inserted is 6. Since 6 is smaller than 11, 11 and 6 are swapped.

    *After swapping*: `[2, 3, 5, 7, 9, 6, 11, 13]` 

15. **Iteration 15**: `[2, 3, 5, 7, 9, 6, 11, 13]`  
    The sorted subarray is [2, 3, 5, 7, 9, 6, 11, 13] and the element to be inserted is 6. Since 6 is smaller than 9, 9 and 6 are swapped.

    *After swapping*: `[2, 3, 5, 7, 6, 9, 11, 13]`

16. **Iteration 16**: `[2, 3, 5, 7, 6, 9, 11, 13]`  
    The sorted subarray is [2, 3, 5, 7, 6, 9, 11, 13] and the element to be inserted is 6. Since 6 is smaller than 7, 7 and 6 are swapped.

    *After swapping*: `[2, 3, 5, 6, 7, 9, 11, 13]`

17. **Iteration 17**: `[2, 3, 5, 6, 7, 9, 11, 13]`  
    The sorted subarray is [2, 3, 5, 6, 7, 9, 11, 13] and the element to be inserted is 6. Since 6 is larger than 5, no swap is needed.

**Final array**: `[2, 3, 5, 6, 7, 9, 11, 13]`  
The sorted subarray is [2, 3, 5, 6, 7, 9, 11, 13] and the array is fully sorted.

### Instructions

1. Start by understanding how insertion sort works and what it does to sort an array.
2. Study the given template for the Main class and understand how it uses Java generics to sort an array of any type that implements the Comparable interface.
3. Implement the `InsertionSort` method by following the pseudocode provided above. Students should create a copy of the input array and modify the copy in-place to produce the sorted array.
4. Test their implementation using a variety of input arrays and verify that the output is correct.
5. Encourage students to optimize their implementation by considering edge cases and identifying areas for improvement.
6. Remind students to comment their code and explain their thought process as they work through the assignment. This will help them develop their coding skills and become better problem solvers.
