int livesCounter = 3; //global variable

class Lives //'Lives' class
{
  PImage lives3Image, lives2Image, lives1Image, lives0Image; //lives images
  
  float x;
  float y;
  String lives = "Lives:";

  Lives (float x, float y) //lives variables
  {
    this.x = x;
    this.y = y;
    lives3Image = loadImage ("3hearts.png"); //loads 'lives3Image' image
    lives3Image.resize (247, 61); //resizes previous image
    lives2Image = loadImage ("2hearts.png"); //loads 'lives2Image' image
    lives2Image.resize (247, 61); //resizes previous image
    lives1Image = loadImage ("1hearts.png"); //loads 'lives1Image' image
    lives1Image.resize (247, 61); //resizes previous image
    lives0Image = loadImage ("0hearts.png"); //loads 'lives0Image' image
    lives0Image.resize (247, 61); //resizes previous image
  }
   
  void render() //'render' function
  {
    fill(255, 255, 255); //set font colour to white
    textSize(35); //set text size 35
    text(lives, width/20, height/13); //show lives text
    
    if (livesCounter == 3) //if the number of lives/hearts equals 3...
    image (lives3Image, x, y); //show lives3Image
    else if (livesCounter == 2) //if the number of lives/hearts equals 2...
    image (lives2Image, x, y); //show lives3Image
    else if (livesCounter == 1) //if the number of lives/hearts equals 1...
    image (lives1Image, x, y); //show lives3Image
    else if (livesCounter == 0) //if the number of lives/hearts equals 0...
    image (lives0Image, x, y); //show lives3Image
  }
}