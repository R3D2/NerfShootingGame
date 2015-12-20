class Target {
  
  // Properties
  int xPosition, yPosition;
  int leftBorder, topBorder, rightBorder, bottomBorder; // TODO : Replace by tuple if possible...
  
  Target (int x, int y) 
  {
    this.xPosition = x;
    this.yPosition = y;
    this.leftBorder = this.xPosition - (ELLIPSE_RAYON / 2);
    this.rightBorder = this.xPosition + (ELLIPSE_RAYON / 2);
    this.topBorder = this.yPosition - (ELLIPSE_RAYON / 2);
    this.bottomBorder = this.yPosition + (ELLIPSE_RAYON / 2);
  }
 
  void Draw()
  {
    ellipse(this.xPosition, this.yPosition, ELLIPSE_RAYON, ELLIPSE_RAYON);
  }
  
  boolean hasBeenHit(int xDartPosition, int yDartPosition)
  {
    boolean hit = false;
    
    // Check if the dart has hit our target
    if ((xDartPosition < this.rightBorder) && (xDartPosition > this.leftBorder))
    {
      if ((yDartPosition < this.topBorder) && (yDartPosition > this.bottomBorder))
      {
        hit = true;
      }
    }
    
    return hit;
  }
}