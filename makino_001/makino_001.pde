import processing.opengl.*;
import java.util.Calendar;

int winH = 900;
int winW = 1600;
int lNum = 16;
int cSize = 400;
int my = 9;
int mx = 16;
PImage img;
int cNum  =3;

void settings(){
  img = loadImage("data/tes.png");
  //size(winW,winH,P3D);
  size(winW,winH);
}
void setup(){
  colorMode(HSB,360,100,100,100);
  
  color duo1 =color(200,100,100);
  color duo2 =color(280,100,100);
  stroke(360);
  
  //dot
  for(int y=0;y<my+1;y++){
    for(int x=0;x<mx+1;x++){
      line(x*100-5,y*100,x*100+5,y*100);
      line(x*100,y*100-5,x*100,y*100+5);
    }
  }
  
  //circlegraph
  for(int i=-1;i<cNum-1;i++){
      pushMatrix();
      translate(winW/2 +i*400,winH/2);
      rotate(-PI/2);
      makeCircleGraph(0,0,200,i);
      popMatrix();
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
void draw(){
  
}

void makeCircleGraph(int x,int y,int size,int cir){
  //circlegraph
  noStroke();
  int num = 5;
  float max=0;
  float[] values = new float[num+2];
  values[0]=0;
  values[num+1]=0;
  for(int i=1;i<num+1;i++){
    values[i]=random(1.0);
  }
  
  for(int i=1;i<num+1;i++){
    max += values[i];
  }
  
  float sum = 0;
  float bsum = 0;
  for(int i=0;i<num+1;i++){
    bsum = sum;
    sum += values[i];
    color c = img.get((int)random(300,700),(int)random(250,1250));
    fill(hue(c),saturation(c)-i*3,brightness(c)-i*3);
    arc( x, y, size,size, radians(map(bsum,0,max,0,360)), radians(map(sum,0,max,0,360)) );
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