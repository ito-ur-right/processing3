float len = 300;
float s = 1.7320568;
float c = 2;
float ax = 0;
float ay = -((len/c)*s*2)/3;
float bx = len/2;
float by = (len/c)*s/3;
float cx = -len/2;
float cy = (len/c)*s/3;
int z =0;
float r,g,b;

void setup(){
  
  //100:148=500:740
  size(740,500);
  background(0);
  noStroke();
}
void draw(){
  r=random(0,255);
  g=random(0,255);
  b=random(0,255);
  fill(r,g,b,20);
  rect(0,0,width,height);
  translate(width/2,height/2);
  if(z < 120){
    z++;
  }else{
    z=0;
  }
  rotate((PI/60)*z);
  fill(255-r,255-g,255-b,80);
  triangle(ax,ay,bx,by,cx,cy);
}
int a = 0;
void keyPressed(){
  if(key == 's'){
    a++;
    save("tri"+a+".jpg");
  }
}