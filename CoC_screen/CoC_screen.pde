import fullscreen.*;
PImage img;
FullScreen fs;
int room;

void setup(){
  size(displayWidth,displayHeight);
}

void draw(){
  background(0,0,0);
  img = loadImage("room1_1.JPG");
  if(key=='1'){
    img = loadImage("room1_1.JPG");
    room=1;
  }else if(key=='2'){
    img = loadImage("room2_1.JPG");
    room=2;
  }
  if(room==1 && key=='d'){
    img = loadImage("door1.JPG");
  }
  if(room==2 && key=='d'){
    img = loadImage("door3.JPG");
  }
  if(room==2 && key=='o'){
    img = loadImage("door4.JPG");
  }
  image(img,0,0,displayWidth,displayHeight);
}