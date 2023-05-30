# Hashing, Hash Tables, and Hash Maps

## Background and Motivation

### Indexing

**Indexing** refers to the idea of accessing a certain element of an array by referring to it using a specific number, called the index. Using the same index always returns the same element, as long as the array remains unchanged. For example, to access the 12th element of an array `arr`, we use `arr[11]`.

The math for finding the address of an element in the array works out to be:

```
baseAddress + (index * sizeOfElement)
```

Now, keeping that in mind, let's explore the limitations of indexing.

### Limitations of Indexing

Suppose we want to access an element in the array using a string as an index, such as `arr["dhruv"]`. What is stopping us?

The problem is that we cannot calculate `baseAddress + ("dhruv" * sizeOfElement)` because the index, in this case, is a string, not a number. The operation is not defined, and therefore, we can't directly use strings as indices in an array.

### Mapping Strings to Numbers

Let's consider an array of strings. We can use it to map a number to a string:

```
0 -> "Alice"
1 -> "Bob"
2 -> "Charlie"
```

If we can use an array to map a number to a string, can we also use it to map strings to numbers? Yes, we can!

One way to do this is by searching linearly for a string in the array to find its index. For example, we can find the string "Dhruv" at index 5:

```
0 -> "Alice"
1 -> "Bob"
2 -> "Charlie"
...
5 -> "Dhruv"
```

The index at which we found the string "Dhruv" (in this case, 5) can be used as a key in a different array to find the data related to "Dhruv". However, this method of linear searching can be quite slow for large datasets.

### Hashing: A Better Solution

This is where **hashing** comes into play. Hashing allows us to efficiently map strings (or any other non-numeric keys) to numbers. By using a hash function, we can convert a string into a number that represents the index in the array.

A **hash function** takes a key as input and outputs an index in the hash table's array. A good hash function has the following criteria:

- **Uniform distribution**: The hash function should distribute keys evenly across the array to minimize collisions (when multiple keys map to the same index).
- **Minimal collisions**: A good hash function should minimize the chance of collisions.
- **Fast computation**: The hash function should be fast to compute, allowing for quick insertion, deletion, and retrieval of data.
- **Deterministic output**: The hash function should produce the same output for the same input every time it is called.

For example, let's consider a simple hash function that converts the first character of a string into its ASCII code:

```plaintext
hash("dhruv") = ASCII('d') = 100
```

The output of the hash function is 100, which we can use as an index in an array to store or retrieve data related to "dhruv". This allows us to use strings (and other non-numeric keys) as indices, achieving our goal of efficient mapping.

## Hash Functions

### Introduction

Previously, we managed to map a string "D" to some data, just like an index maps to some data in an array. The resulting data structure that can map any string to any data is called a **hash table**. The function used to map strings to data is called a **hash function**. The concept of mapping "D" to some data can be referred to as **hashing** "D" to an index 3, which is where we found the value corresponding to "D".

Now, we'll learn about a way of mapping any object (called a key) to any other object (called the record, or the value). For instance, your student ID can be a key, and all the data about you on your ID can be stored in a record object.

### Hashing

Hashing can be thought of as a method for storing and retrieving records from a database. It lets you insert, delete, and search for records based on a search key value. When properly implemented, these operations can be performed in constant time. In fact, a properly tuned hash system typically looks at only one or two records for each search, insert, or delete operation. This is far better than the $O(log n)$ average cost required to do a binary search on a sorted array of n records, or the $O(log n)$ average cost required to do an operation on a binary search tree. However, even though hashing is based on a very simple idea, it is surprisingly difficult to implement properly. Designers need to pay careful attention to all of the details involved with implementing a hash system.

