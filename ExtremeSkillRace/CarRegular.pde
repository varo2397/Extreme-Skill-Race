class Regular extends Car
{
  Regular(float posX, float posY, PImage carBody, PImage tire)
  {
    super();
    
    bodyCar = new BodyCar(posX, posY, 100, 60, false, carBody);
    tire1 = new Tire(posX-26, posY+20, 15, tire);
    tire2 = new Tire(posX+30, posY+20, 15, tire);
    
    makeBody();
  }
  
  void display() {
    bodyCar.display();
    tire1.display();
    tire2.display();
  }
}