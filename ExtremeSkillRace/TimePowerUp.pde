class TimePowerUp extends PowerUp
{
  TimePowerUp(PImage image, float posX, float posY)
  {
    super(image,posX,posY); 
    body.setUserData(this);
  }
  
  void applyPowerUp()
  {
    delayedTime += 5; 
  }
}