A hash system stores records in an array called a **hash table**, which we will call `HT`. Hashing works by performing a computation on a search key `K` in a way that is intended to identify the position in `HT` that contains the record with key `K`. The function that does this calculation is called the **hash function**, and will be denoted by the letter `h`. Since hashing schemes place records in the table in whatever order satisfies the needs of the address calculation, records are not ordered by value. A position in the hash table is also known as a **slot**. The number of slots in hash table `HT` will be denoted by the variable `M` with slots numbered from 0 to M−1. The goal for a hashing system is to arrange things such that, for any key value `K` and some hash function `h`, $i=h(K)$ is a slot in the table such that $0 \leq i < M$, and we have the key of the record stored at `HT[i]` equal to `K`.

Hashing is not good for applications where multiple records with the same key value are permitted. Hashing is not a good method for answering range searches. In other words, we cannot easily find all records (if any) whose key values fall within a certain range. Nor can we easily find the record with the minimum or maximum key value or visit the records in key order. Hashing is most appropriate for answering the question, 'What record, if any, has key value K?' For applications where all search is done by exact-match queries, hashing is the search method of choice because it is extremely efficient when implemented correctly.

Hashing generally takes records whose key values come from a large range and stores those records in a table with a relatively small number of slots. Since keys have a large range and values have smaller, limited slots for storage – A hash function might sometimes end up hashing two keys to the same slot. We refer to such an event as a **collision**.

To illustrate, consider a classroom full of students. What is the probability that some pair of students shares the same birthday (i.e., the same day of the year, not necessarily the same year)? If there are 23 students, then it is unlikely that more than one student will share the same birthday. There are 365 "slots" or possible days a student can have a birthday on; but only 23 "keys". As the number of students increases, the probability of a "collision" or two students sharing a birthday increases. To be practical, a database organized by hashing must store records in a hash table that is not so large that it wastes space.

We would like to pick a hash function that maps keys to slots in a way that makes each slot in the hash table have equal probability of being filled for the actual set keys being used. Unfortunately, we normally have no control over the distribution of key values for the actual records in a given database or collection. So how well any particular hash function does depends on the actual distribution of the keys used within the allowable key range. In some cases, incoming data are well distributed across their key range. For example, if the input is a set of random numbers selected uniformly from the key range, any hash function that assigns the key range so that each slot in the hash table receives an equal share of the range will likely also distribute the input records uniformly within the table.

However, in many applications the incoming records are highly clustered or otherwise poorly distributed. When input records are not well distributed throughout the key range it can be difficult to devise a hash function that does a good job of distributing the records throughout the table, especially if the input distribution is not known in advance. For example, If the input is a collection of English words, the beginning letter will be poorly distributed. A dictionary of words mapped to their frequency is often used in rudimentary natural language processing algorithms.

In conclusion, anything can be a hash function (i.e., map a value to an index), but not everything can be a good hash function. A function that always returns the index 0 is a hash function that maps everything to 0. It’s no good but it’s still a hash function. An example of a commonly used hash function is the modulus operator! It is common for `N`-sized hash tables to use the modulus of `N` as a hash function. If `N` is $20$, data for 113 will be hashed to index $113 \% 20 = 13$.

But if we use the modulo operator as a hash function, what do we do when multiple pieces of data map to the same index? $53 \% 20 = 13$, $73 \% 20 = 13$, etc. But if you think about it, we can store everything at $13$! By using nested data structures… More on this later.

### Simple Hash Functions

Let's apply a simple hash function to a set of keys and compute their indices. In this example, we'll use the modulo operation as the hash function. Given a hash table with a size of 5, we can compute the indices for the keys as follows:

```
HashTable size: 5
HashFunction: key % size

Keys: 15, 28, 47, 10, 33

Indices:
15 % 5 = 0
28 % 5 = 3
47 % 5 = 2
10 % 5 = 0
33 % 5 = 3
```

### Other Types of Hash Functions

#### Direct Hashing

A direct hash function uses the item's key as the bucket index. For example, if the key is 937, the index is 937. A hash table with a direct hash function is called a direct access table. Given a key, a direct access table search algorithm returns the item at index key if the bucket is not empty, and returns null (indicating item not found) if empty.

