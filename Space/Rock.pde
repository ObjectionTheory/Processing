class Rock {
 float x,y,d, speed, points, type, colored;

 boolean fall, isDestroyed;
 
 Rock() {
   this.x = random(0, width);
   this.y = random(-1000, 0);
   this.d = random(20,70);
   this.type = random(0,100);
   
   if (round(this.type) == 1) {
     this.speed = 25;
     this.colored = 250;
     this.points = 2500;
   }else{
     this.speed = 5;
     this.colored = 51;
     this.points = 10 * round(map(this.d, 20, 70, 10, 1));
   }
   this.fall = false;
   this.isDestroyed = false;
   
 }
 
 
 void load() {
   fill(this.colored);
   noStroke();
   ellipse(this.x,this.y,this.d,this.d);
 }
 
 void move() {
   this.y += this.speed;
   if (this.y > height) {
    fall = true;
    this.isOff();
   }
 }
 
 void checkDestroyed(float x, float y) {
   float dis = dist(this.x, this.y, x, y);
   if (dis < this.d) {
    this.isDestroyed = true;
    
   }
 }
 
 void isOff() {
   this.x = random(0, width);
   this.y = random(-1000, 0);
   this.d = random(20,70);
   this.fall = false;
   this.isDestroyed = false;
 
 }
 
}