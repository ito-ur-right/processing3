import processing.opengl.*;
import java.util.Calendar;


PImage img;
int counter=0;
int DETAIL = 100;
float xoff = 0.0;
float xoff2 = 0.0;
int px[],py[];
int startRadius =50;
float[] cx;
float[] cy;
float Xincrease = 0.1;
float Yincrease = 0.1;

void settings(){
  
}
void setup(){
  size(1000,1000,P3D);
  colorMode(HSB,360,100,100,100);
  //img = loadImage("data/tes2.png"); 
  
  //background(0,0,30,100);
  
  //cx = new float[startRadius];
  //cy = new float[startRadius];
  //float[] XnoiseArg, YnoiseArg;
  
  //XnoiseArg = new float[startRadius];
  //YnoiseArg = new float[startRadius];
  //noFill();
  //strokeWeight(0.5);
  //stroke(0,0,0,80);
  //pushMatrix();
  //translate(width/2,height/2);
  //for(int d=0;d<5;d++){
  //  for(int i=0;i<startRadius;i++){
  //    XnoiseArg[i] = random(10000);
  //    YnoiseArg[i] = random(10000);
  //  }
  //  for(int num=0;num<startRadius-10;num++){
  //    stroke(0,0,map(num,0,startRadius-10,0,100),100);
  //    float deltaLength = num/2;
  //    float angle = TWO_PI/(startRadius-num);
    
  //    for(int j=0;j<startRadius;j++){
  //      float adjust = deltaLength * 0.4625; //noiseの偏り修正用
  //      cx[j] = cos(angle *j) * (startRadius-num) +noise(XnoiseArg[num])*deltaLength - adjust;
  //      cy[j] = sin(angle *j) * (startRadius-num) +noise(XnoiseArg[num])*deltaLength - adjust;
  //      XnoiseArg[j] += Xincrease;
  //      YnoiseArg[j] += Yincrease;
  //    }
  //  //円を書く
  //    beginShape();

  //  //curveVertex(cx[startRadius-1], cy[startRadius-1]);
  //    for (int point = 0; point < startRadius; point++) {
  //      curveVertex(cx[point], cy[point]);
  //    }
  //  //curveVertex(cx[0], cy[0]);
  //  //curveVertex(cx[1], cy[1]);

  //    endShape();
  //  }
  //}
  //popMatrix();
  
  
  //noFill();
  noStroke();
  //image(img,0,0);
  //strokeWeight(1);
  for(int i=0;i<width;i++){
      color c = color(0,0,10,100);
      beginShape();
      fill(360-hue(c)+180,100,50,20);
      vertex(i,0);
      vertex(i+1,0);
    
    
      float hei = noise(xoff);
      xoff2 += hei/40;
      float hei2  =noise(xoff2);
      //fill(360 - hue(c)+180,100,0,90);
      fill(0,100,map(map(hei2,0,1,height/2,height),0,height,100,0),100);
      vertex(i+1,map(hei2,0,1,height/2,height));
      vertex(i,map(hei2,0,1,height/2,height));
      endShape();
      xoff +=0.01; 
    }
    for(int i=0;i<width;i++){
      color c = color(0,0,10,100);
      beginShape();
      fill(360-hue(c)+180,100,0,20);
      vertex(i,height);
      vertex(i+1,height);
    
      float hei = noise(xoff);
      xoff2 += hei/3;
      float hei2  =noise(xoff2);
      //fill(360 - hue(c)+180,100,0,90);
      fill(270,100,map(height-map(hei2,0,1,height/2,height),0,height,0,100),100);
      vertex(i+1,height - map(hei2,0,1,height/2,height));
      vertex(i,height - map(hei2,0,1,height/2,height));
      endShape();
      xoff +=0.01; 
    
    
  }
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