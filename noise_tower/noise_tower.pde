
import generativedesign.*;
import java.util.Calendar;


int winW = 2000;
int winH = 2000;

float xoff, yoff;
float cx, cy;
float start_cx, start_cy;

void settings() {
  size(winW, winH, P2D);
}
void setup() {
  
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  background(0,0,100);
  strokeWeight(5);
  stroke(0, 0, 0, 80);
  noFill();

  int hankei=500;
  int hankei_a  =5;
  int cNum=(((hankei)/hankei_a )-1)*2;

  int tHeight = 2000;
  int tHeight_a = tHeight/cNum/2;
  for (int i=0; i<cNum; i++) {
    pushMatrix();
    translate(width/2, height/2 - ((cNum/2-1) - i)*tHeight_a );

    int angleNum =500;
    float angle = TWO_PI/(angleNum);

    beginShape();
    for (int j=0; j<angleNum; j++) {
      cx = cos(90+angle *j)*hankei + noise(xoff)*5;
      cy = sin(90+angle *j)*hankei + noise(yoff)*5;

      xoff+=0.03;
      yoff+=0.03;
      vertex(cx, cy);
    }
    endShape(CLOSE);

    popMatrix();
    hankei -= hankei_a;
  }
}

void draw() {
}

void keyReleased() {
  if (key=='s') saveFrame(timestamp()+"_##.png");
}
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}