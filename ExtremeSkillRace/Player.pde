class Player
{
  float friction;
  Body body;
  
  Player(float friction)
  {
    this.friction = friction;
  }
  
  void applyForce(Vec2 force) {
    Vec2 pos = body.getWorldCenter();
    body.applyForce(force, pos);
  }
}