**Limitations**:

A direct access table has the advantage of no collisions: Each key is unique (by definition of a key), and each gets a unique bucket, so no collisions can occur. However, a direct access table has two main limitations:

1. All keys must be non-negative integers, but for some applications, keys may be negative.
2. The hash table's size equals the largest key value plus 1, which may be very large.

Similarly, there are other hash functions each with their own characteristics.

#### Modulo Hash

A modulo hash function computes the index by taking the remainder of the key divided by the table size `M`. This is a simple and effective way to convert a large key range into a smaller index range. The hash function can be defined as:

```
h(K) = K % M
```

#### Mid-Square Hash

A mid-square hash function computes the index by first squaring the key, and then extracting a portion of the squared value as the index. This approach is especially useful when the keys are not uniformly distributed. The hash function can be defined as:

```
h(K) = middle_digits(K^2)
```

#### Mid-Square Hash with Base 2

A mid-square hash function with base 2 is a variation of the mid-square hash function, where the key is first squared, and then the middle bits of the binary representation of the squared value are extracted as the index. This approach is especially useful for binary keys. The hash function can be defined as:

```
h(K) = middle_bits(K^2)
```

#### Multiplicative String Hashing

A multiplicative string hashing function computes the index by treating the characters in the string as numbers and combining them using a multiplication and a constant. This approach can help achieve a good distribution of string keys in the hash table. The hash function can be defined as:

```
h(K) = (c1 * a^(n-1) + c2 * a^(n-2) + ... + cn) % M
```

where `c1, c2, ..., cn` are the character codes of the string, `a` is a constant, `n` is the length of the string, and `M` is the size of the hash table.

Here's the ASCII representation of the resulting hash table:

```
Index | Key
-------------
  0   | 15
  1   | -
  2   | 47
  3   | 28
  4   | -
```

In this example, we can see that the keys 15 and 10, as well as 28 and 33, have collided, as they both map to the same indices (0 and 3, respectively).

### Trade-offs Between Different Hash Functions

There are trade-offs between different hash functions in terms of performance and complexity:

- A simple hash function, like the modulo operation, is fast to compute but may not distribute keys uniformly, leading to more collisions and reduced performance.
- More complex hash functions, such as cryptographic hash functions, can provide a better distribution of keys but may be slower to compute.

In practice, the choice of a hash function depends on the specific requirements of the application and the data being stored. The goal is to find a balance between uniform distribution, minimal collisions, fast computation, and deterministic output.

## Hash Collisions

**Hash collisions** occur when two or more keys map to the same index in the hash table. Due to the pigeonhole principle, hash collisions are inevitable, as there are typically more possible keys than available indices in the array. Collisions negatively impact the efficiency of hashing, as they can lead to longer access times for insertion, deletion, and retrieval of key-value pairs.

There are two primary methods to resolve hash collisions: **chaining** and **open addressing**.

## Chaining

**Chaining** is a collision resolution technique that uses a linked list or another data structure to store multiple key-value pairs at the same index. When a collision occurs, the new key-value pair is simply added to the data structure at the index.

### Insertion, Search, and Deletion

Here's how to perform insertion, search, and deletion operations using chaining:

1. **Insertion**: Calculate the index using the hash function. If the index is empty, create a new data structure (e.g., linked list) and insert the key-value pair. If the index is not empty, add the key-value pair to the existing data structure.

2. **Search**: Calculate the index using the hash function. If the index is empty, the key is not in the hash table. If the index is not empty, search the data structure at the index for the key.

3. **Deletion**: Calculate the index using the hash function. If the index is empty, the key is not in the hash table. If the index is not empty, search the data structure at the index for the key and remove it if found.

### Advantages and Disadvantages of Chaining

Chaining has several advantages and disadvantages:

