class Regular extends Car
{
  Regular(float posX, float posY, PImage carBody, PImage tire)
  {
    super();
    
    w = 109;
    h = 12;
    r = 15;
    w1 = 75;
    h1 = 38;
    
    this.carBody = carBody;
    this.tire = tire;
    
    makeBody(posX,posY);
    body.setUserData(this);
  }
  void makeBody(float posX, float posY)
  {
    BodyDef bd = new BodyDef();
    bd.setType(BodyType.DYNAMIC);
    bd.setPosition(box2d.coordPixelsToWorld(posX, posY));
    //bd.setAngle(PI);
    body = box2d.createBody(bd);

    // crear el rectángulo
    PolygonShape rectangle = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w / 2);
    float box2dH = box2d.scalarPixelsToWorld(h  / 2);
    rectangle.setAsBox(box2dW, box2dH);

    FixtureDef rectangleFixture = new FixtureDef();
    rectangleFixture.setShape(rectangle);
    rectangleFixture.setDensity(1);
    rectangleFixture.setRestitution(0.5);
    rectangleFixture.setFriction(0.2);

    body.createFixture(rectangleFixture);
    
    PolygonShape rectangle1 = new PolygonShape();
    float box2dW1 = box2d.scalarPixelsToWorld((w1) / 2);
    float box2dH1= box2d.scalarPixelsToWorld((h1) / 2);
    rectangle1.setAsBox(box2dW1, box2dH1);

    FixtureDef rectangleFixture1 = new FixtureDef();
    rectangleFixture1.setShape(rectangle1);
    rectangleFixture1.setDensity(1);
    rectangleFixture1.setRestitution(0.5);
    rectangleFixture1.setFriction(0.2);

    body.createFixture(rectangleFixture1);

    // crear primer círculo
    CircleShape circle1 = new CircleShape();
    circle1.setRadius(box2d.scalarPixelsToWorld(r));
    Vec2 offset1 = box2d.vectorPixelsToWorld(-w / 2 - r + 38, 20);
    circle1.m_p.set(offset1.x, offset1.y);

    FixtureDef circle1Fixture = new FixtureDef();
    circle1Fixture.setShape(circle1);
    circle1Fixture.setDensity(1);
    circle1Fixture.setRestitution(0.5);
    circle1Fixture.setFriction(0.2);

    body.createFixture(circle1Fixture);

    // crear segundo círculo
    CircleShape circle2 = new CircleShape();
    circle2.setRadius(box2d.scalarPixelsToWorld(r));
    Vec2 offset2 = box2d.vectorPixelsToWorld(w / 2 - r - 3 , 20);
    circle2.m_p.set(offset2.x, offset2.y);

    FixtureDef circle2Fixture = new FixtureDef();
    circle2Fixture.setShape(circle2);
    circle2Fixture.setDensity(1);
    circle2Fixture.setRestitution(0.5);
    circle2Fixture.setFriction(0.2);

    body.createFixture(circle2Fixture);
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);

    pushMatrix();
    translate(pos.x, pos.y);  
    
    image(carBody,-54,-28,109,53);
    image(tire,-w / 2 - r + 28 , 6, r * 2, r * 2);
    image(tire,w / 2 - r + -21 , 6, r * 2, r * 2);
    
    popMatrix();
  }
}