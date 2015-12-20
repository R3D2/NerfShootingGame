// Time & Tick
int time;                    // Contains the time elapsed since the target has been drawn
int TRIGGER = 2000;

// Graphics
PFont font;

// Move
float x;
float y;
float easing = 0.05;

// Targets
int NBROFPOINTS = 5;
int ELLIPSE_RAYON = 60;
ArrayList<Target> lstTargets;
Target target = null;
boolean hit = false;

// DEBUG 
boolean DEBUG = true;

void setup() {
  size(640,480);
  background(51,141,179);
  smooth(3);
  font = loadFont("ArialRoundedMTBold-48.vlw");
  
  // Init our time variable
  time = millis();
  lstTargets = new ArrayList<Target>();
  
  // Create our list of random points
  for(int i = 0; i < NBROFPOINTS; i++)
  {
    int rX = (int)random(50, width);
    int rY = (int)random(50, height);
    lstTargets.add(new Target(rX,rY));
  }
  
  // Get the first target
  target = lstTargets.get(0);
  
  // Draw the target
  target.Draw();
}

void draw() {
  
  // If the time elapsed is equal our trigger get a new target
  if(millis() - time >= TRIGGER)
  {
    target = lstTargets.get((int)random(0,NBROFPOINTS));
    time = millis();
  }
  
  // Draw the background
  background(51,141,179);
  
  if (hit)
  {
    textFont(font, 32);
    text("HIT !", 10, 120);
    hit = false;
  }
  else
  {
    if (DEBUG)
    {
      textFont(font, 32);
      text(mouseX, 10, 50);
      text(mouseY, 120, 50);
    }
  }
  
  // Calculating the points of the target
  float targetX = target.xPosition;
  float dx = targetX - x;
  x += dx * easing;
  float targetY = target.yPosition;
  float dy = targetY - y;
  y += dy * easing;
  
  // Draw the target
  ellipse(x, y, ELLIPSE_RAYON, ELLIPSE_RAYON);
}

void mouseClicked() {
  
  // If the dart has hit the target
  if(target.hasBeenHit(mouseX,mouseY))
  {
    hit = true;
  }
}