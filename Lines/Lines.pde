float unit = 7.5;
float rect_width = 10;
float rect_corner = 15;
float pattern_count = 2.5;
float speed = 0.5;


void setup() {
  size(1000, 1000);
  background(250);
}

float counter = 0;
int toggle = -1;
void draw() {
  
  counter += speed;
  
  background(250, 10);
  for (int i = 0; i < width; i ++) {
    float colorValue = map(i, 0, width, 255, 0);
    fill(colorValue);
   ellipse(i, height/2, rect_width, rect_width); 
  }
  for (int i = 0; i < width / unit; i++) {
    for (int j = 0; j < pattern_count; j++) {
      pushMatrix();
      translate(i * unit + rect_width / 2, width / 2);
      rotate(radians(counter + i*j*j));
      translate(-rect_width/2, -rect_width/2);
      noStroke();
      float colorValue = map(i, 0, width / unit, 255, 0);
      fill(colorValue);
      rect(0, 0, rect_width, i * rect_width * j, rect_corner);
      popMatrix();
    }
  }
}