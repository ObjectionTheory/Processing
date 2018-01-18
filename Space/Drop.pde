
class Drop {
  float x = random(width);
  float y = random(-740, -50);
  float depth = random(0,20);
  float yspeed = map(depth, 0, 20, 2, 15);
  float dlength = map(depth, 0, 20, 10, 30);
 
  
  void fall() {
    y = y + yspeed;
    
    if (y > height) {
      y = random(-200, -100);
      yspeed = map(depth, 0, 20, 2, 10);
    }
  }
  
  void show() {
    float thickness = map(depth, 0, 20, 1, 3);
    strokeWeight(thickness);
    stroke(255);
    line(x,y,x,y+dlength);
  }
  
}
  