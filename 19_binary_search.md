---
title: "Binary Search"
---

## Recursive Linear Search

Let's imagine the following scenario: You're in a well-organized library, each shelf categorized by the author's last name in alphabetical order from A to Z. You're tasked to find a book by your favorite author, say, 'Margaret Atwood'.

So, you start at 'A' and proceed book by book, author by author, until you eventually find the book by Atwood. This, in essence, is a prime example of the linear search algorithm. Simple, right?

Let's formalize this process with Java:

```java
public int linearSearch(int[] arr, int key){
    for(int i=0;i<arr.length;i++){
        if(arr[i] == key){
            return i; 
        }
    }
    return -1; 
}
```

This method receives an array `arr` and a key `key`. It uses a loop to traverse the array, checking if the current element is equal to the searched key. If it is, it returns the current index `i`. If it doesn't find the key in the entire array, it returns -1.

We start the search at the beginning of the array, just like we started at the 'A' section in our library, and examine each element just like we looked at each book. When we find a match, we stop searching, just like we did when we found our Atwood's book.

Despite its simplicity, the linear search algorithm isn't very efficient. For example, let's say the library decided to include all authors worldwide. With the linear search strategy, you might end up examining books by millions of authors before you reach Margaret Atwood!

This brings us to our problem – How can we make this search more efficient?

Since our last chapter was on recursion, let's try to solve this problem using recursion. We'll call our method `linearSearchRecursive`:

```java
public int linearSearchRecursive(int[] arr, int key, int index){
    if(index >= arr.length){
        return -1; 
    }
    else if(arr[index] == key){
        return index; 
    }
    else{
        return linearSearchRecursive(arr, key, index+1); 
    }
}
```

The `linearSearchRecursive` method is a recursive function that performs a linear search on an array of integers. A linear search is a simple algorithm that checks each element of the array in order until it finds the target value or reaches the end of the array. The method takes three parameters: `arr`, which is the array to be searched, `key`, which is the value to be found, and `index`, which is the current position in the array.

The method has three cases:

- The base case 1: If `index` is equal to or greater than the length of the array, it means that the end of the array has been reached and the key was not found. In this case, the method returns `-1` to indicate that the search was unsuccessful.
- The base case 2: If the element at `arr[index]` is equal to `key`, it means that the key has been found at the current position. In this case, the method returns `index` to indicate the location of the key in the array.
- The recursive case: If neither of the base cases are true, it means that the key has not been found yet and there are more elements to check. In this case, the method makes a recursive call to itself with the same array and key, but with an incremented index (`index+1`). This way, the method moves forward in the array until it either finds the key or reaches the end.

The data flows through the recursive calls via the parameters and return values. The parameters (`arr`, `key`, and `index`) help in propagating information forward through the recursive calls until reaching one of the base cases. The return values (`-1` or `index`) relay information back from the base case to the original caller.

Let's illustrate this with an example: Suppose we want to search for `5` in the array `{3, 1, 4, 2, 5}` using `linearSearchRecursive`. We start by calling `linearSearchRecursive(arr, 5, 0)`, where `arr` is `{3, 1, 4, 2, 5}`, `key` is `5`, and `index` is `0`. The recursive tree will look like this:

```
linearSearchRecursive(arr, 5, 0)
|____ linearSearchRecursive(arr, 5, 1)
      |____ linearSearchRecursive(arr, 5, 2)
            |____ linearSearchRecursive(arr, 5, 3)
                  |____ linearSearchRecursive(arr, 5, 4) => returns 4
```

At each recursive call, we check if we have reached one of the base cases. If not, we make another recursive call with an incremented index. When we reach `linearSearchRecursive(arr, 5, 4)`, we find that `arr[4]` is equal to `key`, so we return `4`. This value is then passed back up the call stack until it reaches the original caller. So, `linearSearchRecursive(arr, 5, 0)` returns `4`, indicating that `5` is found at index `4` in the array.

## Optimizing Linear Search

Our recursive linear search algorithm successfully finds a given element within an array. However, in each recursive call, we reduce our search space by just one element. It’s akin to taking one step at a time when we could be leaping. Wouldn't it be nice if we could shrink this search space by more than a single element at each step?

Let's imagine again that we're in our library from earlier, but this time, we have a partner. You start at 'A' and your partner starts at 'Z'. Now you're moving towards each other, each drawing closer to 'M', where Atwood's books are likely to reside. If either of you find the book, you signal the other, and the process hinges to a stop.

Let's translate this idea into code:

```java
public int optimizedLinearSearch(int[] arr, int left, int right, int key){
    if(left>right) {
        return -1;
    }
    if(arr[left] == key){
        return left; 
    }
    if(arr[right] == key){ 
        return right;
    }
    return optimizedLinearSearch(arr, left + 1, right - 1, key); 
}
```

