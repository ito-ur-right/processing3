import generativedesign.*;
import java.util.Calendar;

color[] picColors ;
PImage img, img_o, gray;
int winSize = 1000;
int centor[] = new int[2];
int px[], py[];
int pNum=0;
void settings() {
  size(winSize, winSize);
  centor[0]=winSize/2;
  centor[1]=winSize/2;
  smooth();
}
void setup() {
  img = loadImage("data/jokoh_phase2.png");
  img_o = loadImage("data/jokoh_phase2.png");
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
}

void draw() {
  int x = 0;
  int y = 0;
  Rand r = new Rand();
  image(img_o, 0, 0);
  
  for(int i=0;i<100;i++){
    x = (int)random(0,1000);
    y = (int)random(0,1000);
    color c = color(img_o.get(x, y), 60);
    int size = (int)random(4,30);
    pushMatrix();
    translate(x,y);
    shearX(PI/2.9);
    //shearY(PI/80);
    //rotate(random(0,360));
    r.put(0, 0, size, c);
    popMatrix();
  }
  
  
  noLoop();
}

class Rand {
  float radius_o = 10; 
  int circleResolution = 6;
  float angle=TWO_PI/circleResolution;
  Rand() {
  }

  void put(int x, int y, int radius, color c) {

    fill(c);
    beginShape();
    for (int i=0; i<=circleResolution; i++) {
      float xp = cos(angle*i)*radius +x;
      float yp = sin(angle*i)*radius +y;
      
      vertex(xp, yp);
      // ランドルト環の内側のline
      if (i%2==0) {
        strokeCap(PROJECT); 
        strokeWeight(radius*0.05);
        //stroke(360-hue(c)+180, 100, 100, 10);
        stroke(0,0,100,50);
        float linex1 = cos(angle*i)*radius*0.75 +x;
        float liney1 = sin(angle*i)*radius*0.75 +y;
        float linex2 = cos(angle*(i+1))*radius*0.75 +x;
        float liney2 = sin(angle*(i+1))*radius*0.75 +y;
        line(linex1, liney1, linex2, liney2);
      }
      //noStroke();
    }
    endShape();
  }
}

void keyReleased() {
  if (key=='s') saveFrame(timestamp()+"_##.png");
  if (key=='r') loop();
}
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}