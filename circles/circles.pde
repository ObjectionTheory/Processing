float r, rIncrease, rRate;
PVector pos;
PVector direction;
float speed;
int pause;

void setup() {
  
  size(500, 500);
  speed = 5;
  r = 50;
  pos = new PVector(width/4, height/4);
  direction = new PVector(speed, 0);
  pause = 250;
  rRate = 7;
  rIncrease = 1;
}

void draw() {
  background(255, 160, 122);
  
  
  //ellipse(pos.x, pos.y, r, r);
  for (int i = 0; i < 16; i++) {
    fill(230, 230, 250);
    noStroke();
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(i * 22.5));
    translate(-width/2, -height/2);
    ellipse(pos.x, pos.y, r, r);
    popMatrix();
  }
  /*
  for (int i = 0; i < 16; i++) {
    fill(255, 228, 225);
    noStroke();
    pushMatrix();
    translate(width / 8, height / 8);
    rotate(radians(i * 22.5));
    translate(-width/8, -height/8);
    ellipse(pos.x, pos.y, r, r);
    popMatrix();
  }
  
  for (int j = 1; j < 5; j+= 2) {
    for (int i = 0; i < 16; i++) {
      fill(255, 228, 225);
      noStroke();
      pushMatrix();
      translate(width / (j+1), height / (j+1));
      rotate(radians(i * 22.5));
      translate(-width/(j+1), -height/(j+1));
      ellipse(pos.x, pos.y, r, r);
      popMatrix();
    }
  }
  */
  
  if (direction.x == speed && direction.y == 0) {
    if (pos.x > width * 3/4) {
      direction.x = 0;
      direction.y = speed;
      rIncrease = -rRate;
    }
  } else if (direction.x == 0 && direction.y == speed) {
    if (pos.y > height * 3/4) {
      direction.x = -speed; 
      direction.y = 0;
      rIncrease = rRate;
    }
  } else if (direction.x == -speed && direction.y == 0) {
    if (pos.x < width / 4) {
       direction.x = 0;
       direction.y = -speed;
       rIncrease = -rRate;
    }
  } else {
    if (pos.y < height / 4) {
       direction.x = speed;
       direction.y = 0;
       rIncrease = rRate;
    }
  }
  
  r += rIncrease;
  pos.add(direction);
    
}