class Game {
  
  // Properties
  int backgroundColor;
  int targetColor;
  int timer;
  
  Game()
  {
    this.backgroundColor = 10;
    this.targetColor = 54;
  }
  
  int getTargetColor()
  {
    return this.targetColor;
  }
  
  int getTimer()
  {
    return this.timer;
  }
  
  int getBackgroundColor()
  {
    return this.backgroundColor;
  }
  
  PFont getGameFont(int size)
  {
    switch(size)
    {
      case 24:
        return loadFont("game_gui_24.vlw");
      case 48:
        return loadFont("game_gui_48.vlw");
      default:
        return loadFont("game_gui_48.vlw");
    }
  }
}