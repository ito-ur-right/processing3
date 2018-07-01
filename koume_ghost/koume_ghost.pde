
import geomerative.*;
import generativedesign.*;
import java.util.Calendar;


char typedKey = '霊';
float spacing = 20;
float spaceWidth = 150; // width of letter ' '
int fontSize = 200;
float lineSpacing = fontSize*1.5;
float stepSize = 2;
float danceFactor = 1;
float letterX = 50;
float textW = 50;
float letterY = lineSpacing;


RFont font;
RGroup grp;
RPoint[] pnts;

boolean freeze = false;

void setup() {
  size(1200,800); 
  // make window resizable
  surface.setResizable(true);  
  smooth();

  frameRate(15);

  // allways initialize the library in setup
  RG.init(this);
  font = new RFont("JKG-L_3.ttf", fontSize, RFont.LEFT);

  //  ------ get the points on the curve's shape  ------
  // set style and segment resolution

  //RCommand.setSegmentStep(10);
  //RCommand.setSegmentator(RCommand.UNIFORMSTEP);

  RCommand.setSegmentLength(25);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  //RCommand.setSegmentAngle(random(0,HALF_PI));
  //RCommand.setSegmentator(RCommand.ADAPTATIVE);

  grp = font.toGroup(typedKey+"");
  textW = grp.getWidth();
  pnts = grp.getPoints(); 

  background(255);
}

void draw() {
  noFill();
  pushMatrix();

  // translation according the amoutn of letters
  translate(letterX,letterY);

  // distortion on/off
  if (mousePressed) danceFactor = map(mouseX, 0,width, 1,3);
  else danceFactor = 1;

  // are there points to draw?
  if (grp.getWidth() > 0) {
    // let the points dance
    for (int i = 0; i < pnts.length; i++ ) {
      pnts[i].x += random(-stepSize,stepSize)*danceFactor;
      pnts[i].y += random(-stepSize,stepSize)*danceFactor;  
    }

    //  ------ lines: connected rounded  ------
    strokeWeight(0.08);
    //stroke(200,0,0);
    beginShape();
    // start controlpoint
    curveVertex(pnts[pnts.length-1].x,pnts[pnts.length-1].y);
    // only these points are drawn
    for (int i=0; i<pnts.length; i++){
      curveVertex(pnts[i].x, pnts[i].y);
    }
    curveVertex(pnts[0].x, pnts[0].y);
    // end controlpoint
    curveVertex(pnts[1].x, pnts[1].y);
    endShape();

    //  ------ lines: connected straight  ------
    strokeWeight(0.1);
    stroke(0);
    beginShape();
    for (int i=0; i<pnts.length; i++){
      vertex(pnts[i].x, pnts[i].y);
      ellipse(pnts[i].x, pnts[i].y, 7, 7);
    }
    vertex(pnts[0].x, pnts[0].y);
    endShape();
  }

  popMatrix();
}

void keyReleased(){
  if(key=='s') saveFrame(timestamp()+"_##.png");
}
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}