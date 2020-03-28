---
layout: post
title: WebSockets
subtitle: Websockets using socket.io
category: Dev
tags: [tools]
---


## Table Of Contents
{:.no_toc}
---
- TOC
{:toc}


## Terminology

Websockets using socket.io js client library

rest api server -> queue -> socket worker -> push to socket -> web client consume

## Comparison with HTTP

why use http rest if have even one active ws connection?  

https://blog.feathersjs.com/http-vs-websockets-a-performance-comparison-da2533f13a77

## Doubts
- load balance?
- performance issue with concurrent continuous connections to the server?
- if already open , why not use the socket for everything



------

## Edits

- 2019-09-29
  - OP

