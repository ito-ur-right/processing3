void setup(){
  size(480,320);
  stroke(0,50);
}
void draw(){
  float weight = dist(mouseX,mouseY,pmouseX,pmouseY);
  strokeWeight(weight);
  stroke(random(255),random(255),random(255));
  line(mouseX,mouseY,pmouseX,pmouseY);
}