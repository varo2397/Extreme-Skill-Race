class PowerUpFactory
{
  Random rand ;
  public PowerUpFactory() {
    rand = new Random();
  }

  //public PowerUp makePowerUp(int time)
  //{
  //  int seconds = 1200;
  //  if (time % seconds == 0)
  //  {
  //    float selection = rand.nextInt(2);
  //    float lifesPowerUp = 0;
  //    float ammoPowerUp = 1;
  //    if (selection == lifesPowerUp)
  //    {
  //      return new LifePowerUp();
  //    }
  //    if (selection == ammoPowerUp)
  //    {
  //      return new AmmoPowerUp();
  //    } 
  //    else return null;
  //  } else return null;
  //}
}