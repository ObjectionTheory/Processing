int xSpacing = 0;
int w;

float radius = 180;
float colorShift;
float shiftValue = 0.001;
float amplitude;
float theta = 0.0;
float period = 500.0;
float dx;
float[] yValues;
float rConst = 5;

void setup() {
 size(750, 750); 
 w = width;
 dx = (TWO_PI / period) * xSpacing;
 yValues = new float[250];
 amplitude = width / 4;
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  calcWave();
  renderWave();
  dx += 0.00005;
  popMatrix();
  
  colorShift += shiftValue;
}

void calcWave() {
  theta += 0.005;
  
  float x = theta;
  for (int i = 0; i < yValues.length; i++) {
   yValues[i] = sin(x) * amplitude; 
   x += dx;
  }
}

void renderWave() {
  noStroke();
  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < yValues.length; x++) {
     float angle = 360 * (float(x) / yValues.length); //+ theta * 10;
     //radians will change
     float cx = radius * sin(angle) * yValues[x]/100;
     float cy = radius * cos(angle) * yValues[x]/100;
     float r = yValues[x]/ rConst;
     
     fill(255, 255 / (dist(cx, cy, 0, 0)/amplitude) -25 + colorShift, 255, r * 15) ;
     ellipse(cx, cy , r, r);
     
  }
 
  }
  
}