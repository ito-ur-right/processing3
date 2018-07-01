import processing.opengl.*;
import java.util.Calendar;

PImage img;
int counter=0;
int DETAIL = 100;
float xoff = 0.0;
float xoff2 = 0.0;

void setup(){
  img = loadImage("data/koume_phase01.png"); 
  size(1000,1500,P3D);
  colorMode(HSB,360,100,100,100);
  //noFill();
  noStroke();
  image(img,0,0);
  for(int i=0;i<150;i++){
    tenta(i);
  }
  
  //image(img,0,0);
  //strokeWeight(1);
  
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

void tenta(int j){
  noStroke();
  float size = 0;
  int x = (int)random(width);
  int t = (int)map(sq(x-width/2),0,sq(width),0,height/8);//二次関数
  int len = t+(int)random(t*2)+10;
  //int len = (int)map(noise(xoff),0,1,0,200);
  int turn =(int)map(noise(xoff),0,1,1,44);
  int weight = (int)map(len,0,height*0.75+10,50,80);
  if(random(1)<0.1){
    x=(int)random(width);
  }else{
    x += (int)random(-100,100);
  }

  for(float i= len;i>(int)random(3,10);i-=0.5){
    fill((int)map(noise(xoff),0,1,360,330),(int)map(i*2,len,len*2,50,0),(int)map(i*2,len,len*2,50,25));
    if(i>weight){
      size = weight;
    }else{
      size = i;
    }
    if(j%2==0){
      ellipse(x+sin(PI*i/turn)*map(noise(xoff),0,1,10,15),height-len*2+i*2,size,size);
    }else{
      ellipse(x+cos(PI*i/turn)*map(noise(xoff),0,1,10,15),height-len*2+i*2,size,size);
    }
    xoff += 0.05;
  }
}