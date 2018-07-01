import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture camera;
MultiMarker nya;
PImage Pcamera;

void setup(){
  size(480,320);
  frameRate(30);
  stroke(255);
  camera =new Capture(this,width,height,30);
  camera.start();
  Pcamera = new PImage(width,height);
}

void draw(){
  Pcamera.loadPixels();
  tint(255,64);
  image(camera,0,0);

  
  for(int y = 0; y<height;y+=5){
    for(int x = 0; x<width;x+=5){
      int pos = (y*width) + x;
      float diff = abs(brightness(Pcamera.pixels[pos])-brightness(camera.pixels[pos]));
       if(diff > 50){
          fill(camera.pixels[pos]);
          stroke(random(100,225),random(100,225),random(100,225));
          rect(x,y,diff/5,diff/5);
          //ellipse(x,y,diff/5,diff/5);
       }
    }
  }
  Pcamera.copy(camera,0,0,width,height,0,0,width,height);
}

void captureEvent(Capture camera){
  camera.read();
}