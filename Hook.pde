class Hook //'Hook' class
{
  PImage hookImage; //left hook image
  PImage hook2Image; //right hook image
  
  float x;
  float y; 
  
  Hook (float x, float y) //hook variables
  {
    this.x = x;
    this.y = y;
    hookImage = loadImage ("hook1.png"); //loads 'hookImage' image
    hookImage.resize (25, 40); //resizes previous image
    hook2Image = loadImage ("hook2.png"); //loads 'hook2Image' image
    hook2Image.resize (25, 40); //resizes previous image
  }
  
  void render() //'render' function
  {
    fishLine();  //calls 'fishLine' function
    
    if (fishermanDirection == 1)
    {
      image (hookImage, x - 3, y + 57); //load left hook image
    }
    else if (fishermanDirection == 0)
    {
      image (hook2Image, x + 153, y + 57); //load left hook image
    }

    if ((keyPressed == true) && (keyCode == DOWN)) //used keyPressed function instead of method as cannot have duplicate keyPressed methods
    {
      H1.y = H1.y + 10; //move hook down
    }
  }
  
  void fishLine() //'fishLine' function
  {
    if (fishermanDirection == 1) //if fishermanDirection equals 1...
    {
      noStroke(); //remove black outline from ellipse
      fill (128, 80, 44); //make ellipse brown
      ellipse (F1.x, F1.y + 17, 3, 3); //create ellipse
      ellipse (F1.x, H1.y + 60, 3, 3); //create ellipse
      stroke (128, 80, 44); //make line brown
      strokeWeight(1.5); //thickness of line
      line (F1.x, F1.y + 17, F1.x, H1.y + 60); //create line
    }
    else if (fishermanDirection == 0) //if fishermanDirection equals 0...
    {
      noStroke(); //remove black outline from ellipse
      fill (128, 80, 44); //make ellipse brown
      ellipse (F1.x + 175, F1.y + 17, 3, 3); //create ellipse
      ellipse (F1.x + 175, H1.y + 60, 3, 3); //create ellipse
      stroke (128, 80, 44); //make line brown
      strokeWeight(1.5); //thickness of line
      line (F1.x + 175, F1.y + 17, F1.x + 175, H1.y + 60); //create line
    }
  }
}

void keyReleased()  //'keyReleased' function
{
  if (keyCode == DOWN) //if the down key is released...
  {
    while (H1.y != F1.y + 17) //while the hook is not in its original position 
    {
      H1.y = H1.y - 1; //move hook up 1-pixel
    }
  }
}