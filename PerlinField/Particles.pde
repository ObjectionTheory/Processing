class Particle {
  //PVector pos = new PVector(random(width), random(height));
  PVector pos = new PVector(random(width/2-2, width/2+2),random(height/2-2, height/2+2));
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  float maxSpeed = 4;
  
  PVector prevPos = pos.copy();
  
  
  void update() {
   vel.add(acc);
   vel.limit(maxSpeed);
   pos.add(vel);
   acc.mult(0);
  }
  
  void applyForce(PVector force) {
   this.acc.add(force); 
  }
  
  void show() {
    stroke(0, 15);
    //stroke(r, g, b, opacity);
    strokeWeight(0.1);
    
    line(pos.x, pos.y, prevPos.x, prevPos.y);
    //point(pos.x, pos.y);
    updatePrev();
    //point(pos.x, pos.y);
  }
  
  void updatePrev() {
    prevPos.x = pos.x;
    prevPos.y = pos.y;
  }
  
  void edges() {
   if(pos.x > width-0.1) {
     pos.x = 0;
     updatePrev();
   }
   if(pos.x < 0) {
     pos.x = width-0.1;
     updatePrev();
   }
   if(pos.y > height-0.1) {
     pos.y = 0;
     updatePrev();
   }
   if(pos.y < 0) {
     pos.y = height-0.1;
     updatePrev();
   }
  }
  
  void follow(PVector vectors[]) {
    int x = floor(this.pos.x / scl);
    int y = floor(this.pos.y / scl);
    int index = x + y * cols;
    //println(index, pos.x, pos.y, x, y);
    
    PVector force = vectors[index];
    this.applyForce(force);
  }
}