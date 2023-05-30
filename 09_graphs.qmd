# The Graph Data Structure

## Background and Motivation

Imagine you want to represent the connections between you and your Instagram followers in a data structure. The diagram below (@fig-instagram-followers) shows a simple representation of your followers as numbered vertices and the edges represent the connections between you and your followers.

```{dot}
//| label: fig-instagram-followers
//| fig-cap: "A representation of your Instagram followers."
graph G {
  node [shape=circle];
  You -- {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20};
}
```

At first glance, it might appear to be a tree structure, but that is not the case. Your followers can follow other people, who in turn can have their followers. This creates a recursive relationship that cannot be represented using a tree data structure (see @fig-instagram-followers-recursive).

```{dot}
//| label: fig-instagram-followers-recursive
//| fig-cap: "A representation of your instagram followers where they're allowed to follow other people too."
graph G {
  node [shape=circle];
  You -- {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  1 -- {11, 12, 13, 14, 15};
  2 -- {16, 17, 18, 19, 20};
  12 -- {1, 3, 5, 7};
  14 -- {4, 8, 12};
  16 -- {2, 6, 10, 14};
  19 -- {9, 13, 17};
}
```

To accurately capture this complex relationship, we need to use a graph data structure. Graphs consist of a set of vertices (or nodes) and a set of edges that connect them. In the context of Instagram followers, the vertices represent the users, and the edges represent the connections between them.

Using a graph data structure allows us to represent the recursive nature of the relationship between you and your followers, enabling us to model and analyze the complex network of connections in a more accurate way.

Sure! I will translate the given block according to the specifications you provided. Here's the updated version:

Furthermore, the relationship between you and your followers is even more complex. For instance, you can follow someone who does not follow you back, creating a directed relationship where the edges have a direction. In this case, the edges represent the connections from you to your followers, but not the other way around. Such relationships are often modeled using directed graphs, which are a common use case for graphs. @fig-instagram-followers-directed visualizes this directed relationship.

```{dot}
//| label: fig-instagram-followers-directed
//| fig-cap: A directed representation of your Instagram followers. Here, an arrow going from vertex $A$ to vertex $B$ indicates that $A$ follows $B$, but $B$ does not necessarily follow $A$.
digraph G {
  node [shape=circle];
  You -> {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  1 -> {11, 12, 13, 14, 15};
  2 -> {16, 17, 18, 19, 20};
  12 -> {1, 3, 5, 7};
  14 -> {4, 8, 12};
  16 -> {2, 6, 10, 14};
  19 -> {9, 13, 17};
}
```


## Introduction

A **graph** is a non-linear data structure that consists of a set of vertices (also called nodes) and a set of edges (or connections) that connect these vertices. In this data structure, the arrangement of vertices and edges allows for a more flexible and complex representation of relationships between data elements compared to linear data structures like arrays, lists, or queues.

The concept of **adjacency** refers to the relationship between two vertices in a graph. If there is an edge connecting two vertices, they are said to be adjacent. **Incidence** is the relationship between a vertex and an edge. A vertex is said to be incident to an edge if it is one of the two vertices connected by that edge.

Graphs have numerous real-life applications, and some examples include:

- Social networks, where vertices represent people and edges represent friendships or connections
- Transportation networks, where vertices represent locations and edges represent roads or routes
- Coronavirus transmission networks, where vertices represent individuals and edges represent transmission paths

## Graph Terminology

Before diving into the implementation of graph data structures, let's discuss some basic terms and properties of graphs.

### Basic Terms and Properties

- A **graph** is a data structure for representing connections among items and consists of **vertices** connected by **edges**.​
- A **vertex** (or node) represents an item in a graph.​
- An **edge** represents a connection between two vertices in a graph.
- Two vertices are **adjacent** if connected by an **edge**.​

- **Directed vs Undirected**: In an **undirected graph**, the edges have no specific direction, meaning that if there is an edge between vertices A and B, the connection is mutual. In a **directed graph** (also called a digraph), the edges have a direction, indicating an asymmetrical relationship between vertices. (See @fig-directed-vs-undirected-1 and @fig-directed-vs-undirected-2 for examples.)

```{dot}
//| label: fig-directed-vs-undirected-1
//| fig-cap: Example of an undirected graph.
graph G {
  A -- B;
  B -- C;
  C -- A;
}
```

```{dot}
//| label: fig-directed-vs-undirected-2
//| fig-cap: Example of a directed graph.
digraph G {
  A -> B;
  B -> C;
  C -> A;
}
```


- **Weighted vs Unweighted**: In an **unweighted graph**, all edges have equal importance, while in a **weighted graph**, each edge is assigned a value (or weight), representing the importance, cost, or distance between the connected vertices. (See @fig-weighted-vs-unweighted-1 and @fig-weighted-vs-unweighted-2 for examples.)

