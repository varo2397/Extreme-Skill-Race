class Terrain
{
  ArrayList<Vec2> points;
  int index;

  Terrain() {
    points = new ArrayList();
    makeBody();
    index = 0;
  }
  void makeBody() {
    //BodyDef bd = new BodyDef();
    //bd.position.set(0, 0); // la superficie no necesita posición
    //Body body = box2d.createBody(bd); // no es necesario guardar la referencia a body porque nunca se va a mover

    //// Crear lista de puntos en pixeles
    //float offset = random(100);
    //for (float x = 0; x < width; x += 5) {
    //  float y = noise(offset) * 200 + 500 / 3 + x * 0.4;
    //  points.add(new Vec2(x, y));
    //  offset += 0.03;
    //}
    //float lastYPos = points.get(points.size() - 1).y;
    //points.add(new Vec2(width, lastYPos + 100));
    //points.add(new Vec2(0, lastYPos + 100));
    //// Crear lista de puntos en world
    //Vec2[] worldPoints = new Vec2[points.size()];
    //for (int i = 0; i < points.size(); i++) {
    //  worldPoints[i] = box2d.coordPixelsToWorld(points.get(i));
    //}
    //ChainShape chain = new ChainShape();
    //chain.createChain(worldPoints, worldPoints.length);

    //// Se pueden crear fixtures directamente a partir de una forma
    //// El parámetro 1 es la densidad
    //body.createFixture(chain, 1);
    
    BodyDef bd = new BodyDef();
    bd.position.set(0, 0); // la superficie no necesita posición
    Body body = box2d.createBody(bd); // no es necesario guardar la referencia a body porque nunca se va a mover

    // Crear lista de puntos en pixeles
    float offset = random(100);
    for (float x = 0; x < width; x += 5) {
      float y = noise(offset) * 200 + 500 / 3 + x * 0.4;
      
      points.add(new Vec2(x, y));
      offset += 0.03;
    }
  }

  void display() {
    noStroke();
    if (selectecBackground == space)
    {
      fill(#22104D);
    } 
    else if (selectecBackground == mountain)
    {
      fill(#096F25);
    } 
    else if (selectecBackground == ice)
    {
      fill(#F0F8FA);
    }
    beginShape();
    for (int i = 0; i < points.size(); i++) 
    {
      Vec2 p = points.get(i);
      vertex(p.x, p.y);
    }
    
    //for (Vec2 p : points) {
    //  vertex(p.x, p.y);
    //}
    endShape();
  }
}