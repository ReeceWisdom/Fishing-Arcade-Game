class Swordfish //'Swordfish' class
{
  PImage swordfish1Image, swordfish2Image; //swordfish images
  
  float x;
  float y;
  float dx;
  float dy;

  Swordfish (float x, float y, float dx, float dy)  //swordfish variables
  {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    swordfish1Image = loadImage ("swordfish1.png"); //loads 'swordfishImage' image
    swordfish1Image.resize (73, 150); //resizes previous image
    swordfish2Image = loadImage ("swordfish2.png"); //loads 'swordfish2Image' image
    swordfish2Image.resize (73, 150); //resizes previous image
  }
  
  void render() //'render' function
  {
    move(); //calls 'move' function
    spawnSwordfish();  //calls 'spawnSwordfish' function
  }

  void move() //'move' function
  {  
    y = y + dy; //swordfish's y variable equals the y variable plus the swordfish's direction y variable
  }
  
  void spawnSwordfish() //'spawnSwordfish' function
  {
    if ((y <= height && y >= height - 50) || (y <= height - 101 && y >= height - 150) 
    || (y <= height - 201 && y >= height - 250) || (y <= height - 301 && y >= height - 350) 
    || (y <= height - 401 && y >= height - 450) || (y <= height - 501 && y >= height - 550)
    || (y <= height - 601 && y >= height - 650)) //if swordfish's y values are between these numbers...
    {
      image (swordfish1Image, x, y); //show swordfishImage
    }
    else if ((y <= height - 51 && y >= height - 100) || (y <= height - 151 && y >= height - 200) 
    || (y <= height - 251 && y >= height - 300) || (y <= height - 351 && y >= height - 400) 
    || (y <= height - 451 && y >= height - 500) || (y <= height - 551 && y >= height - 600)
    || (y <= height - 651 && y >= height - 700)) //if swordfish's y values are between these numbers...
    {
      image (swordfish2Image, x, y); //show swordfish2Image
    }
    else
    y = y + 600; //swordfish's y value equals the y value plus 600-pixels
  }

  void sBoatCollision() //'sBoatCollision' function
  {
    if (S1.collision() == true) //if the 'collision' function returned true...
    livesCounter = livesCounter - 1; //livesCounter variable equals livesCounter variable minus 1
  }
  
  boolean collision() //'collision' function
  {
    if (fishermanDirection == 1) //if fishermanDirection equals 1...
    {
      if (y <= F1.y + 125) //if the swordfish's y value is less than or equal to the y value from the 'Fisherman' class plus 125 (Fisherman image's height)...
      {
        if ((x + 15 >= F1.x + 15 && x + 15 <= F1.x + 15 + 125) 
        || (x + 15 + 44 >= F1.x + 15 && x + 15 + 44 <= F1.x + 15 + 125)) //if the x-axis of the top-left or top-right corner of the swordfish's hit box is within the x-axis of the Fisherman's hit box when facing right... 
        {
          y = y + 600; //swordfish's y value equals the y value plus 600-pixels
          return true;
      
        }
      }
    }
    else if (fishermanDirection == 0) //if fishermanDirection equals 0...
    {
    if (y <= F1.y + 125) //if the swordfish's y value is less than or equal to the y value from the 'Fisherman' class plus 125 (Fisherman image's height)...
      {
        if ((x + 15 >= F1.x + 35 && x + 15 <= F1.x + 35 + 125)
        || (x + 15 + 44 >= F1.x + 35 && x + 15 + 44 <= F1.x + 35 + 125)) //if the x-axis of the top-left or top-rgith corner of the swordfish's hit box is within the x-axis of the Fisherman's hit box when facing right...
        {
          y = y + 600; //swordfish's y value equals the y value plus 600-pixels
          return true;
        }
      }
    }
    return false;
  }
}