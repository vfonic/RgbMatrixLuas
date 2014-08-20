#!/bin/bash
scp luas* pi@192.168.0.16:scripts
scp RgbMatrixLuas.cpp pi@192.168.0.16:display16x32/luas
ssh pi@192.168.0.16 "cd ~/display16x32/luas; g++ -Wall -O2 -g -I. -c -o RgbMatrixLuas.o RgbMatrixLuas.cpp; g++ -Wall -O2 -g -I.  -o luas RgbMatrixLuas.o Thread.o -L. -lpthread -lrgbmatrix && echo 'OK!'"
