class Score
{
  private int count;

  Score()
  {
    this.count = 0;
  }

  public void scoreUpdate()    //Print new score
  {
    textAlign(CENTER);
    textSize(30); 
    text("SCORE:"+this.count, 988, 40);   
  }
}