- **Advantages**:
  - Easy implementation: Chaining can be easily implemented using existing data structures like linked lists.
  - Dynamic size: The data structure at each index can grow or shrink as needed, allowing for efficient use of space.
- **Disadvantages**:
  - Extra space: Chaining requires additional space for the data structure at each index, which can increase memory overhead.
  - Variable access time: The access time for key-value pairs depends on the length of the data structure at the index, which can vary.

Chaining is a popular method for resolving hash collisions due to its simplicity and dynamic size. However, it may not be the most efficient option for all use cases, especially when memory overhead and variable access times are critical factors.

## Open Addressing

**Open addressing** is a collision resolution technique that finds an alternative index for a key-value pair if the original index is occupied. When a collision occurs, the algorithm searches for the next available index using a probing technique. There are three common types of probing techniques: linear probing, quadratic probing, and double hashing.

### Probing Techniques

1. **Linear probing**: When a collision occurs, search the hash table linearly (one index at a time) until an empty slot is found.
2. **Quadratic probing**: When a collision occurs, search the hash table quadratically (by increasing the index by the square of the probe number) until an empty slot is found.
3. **Double hashing**: When a collision occurs, use a secondary hash function to compute a new index for the key-value pair, and repeat this process until an empty slot is found.

### Insertion, Search, and Deletion

Here's how to perform insertion, search, and deletion operations using open addressing:

1. **Insertion**: Calculate the index using the hash function. If the index is empty, insert the key-value pair. If the index is occupied, use the chosen probing technique to find the next available index and insert the key-value pair there.

2. **Search**: Calculate the index using the hash function. If the index is empty, the key is not in the hash table. If the index is occupied, check if the key matches the stored key. If not, use the chosen probing technique to search for the next index until the key is found or an empty index is encountered.

3. **Deletion**: Calculate the index using the hash function. If the index is empty, the key is not in the hash table. If the index is occupied and the key matches the stored key, remove the key-value pair and mark the index as deleted. Continue searching using the chosen probing technique to handle cases where the removed key-value pair was part of a cluster.

### Advantages and Disadvantages of Open Addressing

Open addressing has several advantages and disadvantages:

- **Advantages**:
  - No extra space: Open addressing does not require additional space for data structures at each index, making it more memory-efficient.
  - Fixed size: The hash table has a fixed size, which can be useful when memory is limited.
- **Disadvantages**:
  - Clustering: Probing techniques can cause clusters of key-value pairs to form, leading to increased access times.
  - Deletion issues: Deleting key-value pairs can create complications, as it may leave "holes" in clusters that need to be addressed.

Open addressing is an alternative method for resolving hash collisions that can be more memory-efficient than chaining. However, it may not be the best option for all use cases, especially when clustering and deletion issues are critical factors.

## Complexity and Load Factor

When analyzing the complexity of hash functions and hash tables, we need to consider the time taken for searching, inserting, or deleting an element. There are two main steps involved in these operations:

1. Computing the hash function for the given key.
2. Traversing the list of key-value pairs present at the computed index.

### Time Complexity of Hash Computation

For the first step, the time taken depends on the key and the hash function. For example, if the key is a string "abcd", then its hash function may depend on the length of the string. But for very large values of `n`, the number of entries into the map, the length of the keys is almost negligible in comparison to `n`, so hash computation can be considered to take place in constant time, i.e., O(1).

### Time Complexity of List Traversal

For the second step, traversal of the list of key-value pairs present at that index needs to be done. In the worst case, all the `n` entries are at the same index, resulting in a time complexity of O(n). However, enough research has been done to make hash functions uniformly distribute the keys in the array, so this almost never happens.

### Load Factor

On average, if there are `n` entries and `b` is the size of the array, there would be `n/b` entries at each index. This value `n/b` is called the load factor, which represents the load on our map. The load factor is denoted by the symbol λ:

```
λ = n/b
```

