
class Terrain {
  ArrayList<Vec2> points;
  float offset,offset2;
  float posX,posY;
  ChainShape chain;
  Body body;
  Fixture fixture;

  Terrain() {
    points = new ArrayList();
    
    offset = random(100);
    for (float x = 0; x < width; x += 3) {
      float y = 200+(noise(offset+10) * 250 + height / 3  * 0.2);
      points.add(new Vec2(x, y));
      offset += 0.01;
      posX=x;
     
    }
   
    offset2=offset;
    float lastYPos = points.get(points.size() - 1).y;
    points.add(new Vec2(width, lastYPos + 500));
    points.add(new Vec2(0, lastYPos + 500));
    
    makeBody();
  }
  void makeBody() {
    BodyDef bd = new BodyDef();
    bd.position.set(0, 0); 
    body = box2d.createBody(bd);
    
    // Crear lista de puntos en world
    Vec2[] worldPoints = new Vec2[points.size()];
    for (int i = 0; i < points.size(); i++) {
      worldPoints[i] = box2d.coordPixelsToWorld(points.get(i));
    }
    chain = new ChainShape();
    chain.createChain(worldPoints, worldPoints.length);
    
    fixture = body.createFixture(chain, 1);
  }
  void display() {
    noStroke();
    fill(255);
    beginShape();
    for (Vec2 p : points) {
      vertex(p.x, p.y);
    }
    endShape();
  }
  
  void createMorePoints(){

    points.remove(0);
    posX+=2;
    offset2 += 0.1;
    float y = 200+((noise(offset2+10)) * 250 + height / 3  * 0.2);
   
     if(offset2 + 0.1 < offset ){
       offset=random(100);
       offset2=offset;
     }
   
     points.remove(points.size()-1);
     points.remove(points.size()-1);
   
     points.add(new Vec2(posX, y));
     
     float lastYPos = points.get(points.size() - 1).y;
     points.add(new Vec2(width, lastYPos + 500));
     points.add(new Vec2(0, lastYPos + 500));
     
     // println(posX, y);
     
   for(int i =0 ;i< points.size();i++){
     points.get(i).x=points.get(i).x-20;
   }  
   
  body.destroyFixture(fixture);
  makeBody();
    
  }
  
}