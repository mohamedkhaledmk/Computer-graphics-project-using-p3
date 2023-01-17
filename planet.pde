class planet
{
  private float x;
  private float y;
  private float dirX;
  private float dirY;
  public int level;


  planet(float x, float y, float dirX, float dirY)
  {

    this.x = x;
    this.y = y;
    this.dirX = dirX;
    this.dirY = dirY*1.5;  
    this.level = 1;
  }


  public void drawplanet()
  {
    shape(planet, this.x, this.y, 258, 150);
  }

  public void moveplanet()
  {
    this.x += this.dirX + (this.level-1)*this.dirX*0.5;
    this.y += this.dirY*level;
  }   
  public boolean hitTest(alien l)
  {
    if (this.y>=l.y-100 && (this.x>=l.x-150 && this.x<=l.x+150))
    {
      return true;
    }

    return false;
  }
}
