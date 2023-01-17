
class alien 
{
  private float x;
  private float y;
  private float dirX;

  alien() 
  {
    this.x = 100;
    this.y = 750;
    this.dirX = 15;
  }


  public void drawalien()
  {
    shape(alien, this.x, this.y, 200, 200);
  }

  public void moving()
  {
    if (keyPressed)
    {
      if (key == CODED)
      {
        if ((keyCode == RIGHT) && (this.x<=1740))
        {
          this.x += dirX;
        } else if (key == CODED)
        {
          if ((keyCode == LEFT) && (this.x>5))
          {
            this.x -= dirX;
          }
        }
      }
    }
  }
}
