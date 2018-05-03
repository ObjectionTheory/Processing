float unit = 25;

void setup() {
 size(1000, 1000);
 background(255);
  for (int i = 0; i <  width / unit; i ++) {
    for (int j = 0; j < height / unit; j++) {
       
       Rect shape = new Rect(i * unit, j * unit, 10, 10);
       shape.display();
    }
  }
}

void draw() {
  
}