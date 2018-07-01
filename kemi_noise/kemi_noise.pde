import generativedesign.*;
import java.util.Calendar;


color[] picColors ;
PImage img;
int winSize = 800;
int[] noiseMap;
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
  
  noiseMap = new int[width*height];
  float yoff = 0.00;
  for(int y=0;y<height;y++){
    float xoff = 0.00;
    for(int x=0;x<width;x++){
      noiseMap[x+y*width] = (int)map(noise(xoff,yoff),0,1,0,100);
      xoff +=2.5;
    }
    yoff +=2.5;
  }
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
        img.pixels[x+y*winSize] = color(hue(c),saturation(c),100-noiseMap[x+y*width]);
        picColors[colorCount] = color(abs(hue(c)),saturation(c),brightness(c));
        colorCount++;
      }
    }
  }
  if (sortMode != null) picColors = GenerativeDesign.sortColors(this, picColors, sortMode);
  
  int tileSkip = 1;
  int tileCount2 = 800/tileSkip;
  float rectSize2 = width / float(tileCount2);

  for (int gridY=0; gridY<tileCount2; gridY++) {
    
    for (int gridX=0; gridX<tileCount2; gridX++) {
      fill((int)map(noiseMap[gridX+gridY*tileCount2],0,100,0,255));
      rect(gridX*rectSize2, gridY*rectSize2, rectSize2, rectSize2);
    }
  }
  
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