
Drop[] drops = new Drop[700];

void setup() {
  size(1920, 1080);
  for (int i= 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
}

void draw() {
  background(230, 230, 250);
  for (int i = 0; i < drops.length; i++) {
    drops[i].show();
    drops[i].fall();
  }
}