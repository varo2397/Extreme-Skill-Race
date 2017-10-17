import controlP5.*;

boolean inMenu;
Menu menu;
ControlP5 cp5;

void setup()
{
  size(1280, 720);
  inMenu = true;
  menu  = new Menu();
  initControls();
}

void draw()
{
  background(0);
  if (inMenu)
  {
    menu.menuSelection();
  }
}


void initControls()
{
  PFont font = createFont("arial", 40);
  cp5 = new ControlP5(this);
  //width and height for name input
  float playerNameInputX = 500;
  float playerNameInputY = 330;

  //width and height for background selection
  float scene = 450;
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
    .setPosition(500, 550)
    .setSize(inputWidth, inputHeight)
    .setFont(font);

  cp5.get("playerName").hide();
  cp5.get("Ice").hide();
  cp5.get("Mountain").hide();
  cp5.get("Space").hide();
}

public void controlEvent(ControlEvent theEvent) {
}

void Ice(int value)
{
  println("hola");
}