class Fish //'Fish' class
{
  PImage fishUPImage, fishDOWNImage, fishUP2Image, fishDOWN2Image; //fish images
  
  int x; 
  int y;
  int dx;
  boolean visible;
  
  Fish (int x, int y, int dx, boolean visible) //fishes variables
  {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.visible = visible;
    fishUPImage = loadImage ("fishUP.png"); //loads 'fishUPImage' image
    fishUPImage.resize (80, 80); //resizes previous image
    fishDOWNImage = loadImage ("fishDOWN.png"); //loads 'fishDOWN' image
    fishDOWNImage.resize (80, 80); //resizes previous image
    fishUP2Image = loadImage ("fishUP2.png"); //loads 'fishUP2' image
    fishUP2Image.resize (80, 80); //resizes previous image
    fishDOWN2Image = loadImage ("fishDOWN2.png"); //loads 'fishDOWN2' image
    fishDOWN2Image.resize (80, 80); //resizes previous image
  }
  
  void render() //'render' function
  {
    if (visible == true)
    {
      move(); //calls 'move' function
      bounce(); //calls 'bounce' function
      fBoatCollision(); //calls 'fBoatCollision' function
    }
  }

  void move() //'move' function
  {
    x = x + dx; //fishes' x variable equals the x variable plus the fishes' direction x variable
    if (dx > 0) //if fish moving right...
    {
      if ((x >= 0 && x <= 200) || (x >= 401 && x <= 600) || (x >= 801 && x <= 1000) || (x >= 1201 && x <= 1400)) //if fishes' x values are between these numbers...
      image (fishUPImage, x, y); //show fishUPImage
      else if ((x >= 201 && x <= 400) || (x >= 601 && x <= 800) || (x >= 1001 && x <= 1200) || (x >= 1401 && x <= 1600)) //if fishes' x values are between these numbers...
      image (fishDOWNImage, x, y); //show fishDOWN
    }
    
    else if (dx < 0) //if fish moving left...
    {
      if ((x >= 0 && x <= 200) || (x >= 401 && x <= 600) || (x >= 801 && x <= 1000) || (x >= 1201 && x <= 1400)) //if fishes' x values are between these numbers...
      image (fishUP2Image, x, y); //show fishUP2Image
      else if ((x >= 201 && x <= 400) || (x >= 601 && x <= 800) || (x >= 1001 && x <= 1200) || (x >= 1401 && x <= 1600)) //if fishes' x values are between these numbers...
      image (fishDOWN2Image, x, y); //show fishDOWN2Image
    } 
  }

  void bounce() //'bounce' function
  {
    if (x <= 0) //if fishes' x value is greater than or equal to 0...
    {
      dx = abs(fishSpeedX); //direction x equals the absolute value of the 'fishSpeedX' variable
      y = y - fishSpeedY; //y equals y minus the value of the 'fishSpeedY' variable
    }
    
    else if (x >= width - 80) //if fishes' x value is less than or equal to the screen-wdith - 80 (fish image's width)...
    {
      dx = fishSpeedX; //direction x equals the value of the 'fishSpeedX' variable
      y = y - fishSpeedY; //y equals y minus the value of the 'fishSpeedY' variable
    }
  }
  
  void fBoatCollision() //'fBoatCollision' function
  {
    if (y <= F1.y + 150) //if fishes' y value is less than or equal to the 'Fisherman' class' y value plus 150 (Fisherman image's height)...
    livesCounter = 0; //'livesCounter' variable equals 0
  }
  
  boolean hookCollision (Hook H) //'hookCollision' function
  {
  return (abs(this.x + 10 - H.x) < 60 && abs(this.y + 10 - H.y) < 55); //if the hook collides with a fish
  }
}