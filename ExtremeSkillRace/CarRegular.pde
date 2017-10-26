class Regular extends Car
{
  Regular(float posX, float posY, PImage carBody, PImage tire)
  {
    super();
    
    //w = 109;
    //h = 12;
    //r = 15;
    //w1 = 75;
    //h1 = 38;
    
    //this.carBody = carBody;
    //this.tire = tire;
    
    bodyCar = new BodyCar(posX, posY, 100, 60, false, carBody);
    tire1 = new Tire(posX-26, posY+20, 15, tire);
    tire2 = new Tire(posX+30, posY+20, 15, tire);
    
    makeBody();
    //body.setUserData(this);
  }
  void makeBody()
  {
    RevoluteJointDef rjd1 = new RevoluteJointDef();
    rjd1.initialize(bodyCar.body, tire1.body, tire1.body.getWorldCenter());
    rjd1.motorSpeed = -PI*2;
    rjd1.maxMotorTorque = 300.0;
    rjd1.enableMotor = true;
    box2d.world.createJoint(rjd1);

    RevoluteJointDef rjd2 = new RevoluteJointDef();
    rjd2.initialize(bodyCar.body, tire2.body, tire2.body.getWorldCenter());
    rjd2.motorSpeed = -PI*2;
    rjd2.maxMotorTorque = 300.0;
    rjd2.enableMotor = true;
    box2d.world.createJoint(rjd2);
  }
  
  void display() {
    bodyCar.display();
    tire1.display();
    tire2.display();
  }
}