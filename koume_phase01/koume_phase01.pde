import processing.opengl.*;
import java.util.Calendar;

PImage img;
int counter=0;
int DETAIL = 100;
float xoff = 0.0;
float xoff2 = 0.0;

void setup(){
  img = loadImage("data/tes.png"); 
  size(1000,1500,P3D);
  colorMode(HSB,360,100,100,100);
  //noFill();
  noStroke();
  //image(img,0,0);
  //strokeWeight(1);
  for(int i=0;i<width;i++){
      //color c = img.get(i,0);
      color c = color((int)map(noise(xoff),0,1,150,180),50,100,100);
      beginShape();
      fill(360-hue(c)+180,50,50,20);
      vertex(i,0);
      vertex(i+1,0);
    
    
      float hei = noise(xoff);
      xoff2 += hei/40;
      float hei2  =noise(xoff2);
      //fill(360 - hue(c)+180,100,0,90);
      fill(0,50,map(height/2+map(hei2,0,1,0,height/2),0,height,100,0),100);
      vertex(i+1,height/2+map(hei2,0,1,0,height/2));
      vertex(i,height/2+map(hei2,0,1,0,height/2));
      endShape();
    
    
    xoff +=0.01; 
  }
  //beginShape();
  //fill(190,100,100,20);
  //vertex(0,0);
  //vertex(width,0);
  //fill(190,100,0,0);
  //vertex(width,height);
  //vertex(0,height);
  //endShape();
}
void draw(){
  
}

void keyReleased() {  
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_####.png");
  
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}