```{dot}
//| label: fig-weighted-vs-unweighted-1
//| fig-cap: Example of an unweighted graph.
graph G {
  A -- B;
  B -- C;
  C -- A;
}
```

```{dot}
//| label: fig-weighted-vs-unweighted-2
//| fig-cap: Example of a weighted graph.
graph G {
  A -- B [label=2];
  B -- C [label=3];
  C -- A [label=1];
}
```


- **Simple vs Multigraph**: A **simple graph** has no more than one edge between any pair of vertices and does not contain any self-loops (edges that connect a vertex to itself). A **multigraph** can have multiple edges between the same pair of vertices and may include self-loops. (See @fig-simple-vs-multigraph-1 and @fig-simple-vs-multigraph-2 for examples.)

```{dot}
//| label: fig-simple-vs-multigraph-1
//| fig-cap: Example of a simple graph.
graph G {
  A -- B;
  B -- C;
  C -- A;
}
```

```{dot}
//| label: fig-simple-vs-multigraph-2
//| fig-cap: Example of a multigraph.
graph G {
  A -- B;
  A -- B [label="e2"];
  B -- C;
  C -- A;
  A -- A [label="self-loop"];
}
```


- **Degree**: The degree of a vertex is the number of edges incident to it. In a directed graph, we can distinguish between in-degree (the number of edges directed towards the vertex) and out-degree (the number of edges directed away from the vertex). See @fig-vertex-degree for an example.

```{dot}
//| label: fig-vertex-degree
//| fig-cap: Example graph with vertex degrees.
graph G {
  A -- B [label="A (degree 3)"];
  B -- C [label="B (degree 3)"];
  C -- A [label="C (degree 3)"];
  A -- D [label="D (degree 1)"];
}
```

- **Path**: A path in a graph is a sequence of vertices connected by edges. See @fig-path for an example.

```{dot}
//| label: fig-path
//| fig-cap: Example graph with a path from A to D.
graph G {
  A -- B;
  B -- C;
  C -- D;
}
```

- **Cycle**: A cycle is a closed path, where the first and last vertices in the path are the same, and no vertex is visited more than once. See @fig-cycle for an example.

```{dot}
//| label: fig-cycle
//| fig-cap: Example graph with a cycle. (A-B-C)
graph G {
  A -- B;
  B -- C;
  C -- A;
}
```

- **Connected vs Disconnected**: A graph is connected if there is a path between every pair of vertices. If there is at least one pair of vertices with no path between them, the graph is disconnected. See @fig-connected-vs-disconnected-1 and @fig-connected-vs-disconnected-2 for examples.

```{dot}
//| label: fig-connected-vs-disconnected-1
//| fig-cap: Example of a connected graph.
graph G {
  A -- B;
  B -- C;
  C -- A;
}
```

```{dot}
//| label: fig-connected-vs-disconnected-2
//| fig-cap: Example of a disconnected graph.
graph G {
  A -- B;
  B -- C;
  D -- E;
}
```


### Graph Notation

We can use a notation like $G(V, E)$, where $V$ is the set of vertices and $E$ is the set of edges, to represent a graph.

### Special Types of Graphs

- **Complete Graph**: A complete graph is a simple graph in which every pair of vertices is connected by a unique edge. See @fig-complete-graph for an example.

```{dot}
//| label: fig-complete-graph
//| fig-cap: Example of a complete graph.
graph G {
  A -- B;
  A -- C;
  A -- D;
  B -- C;
  B -- D;
  C -- D;
}
```

- **Bipartite Graph**: A bipartite graph is a graph whose vertices can be divided into two disjoint sets such that all edges connect vertices from one set to the other, with no edges connecting vertices within the same set. See @fig-bipartite-graph for an example.

```{dot}
//| label: fig-bipartite-graph
//| fig-cap: Example of a bipartite graph.
graph G {
  A -- 1;
  A -- 2;
  B -- 1;
  B -- 3;
  C -- 2;
  C -- 3;
}
```


- **Tree**: A tree is an undirected graph with no cycles, and all vertices are connected. It has a hierarchical structure, with one vertex acting as the root, and the other vertices connected in a parent-child relationship. See @fig-tree for an example.

```{dot}
//| label: fig-tree
//| fig-cap: Example of a tree.
graph G {
  A -- B;
  A -- C;
  B -- D;
  B -- E;
  C -- F;
  C -- G;
}
```

## Graph Representation

In order to work with graphs in code or store them in memory, we need efficient ways to represent them. There are multiple methods to represent graphs, and the choice of representation depends on factors such as the density of the graph, the operations to be performed, and memory constraints.

