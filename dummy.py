#!/usr/bin/env python
# -*- coding: utf-8 -*-



import time
from datetime import datetime, date
import sys

t = datetime.today()

door = 7

f = open("/home/pi/buzzmein/scotty.csv","a") 
f.write("start," + str(t) + "," + sys.argv[1] + "\n")
f.close() 

println ("open")

t = datetime.today()

f = open("/home/pi/buzzmein/scotty.csv","a") 
f.write("end," + str(t) + "," + sys.argv[1] + "\n")
f.close() 