This load factor needs to be kept low so that the number of entries at one index is less, and the complexity remains almost constant, i.e., O(1).

### Balancing Load Factor and Complexity

To maintain the load factor at an acceptable level, the hash table can be resized when the load factor exceeds a certain threshold. This helps to keep the complexity of hash table operations near O(1) by redistributing the keys uniformly across a larger array.

In conclusion, understanding the complexity and load factor of hash functions is crucial for designing efficient hash tables. By carefully choosing a suitable hash function and managing the load factor, it's possible to achieve near-constant time complexity for various hash table operations.

## Rehashing

Rehashing, as the name suggests, means hashing again. When the load factor increases to more than its pre-defined value (the default value of the load factor is 0.75), the complexity increases. To overcome this issue, the size of the array is increased (typically doubled) and all the values are hashed again and stored in the new, larger array. This helps maintain a low load factor and low complexity.

### Why?

Rehashing is done because whenever key-value pairs are inserted into the map, the load factor increases, which implies that the time complexity also increases, as explained earlier. This might not provide the desired time complexity of O(1). Hence, rehashing must be performed, increasing the size of the `bucketArray` to reduce the load factor and the time complexity.

### How?

Rehashing can be done as follows:

1. For each addition of a new entry to the map, check the load factor.
2. If the load factor is greater than its pre-defined value (or the default value of 0.75 if not given), then perform rehashing.
3. To rehash, create a new array of double the previous size and make it the new `bucketArray`.
4. Traverse each element in the old `bucketArray` and call the `insert()` method for each, to insert it into the new larger `bucketArray`.

The following diagram illustrates the rehashing process:

```
Initial bucketArray (size = 4):
+---+---+---+---+
|   | K1|   | K2|
+---+---+---+---+

After inserting a new key K3 (load factor > 0.75):

New bucketArray (size = 8):
+---+---+---+---+---+---+---+---+
|   | K1|   | K2|   |   |   | K3|
+---+---+---+---+---+---+---+---+
```

By rehashing, the hash table maintains its desired time complexity of O(1) even as the number of elements increases. It is important to note that rehashing can be a costly operation, especially if the number of elements in the hash table is large. However, since rehashing is done infrequently and only when the load factor surpasses a certain threshold, the amortized cost of rehashing remains low, allowing the hash table operations to maintain near-constant time complexity.

## Hash Tables vs Hash Maps

**Hash tables** and **hash maps** differ in their implementation and functionality.

- **Hash tables** use direct hashing, where the key is an integer or can be directly converted to an integer (e.g., a string of digits). The integer is then used to compute the index in the hash table.
- **Hash maps** use indirect hashing, where the key can be any data type. A separate hash function is needed to convert the key into an index in the hash table.

When deciding whether to use a hash table or a hash map, consider the problem domain and the data type of the keys:

- If the keys are integers or can be directly converted to integers, a **hash table** may be a more suitable choice. For example, if you're working with student IDs as keys, a hash table would be a good fit.

- If the keys are of any other data type or cannot be directly converted to integers, a **hash map** would be more appropriate. For example, if you're working with strings, such as usernames or URLs, a hash map would be a better choice.

\newpage

## HashMaps in Java

A **HashMap** is a collection in Java that implements the Map interface and uses a hash table for storage. It stores key-value pairs, where each key is unique, and the keys are not ordered.

Here's how to use a HashMap in Java:

1. **Import the HashMap class**: To use the HashMap class in your Java code, you'll need to import it from the `java.util` package:

   ```java
   import java.util.HashMap;
   ```

2. **Create a HashMap**: To create a new HashMap, use the following syntax:

   ```java
   HashMap<String, Integer> myMap = new HashMap<String, Integer>();
   ```

3. **Add elements**: To add key-value pairs to the HashMap, use the `put()` method:

   ```java
   myMap.put("apple", 3);
   myMap.put("banana", 5);
   myMap.put("orange", 2);
   ```