The `optimizedLinearSearch` method is another recursive function that performs a linear search on an array of integers, but with some optimizations. The method takes four parameters: `arr`, which is the array to be searched, `left`, which is the leftmost index of the subarray to be searched, `right`, which is the rightmost index of the subarray to be searched, and `key`, which is the value to be found.

The method has three cases:

- The base case 1: If `left` is greater than `right`, it means that the subarray is empty and the key was not found. In this case, the method returns `-1` to indicate that the search was unsuccessful.
- The base case 2: If the element at `arr[left]` or `arr[right]` is equal to `key`, it means that the key has been found at one of the ends of the subarray. In this case, the method returns `left` or `right` to indicate the location of the key in the array.
- The recursive case: If neither of the base cases are true, it means that the key has not been found yet and there are more elements to check. In this case, the method makes a recursive call to itself with the same array and key, but with a smaller subarray (`left + 1` to `right - 1`). This way, the method eliminates two elements from the search space at each recursive call until it either finds the key or reaches an empty subarray.

The data flows through the recursive calls via the parameters and return values. The parameters (`arr`, `left`, `right`, and `key`) help in propagating information forward through the recursive calls until reaching one of the base cases. The return values (`-1`, `left`, or `right`) relay information back from the base case to the original caller.

The optimization in this method comes from checking both ends of the subarray at each recursive call, instead of just one element as in `linearSearchRecursive`. This reduces the number of recursive calls needed to find the key or reach an empty subarray. For example, if we want to search for `5` in the array `{3, 1, 4, 2, 5}` using `optimizedLinearSearch`, we start by calling `optimizedLinearSearch(arr, 0, 4, 5)`, where `arr` is `{3, 1, 4, 2, 5}`, `left` is `0`, `right` is `4`, and `key` is `5`. The recursive tree will look like this:

```
optimizedLinearSearch(arr, 0, 4, 5)
|____ optimizedLinearSearch(arr, 1, 3, 5)
      |____ optimizedLinearSearch(arr, 2, 2, 5) => returns -1
```

At each recursive call, we check if we have reached one of the base cases. If not, we make another recursive call with a smaller subarray. When we reach `optimizedLinearSearch(arr, 2, 2, 5)`, we find that neither `arr[2]` nor `arr[2]` is equal to `key`, and that `left > right`. So we return `-1`. This value is then passed back up the call stack until it reaches the original caller. So, `optimizedLinearSearch(arr, 0, 4, 5)` returns `-1`, indicating that `5` is not found in the array.

Note that this method works correctly only if there are no duplicates in the array. If there are duplicates, it may return a different index than expected or miss some occurrences of the key. For example, if we want to search for `4` in the array `{3, 4, 4, 2}`, using `optimizedLinearSearch(arr, 0, 3, 4)`, we will get `-1` as a result instead of `1` or `2`. This is because both ends of the subarray are eliminated at each recursive call until an empty subarray is reached.

The worst case complexity analysis of both snippets is as follows:

- The `linearSearchRecursive` method has a worst-case complexity of **O(n)**, where **n** is the length of the array. This is because in the worst case, the key is not present in the array or is the last element of the array, and the method has to check every element of the array until it reaches the end. The number of recursive calls is equal to **n** in this case.
- The `optimizedLinearSearch` method has a worst-case complexity of **O(n/2)** - because in the worst case, the key is not present in the array or is somewhere in the middle of the array, and the method has to check half of the elements of the array until it reaches an empty subarray - which ends up being also **O(n)** in Big-O notation.

So it looks like the worst-case scenario hasn't vastly improved. We'd still potentially have to traverse half the array size if the element resides in the middle. In the worst-case scenario, the time complexity remains O(n).

This leads us to a realization: minor tweaks to our approach may not provide the drastic improvement we hope for. Is there some drastic change we can make to eliminate substantial amounts of data from our search space, not just one or two elements, with every recursive call?

## Divide and Conquer

When faced with a complex problem, one of the most effective strategies is often to break it down into smaller, more manageable parts. This is the essence of the 'divide and conquer' strategy. We divide the problem into several sub-problems that are similar to the original but smaller in size. We conquer the sub-problems by solving them recursively. Finally, we combine the solutions of the sub-problems to solve the original problem.

The divide and conquer strategy is especially effective when the sub-problems can be solved independently and the solutions can be combined efficiently. In the context of searching, we can apply this strategy by dividing the search space into smaller parts and searching each part separately. If we can eliminate large parts of the search space at each step, we can find the target value much faster.

Let's see how we can apply this to Search, and our original problem of looking for books in a library!

The journey to our favorite author's book in the library hasn't been as fast as we initially desired. Checking every book, or even every other book, can still be cumbersome in a large library.

