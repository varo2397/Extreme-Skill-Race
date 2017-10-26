class Car
{
  Body body;
  BodyCar bodyCar;
  Tire tire1;
  Tire tire2;
  RevoluteJointDef rjd1;
  RevoluteJointDef rjd2;
  float w, h, r,w1,h1;
  PImage carBody;
  PImage tire;
  
  Car(){}
  
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
  
  //void addVel(){
  //  rjd1.isLimitEnabled();
  //}
}