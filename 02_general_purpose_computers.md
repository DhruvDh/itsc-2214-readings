---
title: "Modern General-Purpose, Programmable Computers"
---

In this chapter, we will explore the functioning of modern, general-purpose computers. We will approach this topic by drawing parallels with a relatable example from an alternate universe, where two boys, Cory and Jamal, develop a unique system of communication.

---

In this parallel universe, Cory and Jamal are two teenage neighbors that enjoy playing Scrabble, but there's a hitch. Cory's parents are quite religious and in this universe, there exists a prophecy from their scriptures that a game played by youngsters will one day end the world; and so they disapprove of Cory playing Scrabble.

To get around this, Cory and Jamal come up with a clever plan. Cory happens to have two desk lamps that are visible from Jamal's window. They decide that if Cory's mother isn't home, Cory will switch on the right lamp, and if his father isn't home, he will turn on the left one. If both lamps are on, it essentially signals to Jamal that he can come over to play Scrabble.

Cory also has a sister who is usually at the University, but also at home on some weekends. When she is home, she tends to wake up for late-night snacks around 1 am. And so when Cory's sister is home, they can only play until 1 am. To work around this, they add another signal. If Cory switches on his ceiling fan, it will signal that he can come to play, but only until 1 am.

As we see, each additional piece of information that we need to share requires an additional indicator.

## The Working of a Processor

The way Cory and Jamal communicate parallels how a computer's processor operates. A processor has a set of operations it can perform - like copying, moving, adding, subtracting data, jumping to another instruction, conditional branching, and more.

To tell a computer to perform a certain operation, we need several indicators, just like Cory and Jamal's system. Computers use tiny wires that may or may not have electricity running through them. The presence or absence of electricity indicates what the processor should do.

We refer to the absence as a `0` and the presence of electricity as a `1`. Each wire conveying either a `0` or a `1` is said to convey one `bit` of information.

This is a fixed group of wires going into the processor to convey such information on what needs to be done. This grouping is known as "Instruction." The number of bits in an instruction tells us the `size`` of the instruction.

A processor usually has a fixed instruction size (64 for a 64-bit processor, 32 for a 32-bit processor, etc.).

Sometimes even more information is needed. For example, for operations like jumping to a different instruction, the processor needs to know where to jump to. For operations like addition, two numbers are needed. Sometimes, along with the operation, the processor also needs to be instructed about where to store the result. We call these pieces of data on which we perform instructions as `operands`. We often refer to instructions as operations.

We cannot have an extra set of wires for each time we need to share another operand with the processor, so we share this data in sequence.

Say `0010 1010` is the code for the `add` operation, `0000 0000`` is the number 0, and`0000 0001` is the number 1.
If we want an 8-bit processor to add these together, we might share the following data through the wires -

```
...
0000 0001 // third cycle - second operand
0000 0000 // second cycle - first operand
0010 1010 // first cycle - add operation
```

There is a "clock" mechanism within the processor to signal the start and end of "cycles". Generally the processor "pipelines" its operation such that it can complete one instruction in each cycle. However, many complex instructions like division or square roots take >20 cycles to complete.

A computer processor can be compared to a complex Rube Goldberg machine, with wires that take in the presence or absence of electricity similar to how many Rube Goldberg machines' mechanism is kicked off by a rolling ball or marbles. The "marbles" of electricity roll through the processor, along each wire, triggering complex chain reactions or side effects that are designed to elicit the intended operation. Consider that a processor, as small as it is, frequently contains billions of transistors - use this information to imagine how complex these "Rube Goldberg machines" are.

## Memory

Let's compare the computer's memory to a vast grid filled with tiny cells. These cells can each store some electricity - and again the presence or absence of electricity conveys a `bit` of information. If we continue the previous analogy, it can be compared to a large grid storing balls (data).

The processor has instructions that allow it to select which cells to "read" and transfer those bits to the processor - to be interpreted either as data or instructions. The processor also has instructions that allow it to write to memory.

It is this interaction of a processor being able to "write" instructions and data to memory, and then conditionally "read" and execute them, and then write new instructions or data that makes a processor "programmable".

What we describe in this section is Active memory or RAM. It is the data in RAM that is readily available for the processor to read and write.

## Programs

Programs are essentially detailed sets of instructions that command a computer to execute specific operations. They can be likened to a recipe that a computer follows to achieve a particular task. Programs dictate what steps the computer must take and in what sequence to reach the desired outcome.

The program is stored on disk in a format that is standard for that operating system, and where the first instruction is stored in this format is always known - say, the first instruction in a "main" section. When a program is executed, it is loaded from the computer's storage into RAM, and then the processor reads and executes the first instruction; and so the execution begins.

The complexity of programs can vary greatly, from a simple one that performs basic arithmetic to an intricate operating system like Windows or Linux that manages every aspect of a computer. However, the core characteristic of all programs is the same: they are sequences of instructions that the computer follows.

## The Java Compiler

As instructions are hard to write directly, we make use of programs called compilers that take in "code" in human-readable text format and output a list of instructions. The program is designed in such a way that the produced list of valid instructions always carries out the task described in "code" faithfully.

The Java compiler is such a program for Java code. When a Java program is compiled, the compiler reviews the code for syntax errors and then translates it into bytecode, a type of intermediate language closer to machine language. The Java Virtual Machine (JVM) then interprets this bytecode into machine code that your computer's processor can execute.

Syntax errors or other kinds of errors essentially refer to situations where the compiler doesn't know how to, or cannot produce a valid set of instructions that can carry out what the code is describing.

Compilers like the Java compiler don't just translate code. They also optimize it, making it more efficient so that the resulting program runs faster and consumes less memory. For example, they may look at your `for` loop that is adding up the first `N` natural numbers and decide to replace the loop with the formula for this computation instead.

## Operating Systems

With a sound understanding of the fundamental components of modern computing, it's important to highlight the role of the operating system.

An operating system (OS) is a type of system software that manages computer hardware and software resources and provides various services for computer programs. It acts as a mediator between users and the computer hardware. Users interact with the operating system through user interfaces such as a command-line interface (CLI) or a graphical user interface (GUI).

Operating systems bear the responsibility of managing the computer's resources, including the processor, memory, disk space, and input/output devices. They coordinate tasks, ensuring that the processor's time is used judiciously, and manage the memory, keeping track of which parts are in use and which are available.

In essence, the operating system provides the platform on which all other software runs. It is the environment in which programs, written in languages like Java and then compiled, operate.

This fundamental understanding of modern computing components helps elucidate the intricate operations that are continuously happening within our laptops, desktops, and even our smartphones. These fundamental aspects form the backbone of the digital age we live in.
