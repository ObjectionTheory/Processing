class Particle {
  float r = 2;
  PVector pos,speed, begin; 
  ArrayList tail;
  float splash = 5;
  int margin = 2;
  int taillength = 25;
  float startx, starty;
  boolean isDestroy;

  Particle(float tempx, float tempy) {
    startx = tempx + random(-splash,splash);
    starty = tempy + random(-splash,splash);
    startx = constrain(startx,0,width);
    starty = constrain(starty,0,height);
    float xspeed = random(-3,3);
    float yspeed = random(-3,3);

    pos = new PVector(startx,starty);
    speed = new PVector(xspeed,yspeed);
    
    tail = new ArrayList();
  }

  void run() {
    pos.add(speed);

    tail.add(new PVector(pos.x,pos.y,0));
    if(tail.size() > taillength) {
      tail.remove(0);
    }
    
    begin = new PVector(startx, starty);
    
    if(begin.dist(pos)>30) {
      isDestroy = true;
    }
  }

  void update() {
    for (int i = 0; i < tail.size(); i++) {
      PVector tempv = (PVector)tail.get(i);
      noStroke();
      fill(187, 41, 170);
      ellipse(tempv.x,tempv.y,r,r);
    }
  }
}