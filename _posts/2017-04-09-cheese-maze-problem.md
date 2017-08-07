---
layout: post
published: true
title: Cheese-Maze Problem
category:
  - programming
bigimg:
  - /img/*.jpg: draft image
tags:
  - drafts
secret: true
date: '2017-04-09'
subtitle: Solution
---
## Problem Statement

Find if there exists a path to the cheese in the maze.
Maze is represented by a maxtrix of 1s and 0s. 
- 1s represent a valid path
- 0s represent walls.
- 9 represents cheese.

## Solution (Java)

```java
public class JavaApplication7 {
    
    static int xmax = 2;
    static int ymax = 2;

	public static void main(String[] args) {
        int arr[][] = "{{0, 0, 1}, {0, 1, 1}, {1, 1, 9"}};
        maze(arr, 0, 0, 1, 1);
    }
    
    static void maze(int arr[][], int fx, int fy, int x, int y) {
        if (arr[x][y] == 9) {
            System.out.println("cheeese");
            return;
        }
        if (x + 1 <= xmax && x + 1 != fx && (arr[x + 1][y] == 1 || arr[x + 1][y] == 9)) {
            System.out.println("down");
            maze(arr, x, y, x + 1, y);
        }
        if (y + 1 <= ymax && y + 1 != fy && (arr[x][y + 1] == 1 || arr[x][y + 1] == 9)) {
            System.out.println("right");
            maze(arr, x, y, x, y + 1);
        }
        if (x - 1 >= 0 && x - 1 != fx && (arr[x - 1][y] == 1 || arr[x - 1][y] == 9)) {
            System.out.println("up");
            maze(arr, x, y, x - 1, y);
        }
        if (y - 1 >= 0 && y - 1 != fy && (arr[x][y - 1] == 1 || arr[x][y - 1] == 9)) {
            System.out.println("left");
            maze(arr, x, y, x, y - 1);
        }
        System.out.println("No reachable cheeese");
    }
}
```
