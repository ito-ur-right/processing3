import processing.serial.*;

Serial myPort;

int s_num = 1;
int[] val = new int[s_num];
int head_val = 0;
float rangeInInches= 0;
float rangeInCentimeters = 0;

void setup(){
  size(640,480);
  myPort = new Serial(this,Serial.list()[3],9600);
  myPort.bufferUntil('\n');
}

void draw(){
  background(0);
  rangeInInches = head_val;
  rangeInCentimeters = rangeInInches * 2.54;
  text("Range: "+round(rangeInInches)+"inch",10,20);
  text("       "+round(rangeInCentimeters)+"cm",10,50);
}

void serialEvent(Serial myPort){
  if(myPort.available() >= 0){
    head_val = myPort.read();
      println(head_val);
      myPort.write("H");
  }
}

void mousePressed(){
  println("click");
  myPort.write("H");
}