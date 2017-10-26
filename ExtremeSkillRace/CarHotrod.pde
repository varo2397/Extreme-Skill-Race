class HotRod extends Car
{
  HotRod(float posX, float posY, PImage carBody, PImage tire)
  {
    super();
    
    bodyCar = new BodyCar(posX, posY, 100, 60, false, carBody);
    tire1 = new Tire(posX-20, posY+15, 15, tire);
    tire2 = new Tire(posX+35, posY+15, 15, tire);
    
    makeBody();
  }
  
  void display() {
    bodyCar.display();
    tire1.display();
    tire2.display();
  }
}