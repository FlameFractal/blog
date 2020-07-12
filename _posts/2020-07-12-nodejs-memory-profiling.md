---
layout: post
title: NodeJS Memory Profiling
subtitle: FILL THIS UP
category: [drafts] 
bigimg: 
- "/img/*.jpg" : "draft image"
tags: [drafts]
secret: false
---

DRAFT  

## Table Of Contents
{:.no_toc}
---
- TOC
{:toc}

## Profiling

- cpu, memory heap profiling
- shallow size, retained size
- retainer objects
- definitions of `process.memoryUsage()`
    + resident set size: is the portion of memory occupied by a process that is held in the RAM, this contains:
        + the code itself
        + the stack
        + the heap
    + stack: contains primitive types and references to objects
    + heap: stores reference types, like objects, strings or closures
    + shallow size of an object: the size of memory that is held by the object itself
    + retained size of an object: the size of the memory that is freed up once the object is deleted along with its' dependent objects



## GC

Heap used = new objects being allocated from memory, some short lived object is attached to a long lived object and is not being GC-ed

GC algos
scavenging (new space)
mark and sweep (old space)

New Space and Old Space
- new space
    - where new allocations happen 
    - (1-8MB)
    - fast to collect GC here
    - Young Generation
- old space
    - where objects that survive collection in new space are promoted to
    - fast allocation, slow collection
    - gc only when oom

As a default, Node.js will try to use about 0.7/1.4GB memory on 32/64 bit systems 


## How to profile in production

- trigger the dump 
    - techniques
        - rest api, write to file every 1 hour, upload aws
        - on a spike, write to aws
    - tools
        + node-headpdump
            + kill -USR2            
        + mdb, gcore in linux
            + gcore `pgrep node`
            + ::findjsobjects
            + object_id::jsprint
            + object_id::findjsobjects -r
    - 
 
For PM2, use the max_memory_restart flag for short term solution and prevent stalling


## Catalog

node --expose-gc --inspect=9222 app.js

start = 4 mb
baseline = 86 mb

for i in `seq 1 40`; do curl http://localhost:4000/v3/products; done

ab -T application/json -c 10 -n 2000 http://localhost:4000/v3/products

siege -r 1000 -c 100 http://localhost:3000


## Resources

- https://www.youtube.com/watch?v=O1YP8QP9gLA
- https://blog.risingstack.com/case-study-node-js-memory-leak-in-ghost/
- https://developer.ibm.com/technologies/node-js/articles/nodejs-memory-management-in-container-environments/


## Questions