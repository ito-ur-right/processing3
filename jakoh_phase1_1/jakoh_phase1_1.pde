import generativedesign.*;
import java.util.Calendar;


color[] picColors ;
PImage img;
int winSize = 1000;
int[] noiseMap;
String sortMode=GenerativeDesign.GRAYSCALE;
float noiseOff = 0.007;
void settings() {
  size(winSize, winSize);
}
void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();

  noiseMap = new int[width*height];
  float yoff = 0.00;
  for (int y=0; y<height; y++) {
    float xoff = 0.00;
    for (int x=0; x<width; x++) {
      noiseMap[x+y*width] = (int)map(noise(xoff, yoff), 0, 1, 0, 100);
      xoff +=0.003;
    }
    yoff +=0.01;
  }
}

void draw() {
  int colorCount=0;
  int tileSkip = 1;
  int tileCount2 = winSize/tileSkip;
  float rectSize2 = width / float(tileCount2);

  for (int gridY=0; gridY<tileCount2; gridY++) {
    for (int gridX=0; gridX<tileCount2; gridX++) {
      //if(noiseMap[gridX+gridY*tileCount2]>80)noiseMap[gridX+gridY*tileCount2]=100;
      //fill((int)map(noiseMap[gridX+gridY*tileCount2],0,100,290,340),(int)map(noiseMap[gridX+gridY*tileCount2],0,100,0,65),(int)map(noiseMap[gridX+gridY*tileCount2],0,100,80,100));
      fill((int)map(noiseMap[gridX+gridY*tileCount2], 0, 100, 200, 340), (int)map(noiseMap[gridX+gridY*tileCount2], 0, 100, 200, 340), 100);
      //fill((int)map(noiseMap[gridX+gridY*tileCount2],0,100,0,255));
      rect(gridX*rectSize2, gridY*rectSize2, rectSize2, rectSize2);
    }
  }
}

void keyReleased() {
  if (key=='s') saveFrame(timestamp()+"_##.png");
  loop();
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}