In this section, we will discuss two common methods to represent a graph: adjacency list and adjacency matrix.

### Adjacency List

An **adjacency list** represents a graph by storing a list of adjacent vertices for each vertex in the graph. This can be implemented using an array of lists or a hash table, where the index or key corresponds to a vertex, and the value is a list of adjacent vertices.

```{dot}
//| label: fig-adjacency-list-graph
//| fig-cap: See adjacency list for this example @lst-adjacency-list-example
graph G {
  A -- B;
  A -- C;
  B -- D;
  C -- D;
}
```

Adjacency list representation for figure @fig-adjacency-list-graph:

```{#lst-adjacency-list-example .rust lst-cap="Adjacency list representation."}
A: [B, C]
B: [A, D]
C: [A, D]
D: [B, C]

// or as an arraylist of arraylists -
[[B, C], [A, D], [A, D], [B, C]]
// here, the index of the outer arraylist represents the vertex.
// in order for this to work, the order of the vertices must be 
// fixed, and stored separately.
```

The adjacency list representation is efficient for sparse graphs (graphs with relatively few edges) as it only stores the existing edges, reducing memory usage. This representation also allows for faster traversal of a vertex's neighbors.

### Adjacency Matrix

An **adjacency matrix** is a two-dimensional array (or matrix) where the cell at the i-th row and j-th column represents the edge between vertex i and vertex j. For an undirected graph, the adjacency matrix is symmetric. For a weighted graph, the values in the cells represent the weights of the edges; for an unweighted graph, the cells contain either 1 (edge exists) or 0 (no edge).

```{dot}
//| label: adjacency-matrix-graph
//| fig-cap: See adjacency matrix for this example @lst-adjacency-matrix-example
graph G {
  A -- B;
  A -- C;
  B -- D;
  C -- D;
}
```

Adjacency matrix representation (unweighted):

```{#lst-adjacency-matrix-example .text lst-cap="Adjacency matrix representation."}
  A B C D
A 0 1 1 0
B 1 0 0 1
C 1 0 0 1
D 0 1 1 0
```

The adjacency matrix representation is suitable for dense graphs (graphs with many edges) or when checking for the presence of an edge between two vertices needs to be fast. However, this representation can be inefficient in terms of memory usage, especially for large, sparse graphs, as it stores information for all possible edges, even if they do not exist.

### Converting Between Representations

To convert a graph diagram or notation into an adjacency list or an adjacency matrix, follow these steps:

1. Identify the vertices and edges in the graph.
2. For an adjacency list, create an empty list or hash table for each vertex. For each edge, add the adjacent vertices to the corresponding lists.
3. For an adjacency matrix, create a square matrix with dimensions equal to the number of vertices. For each edge, set the corresponding cells in the matrix to 1 (or the edge weight for weighted graphs).

To convert an adjacency list or an adjacency matrix back into a graph diagram or notation, follow these steps:

1. Identify the vertices based on the keys (for an adjacency list) or indices (for an adjacency matrix).
2. For an adjacency list, iterate through the lists and draw an edge for each adjacent vertex.
3. For an adjacency matrix, iterate through the matrix cells and draw an edge for each non-zero value (or the corresponding weight for weighted graphs).

## Graph Traversal

Imagine you want to find the average age of all users on Facebook. With billions of users, it is infeasible to hold the entire graph of the friend network in memory. Ideally, we would want to find out information on each user one at a time, on a per-need basis. To achieve this, we can use graph traversal algorithms, which allow us to visit each user, add up their ages, and then calculate the average. A simple way to do this is to load information on a user, add all their friends to a stack, and then keep popping from the stack and requesting data from Facebook for each friend. When we receive the data, we mark that user as visited to avoid recounting their age if we reach the same user again. We then add friends of each loaded user to our stack and keep repeating until we run out of users in our stack.

This problem illustrates the importance of graph traversal, a fundamental operation in graph theory. Graphs are a powerful and versatile data structure that can model various kinds of relationships and networks, such as social networks, computer networks, transportation networks, web pages, games, and many other domains. Graph traversal allows us to explore and manipulate graphs in various ways, with applications in domains like searching for specific nodes, finding the shortest path between nodes, and analyzing the structure of a graph.

Graph traversal algorithms typically begin with a start node and attempt to visit the remaining nodes from there. They must deal with several troublesome cases, such as unreachable nodes, revisited nodes, and choosing which node to visit next among several options. To handle these cases, graph traversal algorithms use different strategies and data structures to keep track of which nodes have been visited and which nodes are still pending. The most common graph traversal algorithms are breadth-first search (BFS) and depth-first search (DFS), which differ in the order in which they visit the nodes.

