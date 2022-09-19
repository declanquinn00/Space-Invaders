int ALIEN_ALIVE=0;
int ALIEN_DEAD=6;
int FORWARD=0;
int BACKWARD=1;
class Alien {
  int x, y, direction;
  int status; // is alien alive, exploding or dead?
  PImage normalImg, explodeImg;
  // Create a new alien object, at given x,y position
  // using pre-loaded images passed as arguments
  Alien (int xpos, int ypos, PImage okImg, PImage exImg){ 
    x = xpos;
    y = ypos;
    status = ALIEN_ALIVE; // start out alive
    normalImg=okImg;
    explodeImg=exImg;
    direction=FORWARD;
  }
  // Move the alien forwards andbackwards 
  void move(){
    if(direction==FORWARD){
      if(x+normalImg.width<SCREENX-MARGIN-1)
        x++;
      else{ direction=BACKWARD;
        y+=normalImg.height+GAP;
        }
      }
    else if(x>MARGIN+1) x--; 
    else {
      direction=FORWARD;
      y+=normalImg.height+GAP;
    }
  }
  // Draw the alien
  // If it is exploding, move it a bit further towards
  // being dead
  void draw(){
    if(status==ALIEN_ALIVE) // it&apos;salive 
      image(normalImg, x, y);
    else if(status!=ALIEN_DEAD){ // it&apos;sexploding 
      image(explodeImg, x, y);
      status++; // doesn&apos;t explode forever, eventually becomes dead
    }
    // otherwise dead, don&apos;t draw anything and don&apos;t change status
  }
  int x(){
    return x;
  }
  int y(){
    return y;
  }
  int width(){
    return normalImg.width;
  }
  int height(){
    return normalImg.height;
  }
  // start the alien exploding 
  void die(){
    if(status==ALIEN_ALIVE)
      status++;
  }
}
