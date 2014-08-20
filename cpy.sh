#!/bin/bash
scp luas* pi@192.168.0.16:scripts
scp RgbMatrixDemo.cpp pi@192.168.0.16:display16x32/rpi-gradient/demo
ssh pi@192.168.0.16 "cd ~/display16x32/rpi-gradient/demo; make;"
