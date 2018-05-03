
class Rect {
  float r_width = 50;
  float r_length = 450;
  float x, y;
  float differ;
  float speed = random(0, 2);
  float rotation = 0;
  boolean left;
  boolean toDestroy = false;
  float rotation_speed = 0.1;
  
  Rect(float x, float y, float differ, boolean left) {
    this.x = x;
    this.y = y;
    this.differ = differ;
    this.left = left;
  }
  
  void update(float mode) {
   float colour = map (y, 0, height, 255, 0);
   fill(colour);
   //this.y += this.speed;
   if (mode == 0) {
     this.y ++;
     rect(this.x + this.differ, this.y, r_length + differ, r_width, 10);
   }
   else {
     if (left) {
       this.y += rotation;
       pushMatrix();
       translate(0, this.y);
       rotate(radians(rotation));
       rotation += rotation_speed + rotation/50;
       rect(differ, 0, r_length + differ, r_width, 10);
       popMatrix();
       
       if (rotation > 90) {
         toDestroy = true; 
       }
     }
     else {
       this.y += rotation;
       pushMatrix();
       translate(width, this.y);
       rotate(radians(-rotation));
       rotation += rotation_speed + rotation/50;
       rect(-r_length + differ, 0, r_length + differ, r_width, 10);
       popMatrix();
       
       if (rotation > 90) {
         toDestroy = true; 
       }
     }
   }
   
    
  }
  
}