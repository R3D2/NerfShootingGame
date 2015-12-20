
// Game Parameters
Game game = new Game();

// Time & Tick
int time;                    // Contains the time elapsed since the target has been drawn
int TRIGGER = 2000;

// GameState
int gameState = 0; // 0 - Start screen, 1 - Game

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
  size(640,480,P3D);
  
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
}

void draw() {
  
  switch(gameState) {
    
    // START SCREEN
    case(0):
      textFont(game.getGameFont(48),48);
      text("NerfShooter !",width/2,height/2);
      textFont(game.getGameFont(24),24);
      text("Click to start...",10,height-10);
      break;
      
    // GAME
    case(1):
      
      // If the time elapsed is equal our trigger get a new target
      if(millis() - time >= TRIGGER)
      {
        target = lstTargets.get((int)random(0,NBROFPOINTS));
        time = millis();
      }
      
      // Draw the background
      background(game.getBackgroundColor());
      
      if (hit)
      {
        textFont(game.getGameFont(24), 24);
        text("HIT !", 10, 120);
        hit = false;
      }
      
      // Calculating the points of the target
      float targetX = target.xPosition;
      float dx = targetX - x;
      x += dx * easing;
      float targetY = target.yPosition;
      float dy = targetY - y;
      y += dy * easing;
      
      // Draw the target
      fill(54);
      noStroke();
      ellipse(x, y, ELLIPSE_RAYON, ELLIPSE_RAYON);
      break;
  }
}

void mouseClicked() {
  
  if(gameState == 0)
  {
    gameState = 1;
  }
  
  // If the dart has hit the target
  if(target.hasBeenHit(mouseX,mouseY))
  {
    hit = true;
  }
}