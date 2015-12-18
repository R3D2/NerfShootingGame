// TIME
int count;
int initSecond;

// POSITION
float x;
float y;
float easing = 0.05;

// TARGET
int NBROFPOINTS = 5;
ArrayList<Point> lstPoints = new ArrayList<Point>();
Point actualPoint = null;
Point nextPoint = null;
boolean goingToTheNextTarget = false;


void setup() {
  
  size(640,480);
  background(51);
  noStroke();
  
  // Create our list of random points
  for(int i = 0; i < NBROFPOINTS; i++)
  {
    int rX = (int)random(50, width);
    int rY = (int)random(50, height);
    lstPoints.add(new Point(rX,rY));
  }
  
  actualPoint = lstPoints.get(0);
  
  ellipse(actualPoint.xPosition, actualPoint.yPosition, 66, 66);
}

void draw() {
  
  // Get the actual second
  count++;
  
  if (count == 250)
  {
    nextPoint = lstPoints.get((int)random(0,NBROFPOINTS));
    goingToTheNextTarget = true;
    count = 0;
  }
  
  if (goingToTheNextTarget)
  {
    background(51);
    float targetX = (float)nextPoint.xPosition;
    float dx = targetX - nextPoint.xPosition;
    nextPoint.xPosition += dx * easing;
  
    float targetY = (float)actualPoint.yPosition;
    float dy = targetY - nextPoint.yPosition;
    nextPoint.yPosition += dy * easing;
    
    ellipse(nextPoint.xPosition, nextPoint.yPosition, 66, 66);
    
    if((targetX == actualPoint.xPosition) && (targetY == actualPoint.yPosition))
    {
      goingToTheNextTarget = false;
    }
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