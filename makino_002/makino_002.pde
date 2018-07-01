import processing.opengl.*;
import java.util.Calendar;

int winH = 900;
int winW = 1600;
PImage img;
int cNum  =3;
PFont fnt;

void settings(){
  img = loadImage("./processing3_data/makino_002/data/makino_001.png");
  //size(winW,winH,P3D);
  size(winW,winH);
}
void setup(){
  colorMode(HSB,360,100,100,100);
  fnt=createFont("Monospaced.plain",30);
  
  color duo1 =color(200,100,100);
  color duo2 =color(280,100,100);
  stroke(360);
  image(img,0,0);
  
  String [] csvLine = loadStrings("./processing3_data/makino_002/data/makino.csv");//5分割されている
  String [][] makino =new String[csvLine.length][split(csvLine[0],',').length];
  
  for(int i = 0; i < csvLine.length; i++){ 
    makino[i] = split(csvLine[i],',');    //項目をバラす
  }
  
  ////linegraph
  int cardNum = 4;
  int numNum = 4;
  int oneCardSpace = width/cardNum;
  //カード別
  strokeCap(SQUARE);
  strokeWeight(1);
  
  for(int i=0;i<cardNum;i++){
    for(int num=0;num<numNum;num++){
      textAlign(LEFT);
      textSize(10);
      int value = int(makino[i+1][2+num]);
      int valuep = int(makino[i+1][6+num]);
      stroke(360);
      float x = oneCardSpace*i+oneCardSpace/numNum*(0.5+num)-10;
      float xp = oneCardSpace*i+oneCardSpace/numNum*(0.5+num)+10;
      int y = height - (int)map(value,0,8000,0,height);
      int yp = height - (int)map(valuep,0,8000,0,height);
      if(num==0){ 
        y = height - (int)map(value,0,50,0,height);
        yp = height - (int)map(valuep,0,50,0,height);
      }
      //no +
      int hue1=250;
      for(int j=height;j>y;j--){
        int c = (int)map(j,0,height,100,25);
        stroke(hue1,c,c);
        line(x,j,x,j-1);
      }
      fill(hue1,100,100);
      text(value,x,y);
      
      //+
      int hue2= 200;
      for(int j=height;j>yp;j--){
        int c = (int)map(j,0,height,100,25);
        stroke(hue2,c,c);
        line(xp,j,xp,j-1);
      }
      fill(hue2,100,100);
      text(valuep,xp,yp);
    }
    //text
    fill(360);
    textFont(fnt);
    
    
    for(int t=0;t>=0;t--){
      textAlign(RIGHT);
      pushMatrix();
      
      translate(oneCardSpace*i+50,height);
      rotate(PI*0.5);
      String s = makino[i+1][1+t];
      if(t==1){
        s = makino[i+1][10];
      }else if(t==2){
        s = makino[i+1][11];
      }
      textSize(50);
      text(s,0,0);
      popMatrix();
    }
    
  }
  //for(int i=0;i<lNum;i++){
  //  int h = (int)random(200,300);
  //  stroke(h,50,70);
  //  int x = (int)(winW/lNum*(i+0.5));
  //  int y = (int)random(winH);
  //  line(x,winH,x,y);
  //  fill(h,100,100);
  //  text(winH-y,x,y);
  //}
  noLoop();
  
}
void draw(){
  noLoop();
}

void keyReleased() {  
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_####.png");
  
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}