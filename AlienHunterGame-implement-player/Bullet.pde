class Bullet {
int width, height, x, y;
color bulletColor = color (200, 0, 200);
Bullet(int xpos, int ypos){
x=xpos;
y=ypos;
width=BULLETWIDTH;
height=BULLETHEIGHT;
}
int x(){
return x;
}
int y(){
return y;
}
void move(){
y-=2;
}
void draw(){
fill(bulletColor);
rect(x, y, width, height);
}
// Simple collision method, can be improved as discussed in
void collide(Alien theBaddies[])
{
for(int i=0; i<theBaddies.length; i++){
if(x > theBaddies[i].x() && x < theBaddies[i].x()+theBaddies[i].width() && y > theBaddies[i].y() && y < theBaddies[i].y()+theBaddies[i].height())
{ 
theBaddies[i].die();
return;
}
}
}
}
