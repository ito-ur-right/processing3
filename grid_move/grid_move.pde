import processing.opengl.*;
import java.util.Calendar;

int tileCount = 20;

void setup(){
  size(600,600,OPENGL);
  background(100);
  frameRate(10);
  colorMode(HSB,360,100,100,100);
}

void draw(){
  translate(width/tileCount/2,height/tileCount/2);
  
  strokeWeight(10);
  
  for(int gridY=0;gridY<tileCount;gridY++){
    for(int gridX=0;gridX<tileCount;gridX++){
      stroke(0,0,random(60,100));
      int posX =width/tileCount * gridX;
      int posY =height/tileCount * gridY;
      
      float shiftX = random(-5,5);
      float shiftY = random(-5,5);
      
      ellipse(posX+shiftX,posY+shiftY,5,5);
    }
  }
  translate(-width/tileCount/2,-height/tileCount/2);
  beginShape();
  fill(60,100,100,50);
  vertex(-10,-10);
  vertex(width+10,-10);
  fill(200,100,100,50);
  vertex(width+10,height+10);
  vertex(-10,height+10);
  endShape();
}