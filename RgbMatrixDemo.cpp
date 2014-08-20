#include "DisplayUpdater.h"
#include "RgbMatrix.h"
#include "RgbMatrixContainer.h"
#include "Thread.h"

#include <cstdlib>
#include <iostream>
#include <math.h>
#include <stdio.h>
#include <unistd.h>

#define _USE_MATH_DEFINES


char **text;
int textc;

// Draw some shapes on the RGB Matrix. 
class RgbMatrixDrawShapes1 : public RgbMatrixContainer
{
public:
  RgbMatrixDrawShapes1(RgbMatrix *m) : RgbMatrixContainer(m) {}

  void run()
  {
    // Color red;
    // red.red = 255;

    Color green;
    green.green = 5;

    Color blue;
    blue.blue = 5;

    _matrix->setFontSize(2); // Medium (4x6) Font
    _matrix->setTextCursor(1, 18);
    _matrix->setFontColor(green);

    int idx = 1;
    display_time(idx);

    idx += text[1][0] - '0' + 1;

    _matrix->setTextCursor(1, 1);
    _matrix->setFontColor(blue);
    display_time(idx);
 }

 void display_time(int idx) {
    if (text[idx][0] > '0')
      display(text[idx+1]);

    if (text[idx][0] == '2') {
      _matrix->writeChar(' ');
      display(text[idx+2]);
    }
 }

 void display(char *text) {
    int i = 0;
    while (text[i] != '\0') {
      _matrix->writeChar(text[i++]);
    }
 }

};

RgbMatrix *m = NULL;

RgbMatrixContainer *display = NULL;
RgbMatrixContainer *updater = NULL;

void runDemo()
{
  updater->start(10);
  display->start();

  // getchar();
  sleep(60);

  delete display;
  delete updater;

  display = NULL;
  updater = NULL;

  m->clearDisplay();
  m->updateDisplay();
}

int main(int argc, char *argv[])
{
  if (argc < 4) {
    printf("This program requires at least four arguments\n");
    exit(-1);
  }

  textc = argc;
  text = argv;

  GpioProxy io;

  if (!io.initialize())
    return 1;

  m = new RgbMatrix(&io);

  display = new RgbMatrixDrawShapes1(m);
  updater = new DisplayUpdater(m);

  runDemo();

  // Stop threads and wait for them to join.
  if (display) delete display;
  if (updater) delete updater;

  // Clear and refresh the display.
  m->clearDisplay();
  m->updateDisplay();

  delete m;

  return 0;
}
