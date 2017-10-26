class Menu 
{
  String playerName;
  String gameName = "Extreme Skill Race";
  boolean startMenu;
  boolean inputNameMenu;
  boolean selectScene;
  boolean selectCar;
  
  Menu()
  {
    startMenu = true;
    inputNameMenu = false;
    selectScene = false;
    selectCar = false;
  }
  
  void menuSelection()
  {
    if(startMenu)
    {
      displayStartMenu();
    }
    else if(inputNameMenu)
    {
      displayPlayerInputMenu();
    }
    else if(selectScene)
    {
      displaySelectSceneMenu();
    }    
    else if(selectCar)
    {
      displaySelectCarMenu();
    }
    
  }
  
  void displayStartMenu()
  {
    //Game name
    PVector gameNamePosition = new PVector(width / 2,(height * 2) / 10);
    textSize(140);
    textAlign(CENTER);
    fill(255);
    text(gameName,gameNamePosition.x,gameNamePosition.y);  
    
    //Start instruction
    boolean animationInterval = frameCount % 1.5 != 0;
    if(animationInterval)
    {
      delay(700);
      String start = "Press enter to begin";
      PVector startPosition = new PVector(width / 2,height / 2 - 100);
      fill(255);
      textSize(50);
      text(start,startPosition.x,startPosition.y); 
    }    
    //showTopScores();
    //Start game
    if(key == ENTER)
    {
      startMenu = false;
      inputNameMenu = true;
    }
  }
  
  void displayPlayerInputMenu()
  {
    String inputInstruction = "Enter your name";
    float inputInstructionX = width / 2;
    float inputInstructionY = height * 0.4;
    textSize(60);
    textAlign(CENTER);
    text(inputInstruction,inputInstructionX, inputInstructionY);
    
    cp5.get("playerName").show();
    playerName = cp5.get(Textfield.class, "playerName").getText();
    
    if(key == ENTER && keyPressed && !playerName.isEmpty())
    {
      inputNameMenu = false;
      selectScene = true;
      cp5.get("playerName").hide();
    }
  }
  
  void displaySelectSceneMenu()
  {
    String inputInstruction = "Select background";
    float inputInstructionX = 640;
    float inputInstructionY = 188;
    textSize(60);
    textAlign(CENTER);
    text(inputInstruction,inputInstructionX, inputInstructionY);
    
    cp5.get("Ice").show();
    cp5.get("Space").show();
    cp5.get("Mountain").show();
    cp5.get("Next").show();
  }
  
  void displaySelectCarMenu()
  {
    String inputInstruction = "Select Car";
    float inputInstructionX = 640;
    float inputInstructionY = 188;
    textSize(60);
    textAlign(CENTER);
    text(inputInstruction,inputInstructionX, inputInstructionY);
    
    if(selectedCar != null)
    {
      image(selectedCar,525,225,250,200);
    }
    
    cp5.get("Play").show();
    cp5.get("Classic").show();
    cp5.get("HotRod").show();
    cp5.get("Regular").show();
  }
}