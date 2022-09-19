int SCREENX =400;
int SCREENY = 400;
int PLAYERWIDTH = 40;
int PLAYERHEIGHT=15;
int BULLETWIDTH = 3;
int BULLETHEIGHT = 6;
int MARGIN=10;
int GAP=5;

Alien theAliens[];
Player thePlayer;
Bullet theBullet;
PImage normalImg, explodeImg;
void settings(){
 size(SCREENX, SCREENY);
}
void setup(){
// The images only need to be loaded into memoryonce 
normalImg = loadImage("invader.gif");
explodeImg = loadImage("exploding.gif");

// Create an empty array of aliens
theAliens = new Alien[5];
// Create the player
thePlayer = new Player(SCREENY-PLAYERHEIGHT-MARGIN);
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
/* Move and draw the player */
thePlayer.move(mouseX);
thePlayer.draw();
/* if there is a bullet, move it, draw it, and then see if
it has collided with any aliens */
if(theBullet != null){
theBullet.move();
theBullet.collide(theAliens);
theBullet.draw();
}
/* Move and draw the aliens */
for(int i=0; i<theAliens.length; i++){
theAliens[i].move();
theAliens[i].draw();
}
}
// Create a new bullet object on mouse
void mousePressed()
{
theBullet= new Bullet(thePlayer.x()+thePlayer.width()/2, thePlayer.y());
}
