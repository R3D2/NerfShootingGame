float x;
float y;
float easing = 0.05;

int NUMBEROFPOINTS = 5;

ArrayList<Target> lstTarget = new ArrayList<Target>();

void setup() {
  fullScreen(1);
  noStroke();  
}

void load(){
  
  for(int i = 0; i < NUMBEROFPOINTS; i++)
  {
    int rX = random(0, width);
    int rY = random(0, height);
    lstTarger.add(new Target(rx,ry));
  }
  
}

void draw() { 
  background(51);
  
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  ellipse(x, y, 66, 66);
}

// Target Class
Class Target {
  int xPosition, yPosition;
  
  Target (int x, int y) {
    xPosition = x;
    yPosition = y;
  }
  
}