class Player
{
  float friction;
  int score;
  String name;
  
  
  Car car;
  
  Player(float friction, Car car)
  {
    this.friction = friction;
    this.car = car;
  }
  
  void update()
  {
    
  }
  
  void display()
  {
    //show playerScore
    if(car instanceof Regular)
    {
      Regular c = (Regular)car;
      c.display();
    }
    else if(car instanceof HotRod)
    {
      HotRod c = (HotRod)car;
      c.display();
    }
    else if(car instanceof Classic)
    {
      Classic c = (Classic)car;
      c.display();
    }
  }

  
  //void applyForce(Vec2 force) {
  //  Vec2 pos = body.getWorldCenter();
  //  body.applyForce(force, pos);
  //}
}

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Class to describe a car

//class Car {
//  // Our object is one box and two wheels
//  Box box;
//  Particle wheel1;
//  Particle wheel2;
//  float vel = 0;
//  RevoluteJointDef rjd1;
//  RevoluteJointDef rjd2;

//  Car(float x, float y) {
//    // Initialize position of the box
//    box = new Box(x, y, 100, 30, false);
//    // Initialize position of two wheels
//    wheel1 = new Particle(x-28, y+16, 12);
//    wheel2 = new Particle(x+28, y+16, 12);

//    // Define joints
//    rjd1 = new RevoluteJointDef();
//    rjd1.initialize(box.body, wheel1.body, wheel1.body.getWorldCenter());
//    rjd1.motorSpeed = -PI*2;
//    rjd1.maxMotorTorque = vel;
//    rjd1.enableMotor = true;
//    box2d.world.createJoint(rjd1);

//    rjd2 = new RevoluteJointDef();
//    rjd2.initialize(box.body, wheel2.body, wheel2.body.getWorldCenter());
//    rjd2.motorSpeed = -PI*2;
//    rjd2.maxMotorTorque = vel;
//    rjd2.enableMotor = true;
//    box2d.world.createJoint(rjd2);
//  }

//  void display() {
//    box.display();
//    wheel1.display();
//    wheel2.display();
//  }
  
//  void addVel(){
//    if(vel < 800){
//      vel += 50;
//    }
//    rjd1.enableMotor = false;
//    rjd2.enableMotor = false;
//  }
//}