In some situations, we may not know the entire graph at once and instead only have access to a node object and its adjacent nodes. As demonstrated in the Facebook example, graph traversal algorithms can be used to solve problems that involve large and dynamic graphs by visiting each user and analyzing their information on a per-need basis.

There are two common methods to traverse a graph:

1. Breadth-First Search (BFS)
2. Depth-First Search (DFS)

By understanding and implementing these graph traversal methods, you can efficiently explore and manipulate complex graphs to solve a wide range of problems.

### Breadth-First Search (BFS)

**Breadth-First Search** explores a graph by visiting all the neighbors of the starting vertex before moving on to their neighbors. BFS uses a queue data structure to keep track of the vertices to visit.

Here's a step-by-step example of BFS traversal (for the graph in example @fig-bfs-example):

```{dot}
//| label: fig-bfs-example
//| fig-cap: Example graph for BFS traversal.
graph G {
  A -- B;
  A -- C;
  B -- D;
  C -- D;
  C -- E;
}
```

BFS traversal starting from vertex A:

1. Visit A and add its neighbors B and C to the queue: [B, C]
2. Visit B and add its unvisited neighbor D to the queue: [C, D]
3. Visit C and add its unvisited neighbor E to the queue: [D, E]
4. Visit D: [E]
5. Visit E: []

BFS traversal order: `A, B, C, D, E`

BFS pseudocode:

```
BFS(graph, start):
  Initialize an empty queue Q
  Mark start as visited
  Enqueue start into Q
  
  while Q is not empty:
    vertex = Dequeue(Q)
    Visit vertex
    
    for each neighbor of vertex:
      if neighbor is not visited:
        Mark neighbor as visited
        Enqueue neighbor into Q
```

### Depth-First Search (DFS)

**Depth-First Search** explores a graph by visiting a vertex and its neighbors as deeply as possible before backtracking. DFS can be implemented using recursion or an explicit stack data structure.

Here's a step-by-step example of DFS traversal (for the graph in example @fig-dfs-example):

```{dot}
//| label: fig-dfs-example
//| fig-cap: Example graph for DFS traversal.
graph G {
  A -- B;
  A -- C;
  B -- D;
  C -- D;
  C -- E;
}
```


DFS traversal starting from vertex A:

1. Visit A and recurse on its first neighbor B
2. Visit B and recurse on its first neighbor D
3. Visit D and backtrack (no unvisited neighbors)
4. Backtrack to A and recurse on its next neighbor C
5. Visit C and recurse on its first neighbor E
6. Visit E and backtrack (no unvisited neighbors)

DFS traversal order: `A, B, D, C, E`

DFS pseudocode (recursive):

```
DFS(graph, vertex):
  Mark vertex as visited
  Visit vertex
  
  for each neighbor of vertex:
    if neighbor is not visited:
      DFS(graph, neighbor)
```

DFS pseudocode (iterative with a stack):

```
DFS(graph, start):
  Initialize an empty stack S
  Mark start as visited
  Push start onto S
  
  while S is not empty:
    vertex = Pop(S)
    Visit vertex
    
    for each neighbor of vertex:
      if neighbor is not visited:
        Mark neighbor as visited
        Push neighbor onto S
```

### Applications and Variations of BFS and DFS

Both BFS and DFS have numerous applications and can be adapted to solve various graph-related problems:

- **Shortest path**: BFS can be used to find the shortest path between two vertices in an unweighted graph. The algorithm can be modified to keep track of the path length or the actual path itself.
- **Connected components**: Both BFS and DFS can be used to find connected components in an undirected graph. By running the traversal algorithm and marking visited vertices, we can identify the set of vertices reachable from a starting vertex. Repeating this process for all unvisited vertices will find all connected components in the graph.

- **Topological sorting**: DFS can be adapted to perform a topological sort on a directed acyclic graph (DAG). A topological ordering is a linear ordering of the vertices such that for every directed edge (u, v), vertex u comes before vertex v in the ordering. This can be useful in scheduling tasks with dependencies or determining the order of courses in a curriculum.

- **Bipartite graph check**: BFS or DFS can be used to check if a graph is bipartite. The algorithm can be modified to color vertices while traversing the graph. If at any point during the traversal, two adjacent vertices have the same color, the graph is not bipartite.

- **Graph cycle detection**: DFS can be used to detect cycles in a graph. By keeping track of the recursion stack, we can determine if a vertex is visited more than once in the same path, indicating a cycle.

In summary, graph traversal is a fundamental operation in graph theory with various applications. Breadth-First Search (BFS) and Depth-First Search (DFS) are two common techniques to traverse a graph, each with its own advantages and use cases. Understanding these algorithms and their variations can help solve a wide range of graph-related problems.
