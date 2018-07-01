import java.util.Calendar;

int winSize = 2000;
int[] noiseMap;

void settings() {
  size(winSize, winSize, P3D);
}

void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();

  noiseMap = new int[width*height];
  float yoff = 0.00;
  for (int y=0; y<height; y++) {
    float xoff = 0.00;
    for (int x=0; x<width; x++) {
      noiseMap[x+y*width] = (int)map(noise(xoff, yoff), 0, 1, 0, 100);
      xoff +=0.03;
    }
    yoff +=0.001;
  }

  noise();
}

void noise() {

  int tileSkip = 1;
  int tileCount = winSize/tileSkip;
  float rectSize = width / float(tileCount);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
      int n = noiseMap[gridX+gridY*tileCount];
      int h = (int)map(n, 0, 100, 150, 200);
      int s = (int)map(n, 0, 100, 0, 100);
      int b = (int)map(n, 0, 100, 50, 100);
      fill(h, s, b);
      rect(gridX*rectSize, gridY*rectSize, rectSize, rectSize);
    }
  }
}

void draw() {
}

void keyReleased() {
  if (key=='s') saveFrame(timestamp()+"_##.png");
  if (key=='r') ;
  loop();
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}