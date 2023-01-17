class star
{
  float x;
  float y;
  float z;



  star()
  {
    this.x = random(-width/2, width/2);
    this.y = random(-height/2, height/2);
    this.z = random(width);
  }


  public void drawstar()
  {
    this.z = this.z - 10;
    if (this.z < 2) {
      this.z = width;
      this.x = random(-width/2, width/2);
      this.y = random(-height/2, height/2);
    }
  }

  public void movestar()
  {

    float sx = map(this.x / this.z, 0, 1, 0, width/2);
    float sy = map(this.y / this.z, 0, 1, 0, height/2);

    float r = map(this.z, 0, width, 150, 0);
    
    shape(star, sx, sy, r, r);

  }
}
