class meteor
{
  public float x;
  public float y;
  private float dirX;
  private float dirY;
  public int level;


  meteor(float x, float y, float dirX, float dirY)
  {

    this.x = x;
    this.y = y;
    this.dirX = dirX;
    this.dirY = dirY*1.5;  
    this.level = 1;
  } 
  public void drawmeteor()
  {
    shape(meteor, this.x, this.y, 150, 150);
  }
  public void movemeteor()
  {
    this.x += this.dirX + (this.level-1)*this.dirX*0.5;
    this.y += this.dirY*level;
  }   
  public boolean hitTest(alien l)
  {
    if (this.y>=l.y-100 &&  this.y <= l.y &&(this.x>=l.x-150 && this.x<=l.x+200))
    {
      return true;
    }

    return false;
  }
}
