int fishermanDirection; //global variable

class Fisherman //'Fisherman' class
{
  PImage fishermanImage; //fisherman left image
  PImage fisherman2Image; //fisherman right image
  
  int x;
  int y;
  
  Fisherman (int x, int y) //fisherman variables
  {
    this.x = x;
    this.y = y;
    fishermanImage = loadImage ("fisherman.png"); //loads 'fishermanImage' image
    fishermanImage.resize (175, 175); //resizes previous image
    fisherman2Image = loadImage ("fisherman2.png"); //loads 'fisherman2Image' image
    fisherman2Image.resize (175, 175); //resizes previous image
   }

  void render() //'render' function
  {
    if (keyCode == LEFT) //if left key is pressed...
    {
      image (fishermanImage, x, y); //show fishermanImage
      fishermanDirection = 1; //set variable to 1
    }
    else if (keyCode == RIGHT) //if right key is pressed...
    {   
      image (fisherman2Image, x, y); //show fishermanImage
      fishermanDirection = 0; //set variable to 0
    }
    
    if (fishermanDirection == 1) //if variable = 1 (facing left)...
    image (fishermanImage, x, y); //load left fisherman image
    else if (fishermanDirection == 0) //if variable = 0 (facing right)...
    image (fisherman2Image, x, y); //load left fisherman image
  }
}

void keyPressed() //'keyPressed' function
{
  if (keyCode == LEFT && F1.x >= 21) //if left key pressed...
  {
    F1.x = F1.x - 10; //move fisherman left 10-pixels
    H1.x = H1.x - 10; //move hook left 10-pixels
    S1.x = S1.x - swordfishSpeedX; //swordfish follows the Fisherman's direction
    
  }
  else if (keyCode == RIGHT && F1.x <= width - 200) //if right key pressed...
  {
    F1.x = F1.x + 10; //move fisherman right 10-pixels
    H1.x = H1.x + 10; //move hook right 10-pixels
    S1.x = S1.x + swordfishSpeedX; //swordfish follows the Fisherman's direction
  }
}