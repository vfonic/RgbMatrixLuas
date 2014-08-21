Raspberry Pi Library for Controlling an RGB LED Matrix
------------------------------------------------------

This library enables drawing shapes and writing text on an RGB LED Matrix using Raspberry Pi GPIO.
I developed it using a Raspberry Pi Model B running Debian GNU/Linux 7.0 (wheezy) and a 16x32 RGB LED Matrix purchased from the excellent Adafruit.
http://www.adafruit.com/products/420


Check out Adafruit's tutorial for more details:  https://learn.adafruit.com/connecting-a-16x32-rgb-led-matrix-panel-to-a-raspberry-pi


### Running

Just start the cpy.sh script in the root. It will copy all the neccessary files and build them on pi. (You'll need to manually create some directories on pi. Check the script for more details.)

	$ ./cpy.sh

To run the app, cd to app root and:

	$ sudo ./luas

### Photo
![image](https://raw.githubusercontent.com/vfonic/RgbMatrixLuas/master/photo.jpg)


### Credits

Many thanks for the code snippets taken from:  https://github.com/mattdh666/rpi-led-matrix-panel


### License

Written by Viktor Fonic and released under an MIT License. See the LICENSE file for deatils.
