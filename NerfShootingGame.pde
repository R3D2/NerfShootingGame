// Game Parameters
Game game = new Game();
int score;

// Time & Tick
int targetElapsedTime; 
int startcountdownElapsedTime;
int gameElapsedTime;

int TRIGGER = 3000;
int countdownStart = 5;
int countdownGame = 20;

// GameState
int gameState = 0; // 0 - Start screen, 1 - Game

// Move
float x;
float y;
float easing = 0.05;

// Targets
int NBROFPOINTS = 5;
int ELLIPSE_RAYON = 150;
ArrayList<Target> lstTargets;
Target target = null;
boolean hit = false;

// DEBUG 
boolean DEBUG = true;

void setup() {
  fullScreen(P3D);
  smooth(8);
  
  // Init our time variable
  targetElapsedTime = millis();
  lstTargets = new ArrayList<Target>();
  score = 0;
  //song = minim.loadFile("hit.mp3");
  
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
    case 0:
      textFont(game.getGameFont(48),48);
      text("NerfShooter !",width/2,height/2);
      textFont(game.getGameFont(24),24);
      text("Click to start...",10,height-10);
      break;
    
    // START COUNTDOWN
    case 1:
      textFont(game.getGameFont(48),48);
      
      // Each second
      if(millis() - startcountdownElapsedTime >= 1000)
      {
        if(countdownStart != 0)
        {
          background(game.getBackgroundColor());
          text("Get Ready !", width/2-105, height/2-100);
          text(countdownStart,width/2, height/2);
          countdownStart--;
          startcountdownElapsedTime = millis();
        }
        else
        {
          // End of the start countdown goes to the game
          gameState = 2;
        }
      }
      break;
      
    // GAME
    case 2:
      // Draw the background
      background(game.getBackgroundColor());
      
      if(countdownGame != 0)
      {
        if(millis() - gameElapsedTime >= 1000)
        {
          textFont(game.getGameFont(48),48);
          text(countdownGame,50,100);
          game.timer = countdownGame;
          countdownGame--;
          gameElapsedTime = millis();
        }
        else
        {
          text(countdownGame,50,100);
        }
      }
      else
      {
        // End of the game goes display the score
        gameState = 3;
      }
      
      // If the time elapsed is equal our trigger get a new target
      if(millis() - targetElapsedTime >= TRIGGER)
      {
        target = lstTargets.get((int)random(0,NBROFPOINTS));
        targetElapsedTime = millis();
      }
      
      if (hit)
      {
        textFont(game.getGameFont(24), 24);
        text("HIT !", 10, 120);
        hit = false;
        score++;
      }
      
      // Calculating the points of the target
      float targetX = target.xPosition;
      float dx = targetX - x;
      x += dx * easing;
      float targetY = target.yPosition;
      float dy = targetY - y;
      y += dy * easing;
      
      // Draw the target
      fill(100);
      noStroke();
      ellipse(x, y, ELLIPSE_RAYON, ELLIPSE_RAYON);
      break;
      
      // SCORE
      case 3:
          background(game.getBackgroundColor());
          text("Score", width/2-105, height/2-100);
          text(score,width/2, height/2);
          text("Click to start...",10,height-10);
      break;
  }
}

void mouseClicked() {
  
  if(gameState == 0 || gameState == 3)
  {
    gameState = 1;
    countdownGame = 20;
    countdownStart = 5;
    score = 0;
  }
  
  // If the dart has hit the target
  if(target.hasBeenHit(mouseX,mouseY))
  {
    hit = true;
  }
}