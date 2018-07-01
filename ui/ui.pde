import generativedesign.*;
import java.util.Calendar;
import processing.opengl.*;


int centorX;
int centorY;
int buttonW;
int buttonH;
int buttonInW;
int buttonInH;
PFont myFont;
String ui = "Button"; 
void setup(){
  size(600,400,OPENGL);
  noStroke();
  colorMode(HSB,360,100,100);
  background(0);
  buttonW = 190;
  buttonH =90;
  buttonInW = 170;
  buttonInH = 80;
  myFont = loadFont("data/KH-Dot-Kodenmachou-12-Ki-48.vlw");
  textFont(myFont);
}

void draw(){
  centorX = width/2;
  centorY =height/2;
  
  beginShape();
  fill(0,0,100);
  vertex(centorX - buttonW/2,centorY - buttonH/2);
  vertex(centorX + buttonW/2,centorY - buttonH/2);
  vertex(centorX ,centorY);
  endShape();
  
  beginShape();
  fill(0,0,50);
  vertex(centorX + buttonW/2,centorY - buttonH/2);
  vertex(centorX + buttonW/2,centorY + buttonH/2);
  vertex(centorX ,centorY);
  endShape();
  
  beginShape();
  fill(0,0,30);
  vertex(centorX + buttonW/2,centorY + buttonH/2);
  vertex(centorX - buttonW/2,centorY + buttonH/2);
  vertex(centorX ,centorY);
  endShape();
  beginShape();
  
  fill(0,0,80);
  vertex(centorX - buttonW/2,centorY - buttonH/2);
  vertex(centorX - buttonW/2,centorY + buttonH/2);
  vertex(centorX ,centorY);
  endShape();
  
  beginShape();
  fill(0,0,90);
  vertex(centorX + buttonInW/2,centorY + buttonInH/2);
  vertex(centorX - buttonInW/2,centorY + buttonInH/2);
  vertex(centorX - buttonInW/2,centorY - buttonInH/2);
  vertex(centorX + buttonInW/2,centorY - buttonInH/2);
  endShape();
  
  fill(0,0,0);
  textSize(50);
  text(ui, centorX-75, centorY+15);
}