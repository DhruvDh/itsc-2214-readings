---
title: "List of Mutators"
---

## Conditionals Boundary Mutator (CONDITIONALS_BOUNDARY)

The conditionals boundary mutator replaces the relational operators `<, <=, >, >=`

with their boundary counterpart as per the table below.

| Original conditional | Mutated conditional |
|----------------------|---------------------|
| <                    | <=                  |
| <=                   | <                   |
| \>                   | \>=                 |
| \>=                  | \>                  |
{:.table }

For example

```java
if (a < b) {
  // do something
}
```

will be mutated to

```java
if (a <= b) {
  // do something
}
```

<a name="INCREMENTS" id="INCREMENTS"></a>

## Increments Mutator (INCREMENTS)

The increments mutator will mutate increments, decrements and assignment
increments and decrements of local variables (stack variables). It will replace
increments with decrements and vice versa.

For example

```java
public int method(int i) {
  i++;
  return i;
}
```

will be mutated to

```java
public int method(int i) {
  i--;
  return i;
}
```

Please note that the increments mutator will be applied to increments of
**local variables only**. Increments and decrements of member variables will be
covered by the [Math Mutator](#MATH).

<a name="INVERT_NEGS" id="INVERT_NEGS"></a>

## Invert Negatives Mutator (INVERT_NEGS)

The invert negatives mutator inverts negation of integer and floating point
numbers. For example

```java
public float negate(final float i) {
  return -i;
}
```

will be mutated to

```java
public float negate(final float i) {
  return i;
}
```

<a name="MATH" id="MATH"></a>

## Math Mutator (MATH)

The math mutator replaces binary arithmetic operations for either integer or
floating-point arithmetic with another operation. The replacements will be
selected according to the table below.

| Original conditional | Mutated conditional |
|----------------------|---------------------|
| \+                   | \-                  |
| \-                   | \+                  |
| *                    | /                   |
| /                    | *                   |
| %                    | *                   |
| &                    | \|                  |
| \|                   | &                   |
| ^                    | &                   |
| \<<                  | \>>                 |
| \>>                  | \<<                 |
| \>>>                 | \<<                 |
{:.table}

For example

```java
int a = b + c;
```

will be mutated to

```java
int a = b - c;
```

Keep in mind that the `+` operator on `String`s as in

```java
String a = "foo" + "bar";
```

is **not a mathematical operator** but a string concatenation and will be
replaced by the compiler with something like

```java
String a = new StringBuilder("foo").append("bar").toString();
```

Please note that the compiler will also use binary arithmetic operations for
increments, decrements and assignment increments and decrements of non-local
variables (member variables) although a special `iinc` opcode for increments
exists. This special opcode is restricted to local variables (also called stack
variables) and cannot be used for member variables. That means the math mutator
will also mutate

```java
public class A {
  private int i;

  public void foo() {
    this.i++;
  }
}
```

to

```java
public class A {
  private int i;

  public void foo() {
    this.i = this.i - 1;
  }
}
```

See the [Increments Mutator](#INCREMENTS) for details.

<a name="NEGATE_CONDITIONALS" id="NEGATE_CONDITIONALS"></a>

## Negate Conditionals Mutator (NEGATE_CONDITIONALS)

The negate conditionals mutator will mutate all conditionals found according
to the replacement table below.

| Original conditional | Mutated conditional |
|----------------------|---------------------|
| ==                   | !=                  |
| !=                   | ==                  |
| <=                   | \>                  |
| \>=                  | <                   |
| <                    | \>=                 |
| \>                   | <=                  |
{:.table }

For example

```java
if (a == b) {
  // do something
}
```

will be mutated to

```java
if (a != b) {
  // do something
}
```

This mutator overlaps to a degree with the conditionals boundary mutator, but is less **stable** i.e these
mutations are generally easier for a test suite to detect.

<a name="RETURN_VALS" id="RETURN_VALS"></a>

## Return Values Mutator (RETURN_VALS)

This mutator has been superseded by the new returns mutator set.
See [Empty returns](#EMPTY_RETURNS), [False returns](#FALSE_RETURNS), [True returns](#TRUE_RETURNS),
[Null returns](#NULL_RETURNS) and [Primitive returns](#PRIMITIVE_RETURNS).

The return values mutator mutates the return values of method calls. Depending
on the return type of the method another mutation is used.<sup id="fnref4">[4](#fn4)</sup>

| Return Type          | Mutation
|----------------------|---
| `boolean`            | replace the unmutated return value `true` with `false` and replace the unmutated return value `false` with `true`
| `int` `byte` `short` | if the unmutated return value is `0` return `1`, otherwise mutate to return value `0`
| `long`               | replace the unmutated return value `x` with the result of `x+1`
| `float` `double`     | replace the unmutated return value `x` with the result of `-(x+1.0)` if `x` is not `NAN` and replace `NAN` with `0`
| `Object`             | replace non-`null` return values with `null` and throw a `java.lang.RuntimeException` if the unmutated method would return `null`
{:.table}

For example

```java
public Object foo() {
  return new Object();
}
```

will be mutated to

```java
public Object foo() {
  new Object();
  return null;
}
```

Please note that constructor calls are **not considered void method calls**.
See the [Constructor Call Mutator](#CONSTRUCTOR_CALL) for mutations of
constructors or the [Non Void Method Call Mutator](#NON_VOID_METHOD_CALL) for
mutations of non void methods.

<a name="VOID_METHOD_CALLS" id="VOID\_METHOD\_CALLS"></a>

## Void Method Call Mutator (VOID_METHOD_CALLS)

The void method call mutator removes method calls to void methods. For example

```java
public void someVoidMethod(int i) {
  // does something
}

public int foo() {
  int i = 5;
  someVoidMethod(i);
  return i;
}
```

will be mutated to

```java
public void someVoidMethod(int i) {
  // does something
}

public int foo() {
  int i = 5;
  return i;
}
```

<a name="EMPTY_RETURNS" id="EMPTY_RETURNS"></a>

## Empty returns Mutator (EMPTY\_RETURNS)

Replaces return values with an 'empty' value for that type as follows

* java.lang.String -> ""
* java.util.Optional -> Optional.empty()
* java.util.List -> Collections.emptyList()
* java.util.Collection -> Collections.emptyList()
* java.util.Set -> Collections.emptySet()
* java.lang.Integer -> 0
* java.lang.Short -> 0
* java.lang.Long -> 0
* java.lang.Character -> 0
* java.lang.Float -> 0
* java.lang.Double -> 0

Pitest will filter out equivalent mutations to methods that are already hard coded to return the empty value.

<a name="FALSE_RETURNS" id="FALSE_RETURNS"></a>

## False returns Mutator (FALSE\_RETURNS)

Replaces primitive and boxed boolean return values with false.

Pitest will filter out equivalent mutations to methods that are already hard coded to return false.

<a name="TRUE_RETURNS" id="TRUE_RETURNS"></a>

## True returns Mutator (TRUE\_RETURNS)

Replaces primitive and boxed boolean return values with true.

Pitest will filter out equivalent mutations to methods that are already hard coded to return true.

<a name="NULL_RETURNS" id="NULL_RETURNS"></a>

## Null returns Mutator (NULL\_RETURNS)

Replaces return values with null. Methods that can be mutated by the EMPTY_RETURNS mutator or that are directly annotated with NotNull will not be mutated.

Pitest will filter out equivalent mutations to methods that are already hard coded to return null.

<a name="PRIMITIVE_RETURNS" id="PRIMITIVE_RETURNS"></a>

## Primitive returns Mutator (PRIMITIVE\_RETURNS)

Replaces int, short, long, char, float and double return values with 0.

Pitest will filter out equivalent mutations to methods that are already hard coded to return 0.

<a name="CONSTRUCTOR_CALLS" id="CONSTRUCTOR_CALLS"></a>

## Constructor Call Mutator (CONSTRUCTOR_CALLS)

Optional mutator that replaces constructor calls with `null` values. For example

```java
public Object foo() {
  Object o = new Object();
  return o;
}
```

will be mutated to

```java
public Object foo() {
  Object o = null;
  return o;
}
```

Please note that this mutation is fairly unstable and likely to cause **`NullPointerException`s** even
with weak test suites.

This mutator does not affect non constructor method calls. See [Void Method Call Mutator](#VOID_METHOD_CALL) for
mutations of void methods and [Non Void Method Call Mutator](#NON_VOID_METHOD_CALL) for mutations of non void
methods.
