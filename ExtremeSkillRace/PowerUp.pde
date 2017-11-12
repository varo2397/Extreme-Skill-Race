class PowerUp
{
  float side;
  PImage image;
  boolean active;
  
  Body body;
  
  PowerUp(PImage image, float posX, float posY)
  {
    this.image = image;
    active = true;
    side = 20;
    makeBody(posX, posY);
    //body.setUserData(this);
  }
  
  void makeBody(float posX, float posY)
  {
    BodyDef bd = new BodyDef();
    bd.setType(BodyType.KINEMATIC);
    bd.setPosition(box2d.coordPixelsToWorld(posX,posY));
    //bd.setAngle(random(PI));
    bd.fixedRotation = true;
    body = box2d.createBody(bd);
    
    //square for the shape 
    PolygonShape rectangle = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(side / 2);
    rectangle.setAsBox(box2dW, box2dW);

    FixtureDef rectangleFixture = new FixtureDef();
    rectangleFixture.setShape(rectangle);
    rectangleFixture.setDensity(1);
    rectangleFixture.setRestitution(0.5);
    rectangleFixture.setFriction(0.1);

    body.createFixture(rectangleFixture);
    body.setLinearVelocity(new Vec2(-10,0));
  }
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    //rotate(-angle);
    //rect(0, 0, side, side);
    image(image,0,0,50,50);
    popMatrix();
  }
  
  void applyPowerUp(){}  
  
}