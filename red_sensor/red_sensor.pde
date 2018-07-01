import processing.serial.*;

Serial myPort;

int s_num = 1;
int[] val = new int[s_num];
float fillColor;
float diameter;

void setup(){
  size(640,480);
  myPort = new Serial(this,Serial.list()[3],9600);
  myPort.bufferUntil('\n');
}

void draw(){
  background(0);
  fill(fillColor);
  //print("ok");
  ellipse(width/2,height/2,diameter,diameter);
}

void serialEvent(Serial myPort){
  if(myPort.available() >= 3){
    int head_val = myPort.read();
   // println(head_val);
    int val_high = myPort.read();
      //println(val_high);
      int val_low = myPort.read();
      //println(val_low);
    if(head_val >= 128 && val_high<128 && val_low<128){
      val[0] = ((head_val-128)<<14) + (val_high<<7) + val_low;
      println(val[0]);
      //if(0 == s_num-1){
      
      //}
    }
    myPort.write('H');
  }
  fillColor = map(val[0],0,1023,0,255);
  diameter = map(val[0],0,1023,0,height);
}

void mousePressed(){
  println("click");
  myPort.write("H");
}
