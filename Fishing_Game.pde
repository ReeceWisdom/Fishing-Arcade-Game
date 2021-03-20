Fisherman F1;
Hook H1;
Swordfish S1;
Lives Li1;
Fish fishArray[][];

PImage seaImage; //sea/background image
PFont title; //font style
String gameOver = "G A M E   O V E R"; //game over text
String winner = "Y O U  W I N !"; //winner text
//String sDifficulty1 = "Difficulty:";
//String sDifficulty2 = "'E' = Easy --- 'M' = Medium --- 'H' = Hard";
String instructions1 = "Use the left & right arrow keys to move the Fisherman."; //instructions text
String instructions2 = "Use thedown arrow keys to hook the Fish."; //instructions text
String instructions3 = "Avoid the Swordfish."; //instructions text

int screen; //splash screen variable
int score; //Easy = 800 --- Medium = 1600 --- Hard = 2100 (points to win depending on difficulty level

int fishRows = 2; //number of fish rows rendered
int fishColumns = 8; //number of fish columns rendered
int fishSpeedX = -2; //speed of fish x-axis
int fishSpeedY = 35; //speed of fish y-axis
float swordfishSpeedX = 6.5; //speed of swordfish x-axis
float swordfishSpeedY = -3; //speed of swordfish y-axis

void setup()
{    
  size (1500, 1000); //window size
  frameRate(60); //limits the framrate to 60fps
  
  screen = 1; //sets splash screen variable to 1
  title = loadFont("BradleyHandITC-48.vlw"); //loads the desired font style
  textFont(title); //determining desired font style
  
  seaImage = loadImage ("sea.jpg"); //loads 'sea' image
  seaImage.resize (width, height); //resizes 'sea' image
  
  fishArray = new Fish[100][100]; //maximum allowed fish rows & columns
  
  for (int y = 0; y < fishRows; y++)
  {
    for (int x = 0; x < fishColumns; x++)
    {
      fishArray[x][y] = new Fish((x * 80) + 10, ((height - 80) - (y * 70)), fishSpeedX, true); //create new fish while the x & y values are less than the columns & rows 
    }
  }
  
  F1 = new Fisherman ((width/2) - (175/2), height/4); //create a fisherman
  H1 = new Hook (F1.x, F1.y + 17); //create a hook
  S1 = new Swordfish ((random(F1.x - 150, (F1.x + 125) + 150)), height, swordfishSpeedX, swordfishSpeedY);  //create a swordfish
  Li1 = new Lives (width/12, height/31);  //create a lives bar
}

void draw()
{ 
  image (seaImage, 0, 0); //show seaImage
  
  if (screen == 1) //if screen equals 1...
  {
    textAlign(CENTER); //align text centre
    textSize(120); //set text size 120
    text("Extreme Fishing!", width/2, height/4); //show text (title)
    textSize(50); //set text size 50
    text("Press Any Key to Start", width/2, height/1.5); //show text (start game)
    textSize(25); //set text size 25
    text(instructions1, width/2, height/1.1); //show text (instructions)
    text(instructions2, width/2, height/1.066); //show text (instructions)
    text(instructions3, width/2, height/1.033); //show text (instructions)
    //text(sDifficulty1, width/2, height/1.866); //show text (difficulty settings)
    //text(sDifficulty2, width/2, height/1.766); //show text (difficulty settings)
    
    //if (keyPressed == true && ((key == 'E') || (key == 'e')))
    //{
    // fishRows = 1;
    // fishColumns = 8;
    // fishSpeedX = -2;
    // fishSpeedY = 15;
    // swordfishSpeedY = -1;
    //}
    //else if (keyPressed == true && ((key == 'M') || (key == 'm')))
    //{
    // fishRows = 2;
    // fishColumns = 7;
    // fishSpeedX = -3;
    // fishSpeedY = 20;
    // swordfishSpeedY = -2;
    //}
    //else if (keyPressed == true && ((key == 'H') || (key == 'h')))
    //{
    //  fishRows = 3;
    //  fishColumns = 7;
    //  fishSpeedX = -4;
    //  fishSpeedY = 25;
    //  swordfishSpeedY = -3;
    //}
  }
  
  if (keyPressed == true) //if a key is pressed...
  screen = 0; //sets splash screen variable to 0
  
  if (screen == 0) //if screen equals 0...
  {
    fill(255, 255, 255); //set font colour to white
    textSize(35); //set text size 120
    text("Score: " + (score), width - width/15, height/13); //show score
    
    for (int y = 0; y < fishRows; y++)
    {
      for (int x = 0; x < fishColumns; x++)
      {
        fishArray[x][y].render(); //render created fish while the x & y values are less than the columns & rows
      }
    }
    
    F1.render(); //calls 'render' function in 'Fisherman' class
    H1.render(); //calls 'render' function in 'Hook' class
    S1.render(); //calls 'render' function in 'Sworfish' class
    Li1.render(); //calls 'render' function in 'Lives' class
    collisions(); //calls 'collisions' function in main 'Fishing_Game' class
    gameOver(); //calls 'gameOver' function in main 'Fishing_Game' class
  }
}

void collisions() //'collisions' function
{
  S1.sBoatCollision(); //calls 'sBoatCollision' function in 'Sworfish' class
  
  for (int y = 0; y < fishRows; y++) //repeats (loops) the statement while the y value is less than the number of rows
  {
    for (int x = 0; x < fishColumns; x++) //repeats (loops) the statement while the x value is less than the number of columns
    {
      if (fishArray[x][y] != null && fishArray[x][y].hookCollision(H1)) //if there are fish on the screen & the 'hookCollision' function returns true...
      {
        H1.y = F1.y + 17; //reset hook to original position
        fishArray[x][y].visible = false; //make hooked fish invisible
        fishArray[x][y].x = fishArray[x][y].x + 100000; //move hooked fish off-screen 
        score = score + 100; //add 100 to current score
      }
    }
  }
}

void gameOver() //'gameOver' function
{
  if (livesCounter == 0) //if 'livesCounter' equals 0...
  {
    noLoop(); //stop 'draw' function
    background(0, 0, 0); //set background to black
    fill(255,0,0); //set font colour to red
    textSize(100); //set text size 100
    textAlign(CENTER); //aligns text centre
    text(gameOver, width/2, height/2); //show text (gameOver)
  }
  if (score == 1600) //if 'score' equals 1600 (all fish are hooked)...
  {
    noLoop(); //stop 'draw' function
    background(0, 0, 0); //set background to black
    fill(255,0,0); //set font colour to red
    textSize(100); //set text size 100
    textAlign(CENTER); //aligns text centre
    text(winner, width/2, height/2); //show text (winner)
  }
}