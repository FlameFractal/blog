---
layout: post
title: Facebook Hacker Cup 2017
subtitle: Qualification Round
category: [dev]
bigimg: 
-"/img/fb-hackercup.jpg"
tags: [dev]
---

My solution for the Progress Pie problem.

1. Check if the point is in the circle
2. Check if the angle the point makes with the Y axis is smaller than the angle of the sector


```
import math

class circle:
	def __init__ (self, radius, center_x, center_y):
		self.radius = radius
		self.center_x = center_x
		self.center_y = center_y

def isInCircle(c, point_x, point_y):
	return ((point_x-c.center_x)*(point_x-c.center_x) + (point_y-c.center_y)*(point_y-c.center_y) <= c.radius*c.radius)

def isInSector(progressPercent, c, point_x, point_y):
	sector_theta = progressPercent/100 * 360
	point_phi = math.atan2(point_x-c.radius,point_y-c.radius)*(180/math.pi)
	return point_phi<sector_theta

def isBlackWhite(progressPercent, c, point_x, point_y):
	return "black" if (isInSector(progressPercent, c, point_x, point_y) and isInCircle(c,point_x,point_y)) else "white"

if __name__ == "__main__": 
	c = circle(50,50,50)
	point = []
	with open("input.txt", "r") as ins:
		num_inputs = int(ins.readline().split()[0])
		for i in range(num_inputs):
			point.append(ins.readline().split())
			progressPercent = float(point[i][0])
			print ("Case #"+str(i+1)+": "+isBlackWhite(progressPercent, c, int(point[i][1]), int(point[i][2])))

```




**P.S.** This is my first serious program in Python.