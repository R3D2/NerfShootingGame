// TIME
int actSecond;
int initSecond;

// POSITION
float x;
float y;
float easing = 0.05;

// TARGET
int NUMBEROFPOINTS = 5;
ArrayList<Point> lstPoints = new ArrayList<Point>();


void setup() {
  size(640,480);
  background(51);
  noStroke();
  
  // Create our list of random points
  for(int i = 0; i < NUMBEROFPOINTS; i++)
  {
    int rX = (int)random(50, width);
    int rY = (int)random(50, height);
    lstPoints.add(new Point(rX,rY));
  }
  
  Point p = lstPoints.get(0);
  
  ellipse(p.xPosition, p.yPosition, 66, 66); //<>//
}

void draw() {
  
  // Get the actual second
  actSecond = second();
  
  //
  Point p = null;
  
  if (initSecond - actSecond >= 10)
  {
    p = lstPoints.get((int)random(0,NUMBEROFPOINTS));
    initSecond = actSecond;
    
    float targetX = (float)p.xPosition;
    float dx = targetX - x;
    x += dx * easing;
  
    float targetY = (float)p.yPosition;
    float dy = targetY - y;
    y += dy * easing;
    ellipse(x, y, 66, 66);
  }
}

// Target Class
class Point {
  
  int xPosition, yPosition;
  
  Point (int x, int y) 
  {
    this.xPosition = x;
    this.yPosition = y;
  }
}

class Target {
  
  int actualTarget, nbrOfTarget;
  
  Target (int idFirstTarget, int nbrOfTarget)
  {
    this.actualTarget = idFirstTarget;
    this.nbrOfTarget = nbrOfTarget;
  }
  
  void moveTarget()
  {
    if (this.actualTarget == this.nbrOfTarget)
    {
      this.actualTarget = 0;
    }
    else
    {
      this.actualTarget += 1;
    }
  }
}