4. **Access elements**: To access the value associated with a key, use the `get()` method:

   ```java
   int apples = myMap.get("apple"); // 3
   int oranges = myMap.get("orange"); // 2
   ```

5. **Remove elements**: To remove a key-value pair from the HashMap, use the `remove()` method:

   ```java
   myMap.remove("banana");
   ```

6. **Check if a key exists**: To check if a key is in the HashMap, use the `containsKey()` method:

   ```java
   boolean hasApple = myMap.containsKey("apple"); // true
   boolean hasGrape = myMap.containsKey("grape"); // false
   ```

7. **Iterate over keys**: To iterate over the keys in a HashMap, you can use a for-each loop with the `keySet()` method:

   ```java
   for (String fruit : myMap.keySet()) {
       System.out.println(fruit + ": " + myMap.get(fruit));
   }
   ```

8. **Iterate over values**: To iterate over the values in a HashMap, you can use a for-each loop with the `values()` method:

   ```java
   for (Integer count : myMap.values()) {
       System.out.println(count);
   }
   ```

9. **Iterate over key-value pairs**: To iterate over the key-value pairs in a HashMap, you can use a for-each loop with the `entrySet()` method:

   ```java
   for (HashMap.Entry<String, Integer> entry : myMap.entrySet()) {
       System.out.println(entry.getKey() + ": " + entry.getValue());
   }
   ```

A HashMap can be a useful data structure when you need to store key-value pairs efficiently. It provides constant-time performance for common operations like put, get, and remove, making it an ideal choice for various applications.

\newpage

## HashTables in Java

A **HashTable** is a collection in Java that implements the Map interface and uses a hash table for storage. It is similar to a HashMap but with some differences, such as being synchronized, which makes it thread-safe. HashTable stores key-value pairs, where each key is unique, and the keys are not ordered.

Here's how to use a HashTable in Java:

1. **Import the HashTable class**: To use the HashTable class in your Java code, you'll need to import it from the `java.util` package:

   ```java
   import java.util.Hashtable;
   ```

2. **Create a HashTable**: To create a new HashTable, use the following syntax:

   ```java
   Hashtable<String, Integer> myTable = new Hashtable<String, Integer>();
   ```

3. **Add elements**: To add key-value pairs to the HashTable, use the `put()` method:

   ```java
   myTable.put("apple", 3);
   myTable.put("banana", 5);
   myTable.put("orange", 2);
   ```

4. **Access elements**: To access the value associated with a key, use the `get()` method:

   ```java
   int apples = myTable.get("apple"); // 3
   int oranges = myTable.get("orange"); // 2
   ```

5. **Remove elements**: To remove a key-value pair from the HashTable, use the `remove()` method:

   ```java
   myTable.remove("banana");
   ```

6. **Check if a key exists**: To check if a key is in the HashTable, use the `containsKey()` method:

   ```java
   boolean hasApple = myTable.containsKey("apple"); // true
   boolean hasGrape = myTable.containsKey("grape"); // false
   ```

7. **Iterate over keys**: To iterate over the keys in a HashTable, you can use a for-each loop with the `keySet()` method:

   ```java
   for (String fruit : myTable.keySet()) {
       System.out.println(fruit + ": " + myTable.get(fruit));
   }
   ```

8. **Iterate over values**: To iterate over the values in a HashTable, you can use a for-each loop with the `values()` method:

   ```java
   for (Integer count : myTable.values()) {
       System.out.println(count);
   }
   ```

9. **Iterate over key-value pairs**: To iterate over the key-value pairs in a HashTable, you can use a for-each loop with the `entrySet()` method:

   ```java
   for (Hashtable.Entry<String, Integer> entry : myTable.entrySet()) {
       System.out.println(entry.getKey() + ": " + entry.getValue());
   }
   ```

A HashTable can be a useful data structure when you need to store key-value pairs and require thread-safe operations. However, it has some performance overhead due to synchronization, so if thread safety is not a concern, a HashMap is generally a more efficient choice.