So, let's revisit our library metaphor and imagine a different scenario. Now, you have an idea. Instead of searching from 'A' to 'Z' linearly, you begin your search in the middle of the library, around 'M.' If Atwood falls in the latter half, ignore everything from 'A to L.' And voila! Half the library gets eliminated instantly.

But in order for this to work, we need to make an assumption – the library is sorted alphabetically. If it isn't, we'll have to sort it first, which is a whole other problem. But if it is, we can apply the divide and conquer strategy to our search.

Now let’s put it into practice by creating a new method called `drasticallyFasterSearch`:

```java
public int drasticallyFasterSearch(int[] arr, int left, int right, int key) {
    int mid = left + (right - left) / 2;
    if (arr[mid] == key)
        return mid;
    else if (arr[mid] > key)
        return optimizedLinearSearch(
          java.utils.Arrays.copyOfRange(arr, 0, mid - 1), 0, mid - 1, key
        );
    else
        return optimizedLinearSearch(
          java.utils.Arrays.copyOfRange(arr, mid + 1, right), 0, right - mid - 1, key
        );
}
```

The `drasticallyFasterSearch` method is a hybrid function that combines our earlier `optimizedLinearSearch` to our new Divide and Conquer strategy. The method takes four parameters: `arr`, which is the array to be searched, `left`, which is the leftmost index of the subarray to be searched, `right`, which is the rightmost index of the subarray to be searched, and `key`, which is the value to be found.

The method has three cases:

- The base case: If the element at the middle of the subarray (`arr[mid]`) is equal to `key`, it means that the key has been found at that position. In this case, the method returns `mid` to indicate the location of the key in the array.
- The recursive case 1: If the element at the middle of the subarray (`arr[mid]`) is greater than `key`, it means that the key must be in the left half of the subarray. In this case, the method makes a recursive call to `optimizedLinearSearch` with a smaller subarray (`arr[0]` to `arr[mid-1]`). This way, the method eliminates half of the elements from the search space and then applies optimized linear search on the remaining elements.
- The recursive case 2: If the element at the middle of the subarray (`arr[mid]`) is less than `key`, it means that the key must be in the right half of the subarray. In this case, the method makes a recursive call to `optimizedLinearSearch` with a smaller subarray (`arr[mid+1]` to `arr[right]`). This way, the method eliminates half of the elements from the search space and then applies optimized linear search on the remaining elements.

The data flows through the recursive calls via the parameters and return values. The parameters (`arr`, `left`, `right`, and `key`) help in propagating information forward through the recursive calls until reaching one of the base cases. The return values (`mid`, `-1`, `left`, or `right`) relay information back from the base case to the original caller.

Let's illustrate this with an example: Suppose we want to search for `5` in the sorted array `{1, 2, 3, 4, 5}` using `drasticallyFasterSearch`. We start by calling `drasticallyFasterSearch(arr, 0, 4, 5)`, where `arr` is `{1, 2, 3, 4, 5}`, `left` is `0`, `right` is `4`, and `key` is `5`. The recursive tree will look like this:

```
drasticallyFasterSearch(arr, 0, 4, 5)
|____ drasticallyFasterSearch(arr, 3, 4, 5)
      |____ optimizedLinearSearch(arr[3..4], 0 ,1 ,5) => returns 1
```

At each recursive call, we check if we have reached one of the base cases. If not, we make another recursive call with a smaller subarray. When we reach `optimizedLinearSearch(arr[3..4], 0 ,1 ,5)`, we find that `arr[4]` is equal to `key`, so we return `1`. This value is then added to `left` (which is `3`) and passed back up the call stack until it reaches the original caller. So, `drasticallyFasterSearch(arr, 0 ,4 ,5)` returns `(3 + 1) = 4`, indicating that `5` is found at index `4` in the array.

## Even faster `drasticallyFasterSearch`

Building on our previous exploration, we can see a pattern emerging. We are using our `drasticallyFasterSearch` to divide our problem, but when it comes to conquering, we are falling back to `optimizedLinearSearch`. This means we are not fully utilizing the strength of our divide and conquer approach. We have an opportunity for optimization here: what if, instead of resorting to linear search, we applied the same divide and conquer strategy again? This observation leads us to the Binary Search algorithm, a more efficient way to search sorted arrays, which would look like this:

```java
public int drasticallyFasterSearch(int[] arr, int left, int right, int key) {
    int mid = left + (right - left) / 2;
    if (arr[mid] == key)
        return mid;
    else if (arr[mid] > key)
        return drasticallyFasterSearch(
          java.utils.Arrays.copyOfRange(arr, 0, mid - 1), 0, mid - 1, key
        );
    else
        return drasticallyFasterSearch(
          java.utils.Arrays.copyOfRange(arr, mid + 1, right), 0, right - mid - 1, key
        );
}
```

