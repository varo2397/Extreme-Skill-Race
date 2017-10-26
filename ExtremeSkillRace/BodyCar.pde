class BodyCar {

  Body body;
  float w;
  float h;
  PImage img;

  BodyCar(float x, float y, float w, float h, boolean lock, PImage carBody) {
    this.w = w;
    this.h = h;
    img = carBody;
    
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(new Vec2(x,y)));
    if (lock) bd.type = BodyType.STATIC;
    else bd.type = BodyType.DYNAMIC;

    body = box2d.createBody(bd);

    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/4);
    sd.setAsBox(box2dW, box2dH);

    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.1;
    fd.restitution = 0.5;

    body.createFixture(fd);

    body.setLinearVelocity(new Vec2(0,0));
    body.setAngularVelocity(0);
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    rectMode(PConstants.CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    imageMode(CENTER);
    image(img, 0, 0, 100, 60);
    imageMode(CORNER);
    popMatrix();
  }
}