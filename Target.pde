class Target {
  
  // Properties
  int xPosition, yPosition;
  
  Target (int x, int y) 
  {
    this.xPosition = x;
    this.yPosition = y;
  }
  
  void Draw()
  {
    ellipse(this.xPosition, this.yPosition, ELLIPSE_RAYON, ELLIPSE_RAYON);
  }
  
  boolean hit(int xDartPosition, int yDartPosition)
  {
    boolean hit = false;
    
    // Calculate the border of our hitbox
    int leftHitboxBorder = this.xPosition - (ELLIPSE_RAYON / 2);
    int rightHitboxBorder = this.xPosition + (ELLIPSE_RAYON / 2);
    int topHitboxBorder = this.yPosition - (ELLIPSE_RAYON / 2);
    int bottomHitboxBorder = this.yPosition + (ELLIPSE_RAYON / 2);
    
    // Check if the dart has hit our target
    if ((xDartPosition < rightHitboxBorder) && (xDartPosition > leftHitboxBorder))
    {
      if ((yDartPosition < topHitboxBorder) && (yDartPosition > bottomHitboxBorder))
      {
        hit = true;
      }
    }
    
    return hit;
  }
}