int SCREENX =400;
int SCREENY = 400;
int PLAYERWIDTH = 40;
int PLAYERHEIGHT=15;
int BULLETWIDTH = 3;
int BULLETHEIGHT = 6;
int MARGIN=10;
int GAP=5;

Alien theAliens[];
PImage normalImg, explodeImg;
void settings(){
 size(SCREENX, SCREENY);
}
void setup(){
  // The images only need to be loaded into memory once 
  normalImg = loadImage("invader.gif");
  
  // Create an empty array of aliens
  theAliens = new Alien[10];
  
  // Create the aliens
  init_aliens(theAliens,normalImg, explodeImg);
}
// Fill in the array with new alien objects
void init_aliens(Alien baddies[], PImage okImg, PImage exImg)
{ 
  for(int i=0; i<baddies.length; i++){
    baddies[i] = new Alien(MARGIN+i*(okImg.width+GAP), MARGIN, okImg, exImg);
  }
}
/* Move and draw the player, the bullet (if it
exists), and the aliens. Check whether the bullet has
collided with any aliens. */
void draw(){
  background(0);
  
  for(int i=0; i<theAliens.length; i++){
  theAliens[i].move();
  theAliens[i].draw();
}
}
