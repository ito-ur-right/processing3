float x;
float y;
float easing = 0.15;
float diameter = 12;

void setup(){
  size(480,320);
}

void draw(){
  float targetX=mouseX;
  float targetY=mouseY;
  x += (targetX - x)*easing;
  y += (targetY - y)*easing;
  if(mousePressed){
    fill(random(100,255),random(100,255),random(100,255));
  }else{
    fill(random(100),random(100),random(100));
  }
  ellipse(x,y,diameter,diameter);
  println(targetX+":"+x);
}