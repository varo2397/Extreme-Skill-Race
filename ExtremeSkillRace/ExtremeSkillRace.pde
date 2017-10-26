import controlP5.*;

import java.util.Iterator;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.Joint;

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.contacts.*;
import java.util.Random;

import org.jbox2d.dynamics.joints.*;

boolean inMenu;
boolean inGame;
boolean background;
boolean startTime;

int initialTime;
int delayedTime;

float friction;

PImage space;
PImage mountain;
PImage ice;
PImage selectecBackground;

PImage speedPowerUp;
PImage gasolinePowerUp;
PImage timePowerUp;

PImage car1Whole;
PImage car1Body;

PImage car2Whole;
PImage car2Body;

PImage car3Whole;
PImage car3Body;

PImage tire;

PImage selectedCar;

Box2DProcessing box2d;
Menu menu;
ControlP5 cp5;
Terrain terrain;
Player player;

void setup()
{
  background(0);

  initBox2D();
  loadImages();
  initControls();

  inMenu = true;
  inGame = false;
  background = false;
  startTime = true;
  friction = 0.1;
  menu  = new Menu();   
  terrain = new Terrain();

  size(1280, 720);
}

void draw()
{
  //drawing the background according to the user selection
  if (!background)
  {
    background(0);
  } else
  {
    image(selectecBackground, 0, 0);
  }

  //when the user is selecting everything
  if (inMenu)
  {
    menu.menuSelection();
  } else if (inGame)
  {
    game();
  }
}

void game()
{
  box2d.step();
  terrain.display();
  showTime();
  showPlayerName();
  player.display();
}

void showPlayerName()
{
  textSize(50);
  textAlign(CENTER);
  text(menu.playerName, width / 2, 50);
}

void showTime()
{
  if (startTime)
  {
    initialTime = millis();
    startTime = false;
  } else
  {
    int elapsed = millis() - initialTime - delayedTime;
    ; 
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text(elapsed / 1000, width / 2, 120);
  }
}

void beginContact(Contact cp)
{
  // Get both shapes
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  //if (o1.getClass() == Player.class && o2.getClass() == SpeedPowerUp.class) {
  //  Player p = (Player)o1;
  //  SpeedPowerUp s = (SpeedPowerUp) o2;
  //  s.applyPowerUp(p);
  //}
}

void endContact(Contact cp) {
}

void initControls()
{
  PFont font = createFont("arial", 40);
  cp5 = new ControlP5(this);
  //x and y coordinates for name input
  float playerNameInputX = 500;
  float playerNameInputY = 330;

  //x and y coordinates for background selection
  float scene = 250;
  float iceX = 100;
  float mountainX = 500;
  float spaceX = 920;

  //y coordinates for car selection
  float vehicle = 450;

  //width and height for all inputs
  int inputWidth = 300;
  int inputHeight = 70;

  cp5.addTextfield("playerName")
    .setPosition(playerNameInputX, playerNameInputY)
    .setSize(inputWidth, inputHeight)
    .setColorBackground(0)
    .setFont(font)
    .setAutoClear(false)
    .setFocus(false)
    .setAutoClear(false);

  cp5.addButton("Ice")
    .setPosition(iceX, scene)
    .setSize(inputWidth, inputHeight)
    .setFont(font);

  cp5.addButton("Mountain")
    .setPosition(mountainX, scene)
    .setSize(inputWidth, inputHeight)
    .setFont(font);

  cp5.addButton("Space")
    .setPosition(spaceX, scene)
    .setSize(inputWidth, inputHeight)
    .setFont(font);

  cp5.addButton("Next")
    .setPosition(500, 375)
    .setSize(inputWidth, inputHeight)
    .setFont(font);

  cp5.addButton("Play")
    .setPosition(500, 550)
    .setSize(inputWidth, inputHeight)
    .setFont(font);

  cp5.addButton("Regular")
    .setPosition(iceX, vehicle)
    .setSize(inputWidth, inputHeight)
    .setFont(font);

  cp5.addButton("HotRod")
    .setPosition(mountainX, vehicle)
    .setSize(inputWidth, inputHeight)
    .setFont(font);

  cp5.addButton("Classic")
    .setPosition(spaceX, vehicle)
    .setSize(inputWidth, inputHeight)
    .setFont(font);


  cp5.get("playerName").hide();
  cp5.get("Ice").hide();
  cp5.get("Mountain").hide();
  cp5.get("Space").hide();
  cp5.get("Next").hide();
  cp5.get("Play").hide();
  cp5.get("Regular").hide();
  cp5.get("HotRod").hide();
  cp5.get("Classic").hide();
}

void initBox2D() 
{
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
}

void loadImages()
{
  space = loadImage("space.jpg");
  mountain = loadImage("mountain.jpg");
  ice = loadImage("ice.jpg");

  speedPowerUp = loadImage("speed.png");
  timePowerUp = loadImage("time.png");
  //add the gasoline power up image

  car1Whole = loadImage("carro1.png");
  car2Whole = loadImage("carro2.png");
  car3Whole = loadImage("carro3.png");

  car1Body = loadImage("carroceria1.png");
  car2Body = loadImage("carroceria2.png");
  car3Body = loadImage("carroceria3.png");

  tire = loadImage("rueda.png");
}

//functions for buttons
void Space()
{
  background = true;
  selectecBackground = space;
  box2d.setGravity(0, -4);
}

void Mountain()
{
  background = true;
  selectecBackground = mountain;
}

void Ice()
{
  background = true;
  selectecBackground = ice;
  friction = 2;
}

void Next()
{
  if (selectecBackground != null)
  {
    menu.selectCar = true;
    menu.selectScene = false;

    cp5.get("Ice").hide();
    cp5.get("Mountain").hide();
    cp5.get("Space").hide();
    cp5.get("Next").hide();
  }
}

void Regular()
{
  selectedCar = car1Whole;
}

void HotRod()
{
  selectedCar = car2Whole;
}

void Classic()
{
  selectedCar = car3Whole;
}

void Play()
{
  if (selectedCar != null)
  {
    inGame = true;
    inMenu = false;

    Car car;
    if (selectedCar == car1Whole) { car = new Regular(100, 100, car1Body, tire); } 
    else if (selectedCar == car2Whole) { car = new HotRod(100, 100, car2Body, tire); } 
    else if (selectedCar == car3Whole) { car = new Classic(100, 100, car3Body, tire); } 
    else { car = new Car(); }

    player = new Player(friction, car);

    cp5.get("Regular").hide();
    cp5.get("HotRod").hide();
    cp5.get("Classic").hide();
    cp5.get("Play").hide();
  }
}

void keyPressed(){
  if(key=='w'){
    //car.
    terrain.createMorePoints();
  }
} 