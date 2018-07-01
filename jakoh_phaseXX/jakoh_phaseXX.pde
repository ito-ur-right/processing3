import generativedesign.*;
import java.util.Calendar;

color[] picColors ;
PImage img,img_o,gray;
int winSize = 1000;
int centor[] = new int[2];
int px[],py[];
int pNum=0;
void settings(){
    size(winSize,winSize);
    centor[0]=winSize/2;
    centor[1]=winSize/2;
}
void setup(){
  img = loadImage("data/jakoh_phase2_2.png");
  img_o = loadImage("data/jakoh_phase2_2.png");
  colorMode(HSB,360,100,100,100);
  noFill();
  gray = createImage(img.width, img.height,HSB);
  img.filter(GRAY);
  
  float a; 
  for(int y=1; y<img.height-1; y++){ 
    for(int x=1; x<img.width-1; x++){
      // 畳み込み計算
      a =  - red(img.get(x,y-1)) - red(img.get(x-1,y)) + 4*red(img.get(x,y)) - red(img.get(x+1,y)) - red(img.get(x,y+1)); 
      if(a>3){
        color c = color(img_o.get(x,y));
        gray.set(x, y, color(hue(c)+random(50),saturation(c),100));  // 出力画像の画素値を設定
      }else{
        gray.set(x,y,color(0,0,0,0));
      }
      
    } 
  }
  noLoop();
  
}

void draw(){
  image(img_o,0,0);
  image(gray,0,0);
}

void keyReleased(){
  if(key=='s') saveFrame(timestamp()+"_##.png");
}
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}