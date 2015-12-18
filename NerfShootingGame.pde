// TIME
int time;
int TRIGGER = 5000; // Time lapse between the next target
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
boolean move = false;


void setup() {
  size(640,480);
  background(51,51,51);
  smooth(3);
  
  // Init our time variable
  time = millis();
  
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
  
  if(millis() - time >= TRIGGER)
  {
    nextPoint = lstPoints.get((int)random(0,NBROFPOINTS));
    time = millis();
  }
  
  // Draw the background
  background(51);
  
  // Moving the ellipse
  float targetX = nextPoint != null ? (float)nextPoint.xPosition : (float)actualPoint.xPosition ;
  float dx = targetX - x;
  x += dx * easing;
  float targetY = nextPoint != null ? (float)nextPoint.yPosition : (float)actualPoint.yPosition ;
  float dy = targetY - y;
  y += dy * easing;
  
  ellipse(x, y, 66, 66);
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