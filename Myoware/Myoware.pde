import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
int input0 = 0;
int input1 = 1;
 
void setup() {
  size(400,200);
  arduino = new Arduino(this, Arduino.list()[3], 57600);
}
 
void draw() {
  background(0);
  fill(255);
  int analog0 = arduino.analogRead(input0);
  int analog1 = arduino.analogRead(input1);
  text("input0 = " + analog0, 10, 20);
  text("input1 = " + analog1, 10, 40);
}
