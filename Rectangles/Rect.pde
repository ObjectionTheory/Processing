
class Rect {
 
  float x, y;
  float rWidth = 15;
  float rHeight = 15;
  float xMod, yMod;
  float rotation, speed;
  
 Rect(float x, float y, float xMod, float yMod) {
  this.x = x;
  this.y = y;
  this.xMod = xMod;
  this.yMod = yMod;
  this.rotation = random(0, 360);
  this.speed = random(0, 360);
  this.change();
 }
 
 void display() {
  int x = 0;
  int y = 0;
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  quad(x, y,
       x + rWidth, y + yMod,
       x + rWidth, y + rHeight + yMod,
       x, y + rHeight); 
 }
 
 void change() {
   pushMatrix();
   translate(this.x, this.y);
   rotate(radians(this.rotation));
   this.display();
   popMatrix();
 }
}