class Classic extends Car
{
  Classic(float posX, float posY, PImage carBody, PImage tire)
  {
    super();
    
    bodyCar = new BodyCar(posX, posY, 100, 60, false, carBody);
    tire1 = new Tire(posX-25, posY+15, 17, tire);
    tire2 = new Tire(posX+30, posY+15, 17, tire);
    
    makeBody();
  }
  
  void display() {
    bodyCar.display();
    tire1.display();
    tire2.display();
  }
}