\newpage

## HashSets in Java

A **HashSet** is a collection in Java that implements the Set interface and uses a hash table for storage. It does not store key-value pairs like hash tables or hash maps, but instead stores unique elements. The elements in a HashSet are not ordered, and duplicate values are not allowed.

Here's how to use a HashSet in Java:

1. **Import the HashSet class**: To use the HashSet class in your Java code, you'll need to import it from the `java.util` package:

   ```java
   import java.util.HashSet;
   ```

2. **Create a HashSet**: To create a new HashSet, use the following syntax:

   ```java
   HashSet<String> mySet = new HashSet<String>();
   ```

3. **Add elements**: To add elements to the HashSet, use the `add()` method:

   ```java
   mySet.add("apple");
   mySet.add("banana");
   mySet.add("orange");
   ```

4. **Remove elements**: To remove elements from the HashSet, use the `remove()` method:

   ```java
   mySet.remove("banana");
   ```

5. **Check if an element exists**: To check if an element is in the HashSet, use the `contains()` method:

   ```java
   boolean hasApple = mySet.contains("apple"); // true
   boolean hasGrape = mySet.contains("grape"); // false
   ```

6. **Iterate over elements**: To iterate over the elements in a HashSet, you can use a for-each loop:

   ```java
   for (String fruit : mySet) {
       System.out.println(fruit);
   }
   ```

A HashSet can be a useful data structure when you need to store a collection of unique elements without any specific order. It provides constant-time performance for common operations like add, remove, and contains, making it an efficient choice for many applications.

\newpage

## `hasCode` and `equals` in Java

In Java, the `hashCode` method is part of the `Object` class, which is the superclass of all Java classes. The purpose of the `hashCode` method is to provide a default implementation for generating hash codes, which are integer values that represent the memory address of an object.

### The `hashCode` Method

The `hashCode` method has the following signature:

```java
public int hashCode()
```

This method returns an integer hash code for the object on which it is called. By default, it returns a hash code that is based on the object's memory address, but this behavior can be overridden in subclasses to provide custom hash code generation.

A well-implemented `hashCode` method should follow these general rules:

1. If two objects are equal according to their `equals()` method, they must have the same hash code.
2. If two objects have the same hash code, they are not necessarily equal according to their `equals()` method.
3. The hash code of an object should not change over time unless the information used in the `equals()` method also changes.

### Overriding the `hashCode` Method

When creating custom classes, it is important to override the `hashCode` method if the `equals()` method is also overridden. This ensures that the general contract of the `hashCode` method is maintained, which is essential for the correct functioning of hash-based data structures like `HashSet` and `HashMap`.

Here's an example of a custom `Person` class that overrides both the `equals()` and `hashCode()` methods:

```java
public class Person {
    private String name;
    private int age;

    // Constructor, getters, and setters

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Person person = (Person) obj;
        return age == person.age && Objects.equals(name, person.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, age);
    }
}
```

In this example, the `equals()` method checks if two `Person` objects have the same name and age. The `hashCode()` method uses the `Objects.hash()` utility method, which generates a hash code based on the name and age fields.

### Using `hashCode` with Java Collections

The `hashCode` method plays a crucial role in the performance of Java's hash-based data structures, such as `HashSet`, `HashMap`, and `HashTable`. These data structures rely on the `hashCode` method to efficiently store and retrieve objects based on their hash codes.

When working with these collections, it is important to ensure that the `hashCode` method is correctly implemented for the objects being stored. Failing to do so can lead to poor performance or incorrect behavior.

In summary, the `hashCode` method in Java is a critical part of the `Object` class that provides a default implementation for generating hash codes. When creating custom classes, it is essential to override the `hashCode` method if the `equals()` method is also overridden, ensuring the correct functioning of hash-based data structures like `HashSet` and `HashMap`.
