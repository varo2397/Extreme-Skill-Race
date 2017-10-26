class SpeedPowerUp extends PowerUp
{
  SpeedPowerUp(PImage image, float posX, float posY)
  {
    super(image,posX,posY); 
    body.setUserData(this);
  }
  
  //void applyPowerUp(Player player)
  //{
  //  Vec2 force = new Vec2(10,0);
  //}
}