---
title: "Comparable and Comparator"
---

## Sorting Complex Objects

In our previous lessons, we have primarily dealt with arrays of basic data types, such as integers, which are inherently easy to compare and sort. However, software development often involves sorting collections of complex objects, such as `Employee` or `Student` objects. These user-defined types lack a natural order for comparison, necessitating a custom solution.

## Defining a Comparison Method

A rudimentary solution could involve appending a comparison method to our `Employee` or `Student` classes, like `compareSalary` or `compareGPA`. However, this design lacks versatility - each new attribute requires a fresh comparison method.

A superior solution employs the `Comparable` interface, comprising a single method, `compareTo`. This method, accepting an object of the same type, returns an integer indicating if the current object is lesser than, equal to, or greater than the input object.

The `Comparable` interface in Java is defined as follows:

```java
public interface Comparable<T> {
    int compareTo(T o);
}
```

## Implementing Comparable

Implementing the `Comparable` interface in any class endows it with sortable attributes. For example, sorting `Student` objects by GPA could be achieved by implementing `Comparable<Student>` in the `Student` class, defining `compareTo` to compare GPAs:

```java
public class Student implements Comparable<Student> {
    private double gpa;
    // other fields and methods...

    @Override
    public int compareTo(Student other) {
        return Double.compare(this.gpa, other.gpa);
    }
}
```

The array of `Student` objects can be sorted with our new comparison logic, `arr[j].compareTo(arr[j+1]) > 0`:

```java
public static <T extends Comparable<T>> void sort(T[] arr) {
    for(int i = arr.length - 1; i > 0; i--) {
        for(int j = 0; j < i; j++) {
            if (arr[j].compareTo(arr[j+1]) > 0) {
                T temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
}
```

## `Comparable` in the Standard Library

The `Comparable` interface facilitates the creation of versatile sorting functions, capable of sorting arrays of any type implementing `Comparable`. This applies to user-defined types, as well as many built-in types in the Java standard library.

Implementing the `Comparable` interface communicates that a class is able to be compared with other instances of its type. This standard behavior empowers methods to interact with objects more abstractly and flexibly.

The Java standard library provides a `Comparable` interface similar to the one defined earlier. Many built-in classes such as `Integer`, `Double`, and `String` already implement this interface, enabling their comparison and sorting with no additional code. Our `Student` class can be modified to use `java.lang.Comparable` in place of our custom interface, maintaining the same `compareTo` method for use in our generic sort function.

## Sorting Flexibility with `Comparator`

The `Comparable` interface is limited to a single `compareTo` method per class. When multiple sorting methods are required, Java's `Comparator` interface comes into play. `Comparator` represents different orderings for a specific type, allowing multiple comparators per class.

For instance, a `Comparator` for `Student` objects that orders by GPA could look like this:

```java
import java

.util.Comparator;

public class StudentGPAComparator implements Comparator<Student> {
    @Override
    public int compare(Student s1, Student s2) {
        return Double.compare(s1.getGPA(), s2.getGPA());
    }
}
```

A modified version of our generic sort function, now accepting a `Comparator`, can compare elements of the array:

```java
public static <T> void sort(T[] arr, Comparator<? super T> comparator) {
    for(int i = arr.length - 1; i > 0; i--) {
        for(int j = 0; j < i; j++) {
            if (comparator.compare(arr[j], arr[j+1]) > 0) {
                T temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
}
```

## Understanding Natural and Total Orderings

Implementing `Comparable` endows a class with a _natural ordering_, a default ordering used in operations like sorting. For example, `String` objects follow lexicographic order and `Integer` objects adhere to numerical order. When `Comparable<Student>` is implemented to compare GPAs, we establish GPA as the natural ordering for `Student` objects.

Java's `Comparator` interface allows the definition of additional orderings, known as _total orderings_. While the natural ordering is default, total orderings, which also follow rules of completeness, transitivity, and antisymmetry, provide flexibility to define any suitable ordering.

The `Comparable` and `Comparator` interfaces epitomize the power of abstraction in computer science. By concentrating on the core concept of order and essential operations involving order, we can create general, flexible, and reusable code to work with a broad spectrum of data types and orderings.

In the next chapter, we will delve into how these concepts are employed in data structures like trees and heaps to manage data for efficient searching and sorting. For now, contemplate the elegance and versatility of the `Comparable` and `Comparator` interfaces, and the compelling concept of order they embody.
