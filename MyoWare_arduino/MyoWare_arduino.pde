import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
  
PrintWriter output;

int input0 = 0;
int input1 = 1;
int n = 2;
void setup() {
  size(400,200);
  frameRate(5);
  arduino = new Arduino(this, Arduino.list()[3], 57600);
  
  output = createWriter( createFileName() ); 
  output.println("time"+","+"analog0");
}
 
void draw() {
  background(0);
  fill(255);
  int analog0 = arduino.analogRead(input0);
  float volt = (analog0*5.0)/1024.0;
  volt = float(round(volt*pow(10,n)))/pow(10,n);//四捨五入
  
//  int analog1 = arduino.analogRead(input1);
  text("input0 = " + volt, 10, 20);
//  text("input1 = " + analog1, 10, 40);
  output.println(createTimeName()+","+volt);
}

String createFileName() {
  String fileName= nf(year(), 2) + nf(month(), 2) + nf(day(), 2) +"-"+ nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  fileName += ".csv";
  return fileName;
}
String createTimeName() {
  String fileName= str(millis());
  return fileName;
}

void keyPressed(){
  if( key == 'q' ){
    output.flush(); 
    output.close(); 
    exit();               
  }
}