
import processing.serial.*;

Serial myPort;

int s_num = 1;
int[] val = new int[s_num];
float rangeInInches= 0;
float rangeInCentimeters = 0;

void setup(){
  size(640,480);
  myPort = new Serial(this,Serial.list()[3],9600);
  myPort.bufferUntil('\n');
}

void draw(){
  background(0);
  //print("ok");
  text("       "+val[0]+"mm",10,50);
}

void serialEvent(Serial myPort){
  if(myPort.available() >= 0){
    val[0] = myPort.read();
    println(val[0]);
  }
  
  
}

void mousePressed(){
  println("click");
  myPort.write("H");
}