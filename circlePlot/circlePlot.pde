import processing.opengl.*;
import java.util.Calendar;

int winH = 900;
int winW = 1600;
int lNum = 16;
int cSize = 40;
int my = 9;
int mx = 16;
PImage img;

void settings() {
  img = loadImage("data/tes.jpg"); 
  
  size(img.width, img.height);
  //size(winW,winH,P3D);
  //size(winW, winH);
}
void setup() {
  background(0);
  colorMode(HSB, 360, 100, 100, 100);
  color duo1 =color(200, 100, 100);
  color duo2 =color(280, 100, 100);
  //stroke(360);
  smooth();
  ////dot
  //for (int y=0; y<my+1; y++) {
  //  for (int x=0; x<mx+1; x++) {
  //    line(x*100-5, y*100, x*100+5, y*100);
  //    line(x*100, y*100-5, x*100, y*100+5);
  //  }
  //}

  //circlegraph
  int mar = 15;
  for (int i=-1*(int)(width/cSize/2); i<width/cSize; i++) {
    for (int j=-1*(int)(width/cSize/2); j<width/cSize; j++) {
      pushMatrix();
      translate(width/2 +i*(cSize+mar), height/2+j*(cSize+mar));
      rotate(-PI/2);
      color c = img.get(width/2 +i*(cSize+mar),height/2+j*(cSize+mar));
      makeCircleGraph(0, 0, cSize,c);
      popMatrix();
    }
  }


  ////linegraph
  //for(int i=0;i<lNum;i++){
  //  int h = (int)random(200,300);
  //  stroke(h,50,70);
  //  int x = (int)(winW/lNum*(i+0.5));
  //  int y = (int)random(winH);
  //  line(x,winH,x,y);
  //  fill(h,100,100);
  //  text(winH-y,x,y);
  //}
}
void draw() {
}

void makeCircleGraph(int x, int y, int size, color c) {
  //circlegraph
  noStroke();
  int num = 5;
  float max=0;
  float[] values = new float[num+2];
  values[0]=0;
  values[num+1]=0;
  for (int i=1; i<num+1; i++) {
    values[i]=random(1.0);
  }

  for (int i=1; i<num+1; i++) {
    max += values[i];
  }

  float sum = 0;
  float bsum = 0;
  for (int i=0; i<num+1; i++) {
    bsum = sum;
    sum += values[i];
    //int h = (int)random(50,360);
    int h = (int)hue(c);
    int s = (int)saturation(c);
    int b = (int)brightness(c);
    fill((h-i*10), s-i*5, b-i*5+30);
    arc( x, y, size, size, radians(map(bsum, 0, max, 0, 360)), radians(map(sum, 0, max, 0, 360)) );
  }
}
void keyReleased() {  
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_####.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}