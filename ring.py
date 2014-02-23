#!/usr/bin/env python
# -*- coding: utf-8 -*-


import RPi.GPIO as GPIO
import time
from datetime import datetime, date
import sys

t = datetime.today()

door = 7

f = open("/home/pi/scotty/scotty.csv","a") 
f.write("start," + str(t) + "," + sys.argv[1] + "\n")
f.close() 

GPIO.setmode (GPIO.BOARD)
GPIO.setup (door, GPIO.OUT)
GPIO.output (door, False)
time.sleep (1)
GPIO.output(door,True)
time.sleep (1)
GPIO.cleanup ()


t = datetime.today()

f = open("/home/pi/scotty/scotty.csv","a") 
f.write("end," + str(t) + "," + sys.argv[1] + "\n")
f.close() 
