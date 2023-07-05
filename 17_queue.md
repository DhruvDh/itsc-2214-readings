---
title: "Queue Data Structure"
---

## Introduction

A queue is a linear data structure that is open at both ends and follows a particular order for storing data. The order is **First In First Out** (FIFO). That means that the first element that is added to the queue is also the first one that is removed from it3. One can imagine a queue as a line of people waiting to receive something in sequential order which starts from the beginning of the line.

Some real-life examples of queues are:

- Waiting lines at a bank, a restaurant, or an airport
- Printer jobs that are processed in the order they are received
- Customer service calls that are answered based on who called first

Queues are useful for modeling situations where we need to process data elements one by one in the order they arrive.

## Operations on a Queue

The main operations that we can perform on a queue are:

- **Enqueue**: This operation adds an element to the rear end of the queue. We can only enqueue an element if the queue is not full.
- **Dequeue**: This operation removes an element from the front end of the queue. We can only dequeue an element if the queue is not empty. The dequeued element is returned as the output of this operation.
- **Peek** or **Front**: This operation returns (but does not remove) the element at the front end of the queue without modifying it. We can only peek at an element if the queue is not empty.
- **Poll**: This operation is similar to dequeue, but it returns null instead of throwing an exception if the queue is empty.

> Note that the exact operations, their names and behavior often vary depending on the programming language and the implementation of the queue. You always need to check the documentation of the programming language you are using to know the exact operations and their behavior.

## Applications of Queues

A queue data structure is generally used in scenarios where we need to follow a **First In First Out (FIFO)** approach for managing data elements. That means that we process data elements one by one in the order they arrive or are added to the queue.

Some common applications of the queue data structure are:

- **Task Scheduling**: Queues can be used to schedule tasks based on priority or the order in which they were received. For example, a printer may use a queue to store print jobs that are waiting to be executed. The printer will print the documents in the order they were added to the queue, ensuring fairness and efficiency.

- **Resource Allocation**: Queues can be used to manage and allocate resources, such as printers, CPU processing time, disk space, etc. For example, an operating system may use a queue to handle requests for CPU time from different processes. The operating system will grant CPU time to each process based on its position in the queue, ensuring that no process is starved or neglected.

- **Data Buffering**: Queues can be used to buffer data between two components that operate at different speeds or have different capacities. For example, a keyboard may use a queue to store keystrokes that are entered by the user but not yet processed by the computer. The keyboard will enqueue each keystroke as it is typed, and the computer will dequeue each keystroke as it is ready to process it.

One application of queue data structure that we will focus on is **CPU Scheduling**.

CPU scheduling is the problem of deciding which process should get access to the CPU at any given time. CPU scheduling is important for optimizing CPU utilization, throughput, response time, waiting time, etc. CPU scheduling algorithms use queues to store processes that are ready or waiting for execution.

Different types of queues can be used for CPU scheduling:

- **Single Queue**: This is a simple FIFO queue that stores all processes that are ready for execution. The CPU will execute processes in the order they arrive or are added to this queue. This type of queue ensures fairness but does not consider priority or burst time (the amount of time required by a process for execution) of processes. An example of this type of queue is FCFS (First Come First Serve) scheduling algorithm.

- **Multiple Queues**: This is a set of FIFO queues that store processes based on some criteria such as priority or burst time. The CPU will execute processes from different queues according to some rules such as round robin (each queue gets an equal share of CPU time), shortest job first (the queue with the shortest burst time gets higher preference), etc. This type of queue allows more flexibility and control over CPU scheduling but may introduce complexity and overheads. An example of this type of queue is MLFQ (Multi-Level Feedback Queue) scheduling algorithm.

- **Priority Queue**: This is a special type of queue that stores processes based on their priority values. The priority value can be static (assigned at creation) or dynamic (changed during execution). The CPU will execute processes with higher priority values before lower ones. This type of queue ensures urgency but may cause starvation (low-priority processes never get executed) or inversion (high-priority process waits for the low-priority process) problems.
