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

void setup(){
  
  //100:148=500:740
  size(500,740);
  background(0);
  noStroke();
}
void draw(){
  
  translate(width/2,height/2);
  
  noFill();
  stroke(255);
  strokeWeight(40);
  triangle(ax,ay,bx,by,cx,cy);
}
int a = 0;
void keyPressed(){
  if(key == 's'){
    a++;
    save("tri"+a+".jpg");
  }
}