But would this actually work? We need to use what we learnt about writing recursive functions to find out - what are the base cases? What are the recursive cases? How does the data flow through the recursive calls?

> The analysis of the `drasticallyFasterSearch` method is left as an exercise for the reader.

One fatal flaw with the `drasticallyFasterSearch` function, as it is currently written, is that there is only one base case - when we find the element and return the `mid` index. If the element we're searching for is not in the array, the function will enter into an infinite loop because it lacks a base case to handle this situation.

So, we need an additional base case to handle the scenario where the element is not in the array. This needs to be a condition that detects if we've run out of elements in the array that we haven't yet searched.

This is where the skill of tracing recursive functions comes in handy. We can trace the function to see what happens when we run out of elements to search. Let's trace the function for the example we used earlier: searching for `5` in the sorted array `{1, 2, 3, 4, 5}` results in the following recursive call sequence:

```
drasticallyFasterSearch(arr, 0, 4, 5)
|____ drasticallyFasterSearch(arr, 3, 4, 5)
      |____ drasticallyFasterSearch(arr, 4, 4, 5) 
            => returns 4
```

But what happens if the number we're searching for isn't in the array? What if we're looking for `6` in the same array?

```
drasticallyFasterSearch(arr, 0, 4, 6)
|____ drasticallyFasterSearch(arr, 3, 4, 6)
      |____ drasticallyFasterSearch(arr, 4, 4, 6)
            |____ drasticallyFasterSearch(arr, 5, 4, 6)
```

This last recursive call, `drasticallyFasterSearch(arr, 5, 4, 6)` is problematic because it makes no sense to start at an index higher than our end index. This means we've exhausted all potential elements in our search.

This suggests that we need an additional base case to handle when our `left` index exceeds our `right` index. This makes sense because there is no reason for `left` to be on the right of `right`! So, we should modify our search method to be:

```java
public int drasticallyFasterSearch(int[] arr, int left, int right, int key) {
    if (right < left)
        return -1;

    int mid = left + (right - left) / 2;

    if (arr[mid] == key)
        return mid;
    else if (arr[mid] > key)
        return drasticallyFasterSearch(
          java.utils.Arrays.copyOfRange(arr, 0, mid - 1), 0, mid - 1, key
        );
    else
        return drasticallyFasterSearch(
          java.utils.Arrays.copyOfRange(arr, mid + 1, right), 0, right - mid - 1, key
        );
}
```

Now, we can see that when `right` becomes less than `left`, the function will correctly return `-1`, signaling that our intended key isn't present. Note that in the case where `left` equals `right`, we still want to check the `arr[mid]`, so `right < left`, not `right <= left`, is our base case.

As we apply the divide and conquer methodology here, our drasticallyFasterSearch method is now a working implementation of the Binary Search algorithm. In each recursive call, we cut our search space in half, drastically reducing the number of elements searched. For a list of length n, in the worst-case, we'll make roughly log(n) recursive calls, scaling our runtime far better than a linear search would.

Indeed, this is a powerful tool for searching sorted data. By fully utilizing divide and conquer, we've been able to drastically speed up our search. This emphasizes the importance of understanding the fundamentals of recursion and problem decompositions as key building blocks in algorithm and data structure design.

As the reader (or student!) progresses, they may find more elegant ways to implement this algorithm, or variations of it, which solve complex problems in different contexts. Here is a variation of the this dearch algorithm that is more efficient and doesn't require copying the array at each recursive call:

```java
public int drasticallyFasterSearch(int[] arr, int left, int right, int key) {
    if (right >= left) {
        int mid = left + (right - left) / 2;
        if (arr[mid] == key)
            return mid;
        else if (arr[mid] > key)
            return drasticallyFasterSearch(arr, left, mid - 1, key);
        else
            return drasticallyFasterSearch(arr, mid + 1, right, key);
    } else {
        return -1;
    }
}
```

## Unveiling Binary Search

The name "Binary Search" comes from the fact that this method divides the search space into two (binary) at each step of the algorithm. It is a fundamental technique used in computer science and a cornerstone in algorithm design.

The final implementation of the Binary Search algorithm is as follows:

```java
public int binarySearch(int[] arr, int left, int right, int key) {
    if (right >= left) {
        int mid = left + (right - left) / 2;
        if (arr[mid] == key)
            return mid;
        else if (arr[mid] > key)
            return binarySearch(arr, left, mid - 1, key);
        else
            return binarySearch(arr, mid + 1, right, key);
    } else {
        return -1;
    }
}
```

By rethinking our approach and exploiting the sorted nature of our data, we devised a strategy that significantly reduces the time spent searching. This concludes the core of Binary Search, demonstrating how powerful a shift in perspective can be in problem-solving.
