import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture camera;
MultiMarker nya;
PImage Pcamera;

void setup(){
  size(480,320,P3D);
  camera =new Capture(this,width,height);
  camera.start();
  nya = new MultiMarker(this,width,height,"camera_para.dat",NyAR4PsgConfig.CONFIG_PSG);
  nya.addARMarker("patt.hiro",80);
}

void draw(){
  if(camera.available() != true){
     return;
  }
  camera.read();
  nya.detect(camera);
  background(0);
  nya.drawBackground(camera);
  image(camera,0,0);
  if((!nya.isExistMarker(0))){
    return;
  }
  nya.beginTransform(0);
  fill(0,255,255);
  translate(0,0,20);
  box(40);
  nya.endTransform();
}