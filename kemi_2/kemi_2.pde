import generativedesign.*;
import java.util.Calendar;


color[] picColors ;
PImage img;
int winSize = 800;
String sortMode=GenerativeDesign.GRAYSCALE;
void settings(){
    size(winSize,winSize);
}
void setup(){
  img = loadImage("data/hatsune_kemi.png"); 
  img.resize(800,800);
  picColors= new color[800*800];
  colorMode(HSB,360,100,100,100);
  noStroke();
}

void draw(){
  int colorCount=0;
  for(int y=0;y<winSize;y++){
    for(int x=0;x<winSize;x++){
      color c = img.pixels[x+y*winSize];
      if(brightness(c)>88){
        img.pixels[x+y*winSize] = color(hue(c),saturation(c),brightness(c),100-brightness(c));
        //img.pixels[x+y*winSize] = color(hue(c),saturation(c),brightness(c),50);
      }else{
        img.pixels[x+y*winSize] = color(hue(c),saturation(c),brightness(c));
        picColors[colorCount] = color(200,saturation(c),brightness(c),75);
        colorCount++;
      }
    }
  }
  if (sortMode != null) picColors = GenerativeDesign.sortColors(this, picColors, sortMode);
  //int tileCount1 = 200;
  //float rectSize1 = width / float(tileCount1);
  //int i1 = 0;
  //for (int gridY=0; gridY<tileCount1; gridY++) {
  //  for (int gridX=0; gridX<tileCount1; gridX++) {
  //    fill(picColors[i1%colorCount]);
  //    rect(gridX*rectSize1, gridY*rectSize1, rectSize1, rectSize1);
  //    i1++;
  //  }
  //}
  pushMatrix();
  translate(width/2,height/2);
  int ii=0;
  //noFill();
  int skip =30;
  //strokeWeight(2);
  noStroke();
  for (int gridX=400/skip; gridX>0; gridX--) {
    fill(picColors[(int)random(0,160000)]);
    stroke(picColors[(int)random(0,160000)]);
    int r = (int)random(0);
    if(r==0){
      rect(-gridX*skip, -gridX*skip, gridX*2*skip, gridX*2*skip);
    }else if(r==1){
      ellipse(0,0,gridX*2*skip,gridX*2*skip);
    }
    
  }
  popMatrix();
  image(img,0,0,width,height);
  
  
  noLoop();
}

void keyReleased(){
  if(key=='s') saveFrame(timestamp()+"_##.png");
  if (key == '4') sortMode = null;
  if (key == '5') sortMode = GenerativeDesign.HUE;
  if (key == '6') sortMode = GenerativeDesign.SATURATION;
  if (key == '7') sortMode = GenerativeDesign.BRIGHTNESS;
  if (key == '8') sortMode = GenerativeDesign.GRAYSCALE;
  loop();
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}