PVector linea, lineb;
float x, y;

void setup() {
  size(500,500);
  linea = new PVector(0,50);
  lineb = new PVector(-50,50);
  x = width/2;
  y = height/2;
}

void draw() {
  strokeWeight(20);
  line(x, y, x + linea.x, y + linea.y);
  linea.sub(new PVector(0, -1));
}