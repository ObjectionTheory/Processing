

void setup() {
 size(500, 500);
}

int counter = 500;
void draw() {
 //background(0);
 rectMode(CENTER);
 pushMatrix();
 translate(width/2, height/2);
 //rotate(radians(map(mouseX*mouseY, 0, 500*500, 0, 360)));
 rotate(radians(map(counter, 0, 500, 0, 360)));
 rect(0, 0, counter, counter);
 popMatrix();
 
 if (counter > 0) {
  counter--; 
 }
}