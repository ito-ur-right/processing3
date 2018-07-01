void setup() {
  size(400, 300);
}

void draw() {
}

void keyPressed() {
  fill(random(256), random(102, 256));
  textSize(random(36, 64));
  textAlign(CENTER);
  text(key, random(width), random(height));
}