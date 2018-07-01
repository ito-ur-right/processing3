import generativedesign.*;
import java.util.Calendar;


color[] picColors ;
PImage img;
PGraphics pg,pg2;
int winSize = 1000;
int[] noiseMap;
float noiseOff = 0.007;
int f = 100;
PImage make[],g[],g_b[],g_a[];
int gridZ=0;
color c[];
String now;
void settings(){
    size(winSize,winSize);
}
void setup(){
  //img = loadImage("data/t.png");
  //img.resize(winSize,winSize);
  pg = createGraphics(winSize, winSize);
  pg2 = createGraphics(winSize, winSize);
  now  =timestamp();
  colorMode(HSB,360,100,100,100);
  noStroke();
  //frameRate(30);
  c = new color[width*height*f];
  make = new PImage[f];
  g = new PImage[f];
  g_b = new PImage[f];
  g_a = new PImage[f];
  //noiseMap = new int[width*height*f];
  float zoff=0.00;
  for(int z=0;z<f;z++){
    make[z] = createImage(winSize, winSize,HSB);
    g[z] = createImage(winSize, winSize,HSB);
    g_b[z] = createImage(winSize, winSize,HSB);
    g_a[z] = createImage(winSize, winSize,HSB);
    float yoff = 0.00;
    for(int y=0;y<height;y++){
      float xoff = 0.00;
      for(int x=0;x<width;x++){
        //noiseMap[x+y*width+z*width*height] = (int)map(noise(xoff,yoff,zoff),0,1,0,100);
        int n = (int)map(noise(xoff,yoff,zoff),0,1,0,100);
        //c[x+y*width+z*width*height] = color((int)map(n,0,100,290,340),(int)map(n,0,100,0,65),(int)map(n,0,100,80,100));
        color co =color((int)map(n,0,100,290,340),(int)map(n,0,100,0,65),(int)map(n,0,100,80,100));
        xoff +=0.003;
        make[z].set(x, y, co);
        
        
      }
      yoff +=0.01;
    }
    pg.beginDraw();
    pg.image(make[z],0,0,winSize,winSize);
    //pg.image(img,0,0,winSize,winSize);
    pg.endDraw();
    pg2.beginDraw();
    pg2.image(make[z],0,0,winSize,winSize);
    //pg2.image(img,0,0,winSize,winSize);
    pg2.endDraw();
    g[z] = pg2;
    g_b[z] = pg;
    g_b[z].filter(GRAY);
    float a; 
    for(int y=1; y<winSize-1; y++){ 
      for(int x=1; x<winSize-1; x++){
      // 畳み込み計算
        a =  - red(g_b[z].get(x,y-1)) - red(g_b[z].get(x-1,y)) + 4*red(g_b[z].get(x,y)) - red(g_b[z].get(x+1,y)) - red(g_b[z].get(x,y+1)); 
        if(a>3){
          color c = color(g[z].get(x,y));
          g_a[z].set(x, y, color(hue(c),saturation(c),100));  // 出力画像の画素値を設定
        }else{
          g_a[z].set(x,y,color(0,0,0,0));
        }
        
      } 
    }
    zoff +=0.009;
  }
}

void draw(){
  //int colorCount=0;
  //int tileSkip = 1;
  //int tileCount2 = winSize/tileSkip;
  //float rectSize2 = width / float(tileCount2);
  
  //for (int gridY=0; gridY<tileCount2; gridY++) {
  //  for (int gridX=0; gridX<tileCount2; gridX++) {
  //    //int n = noiseMap[gridX+gridY*tileCount2+gridZ*tileCount2*tileCount2];
  //    //if(noiseMap[gridX+gridY*tileCount2]>80)noiseMap[gridX+gridY*tileCount2]=100;
  //    //fill((int)map(n,0,100,290,340),(int)map(n,0,100,0,65),(int)map(n,0,100,80,100));
  //    //fill(c[gridX+gridY*tileCount2+gridZ*tileCount2*tileCount2]);
  //    //fill((int)map(noiseMap[gridX+gridY*tileCount2],0,100,0,255));
  //    //rect(gridX*rectSize2, gridY*rectSize2, rectSize2, rectSize2);
      
      
      
  //  }
  //}
  if(gridZ<f-1){
    gridZ++;
    image(g[gridZ],0,0,winSize,winSize);
    image(g_a[gridZ],0,0,winSize,winSize);
    saveFrame(now+"/###.png");
  }else{
    noLoop();
  }
  
  
}

void keyReleased(){
  if(key=='s') saveFrame(timestamp()+"/###.png");
  loop();
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}