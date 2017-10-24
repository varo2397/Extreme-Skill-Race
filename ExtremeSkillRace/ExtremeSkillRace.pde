import controlP5.*;

import java.util.Iterator;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.contacts.*;
import java.util.Random;


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

Box2DProcessing box2d;
Menu menu;
ControlP5 cp5;
Terrain terrain;

void setup()
{
  initBox2D();
  loadImages();
  initControls();

  size(1280, 720);
  inMenu = true;
  inGame = false;
  background = false;
  startTime = true;
  friction = 0.1;
  menu  = new Menu();   
  terrain = new Terrain();
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
  terrain.display();
  showTime();
  showPlayerName();
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
  } 
  else
  {
    int elapsed = millis() - initialTime - delayedTime;; 
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
    .setText("")
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

  cp5.get("playerName").hide();
  cp5.get("Ice").hide();
  cp5.get("Mountain").hide();
  cp5.get("Space").hide();
  cp5.get("Next").hide();
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
    inMenu = false;
    inGame = true;

    cp5.get("Ice").hide();
    cp5.get("Mountain").hide();
    cp5.get("Space").hide();
    cp5.get("Next").hide();
  }
}