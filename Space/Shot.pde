class Shot {
  float x, y;
  boolean toDestroy;
  
  Shot(float x, float y) {
    this.x = x;
    this.y = y;
    this.toDestroy = false;
  }
  void render() {
    stroke(187, 41, 170);   
    line(x, y, x, y-25); 
  }
  
  void move() {
   y -= 10;
   if (this.y < 0) {
     this.toDestroy = true;
  }
  
 }
}