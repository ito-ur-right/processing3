import java.util.Calendar;

void setup(){
  size(600,600);
  noFill();
  colorMode(HSB,360,100,100,100);
  background(0,0,0);
}

void draw(){
  translate(width/2,height/2);
  int circleResolution = (int)map(mouseX,0,width,0,180);
  float radius = mouseX - width/2 +0.5;
  float angle = TWO_PI/circleResolution;
  stroke(random(180,360),50,(int)map(mouseY,0,height,0,100));
  strokeWeight(1);
  beginShape();
  for(int i=0;i<=circleResolution;i++){
    float x = cos(angle*i) * radius;
    float y = sin(angle*i) * radius;
    line(0,0,x,y);
    vertex(x,y);
    
  }
  
  endShape();
}

void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(255);
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}