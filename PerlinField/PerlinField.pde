float r, g, b;

int counter;
float opacity = 1;

float mag = 0.5;
float inc = 0.05;
int scl = 10;
int cols, rows;
float zoff = 0;

ArrayList<Particle> particles = new ArrayList<Particle>();
PVector[] flowfield;

boolean running = true;

Slidebar s[];

void setup() {
 size(1920,1080);
 background(255);
 
 cols = floor(width/scl);
 rows = floor(height/scl);
 flowfield = new PVector[rows*cols];
 
 
 for (int i = 0; i < 2500; i ++) {  
   Particle p = new Particle();
   particles.add(p);
 }
 
 s = new Slidebar[3];
 for (int i = 0; i < s.length; i++) {
  s[i] = new Slidebar(100, height - (i+1)*scl*5, 800, 40); 
 }
}

void draw() {
  //background(0);
  //println(frameRate);
  float yoff = 0;
  for (int y = 0; y < rows; y++) {
   float xoff = 0;
   for (int x = 0; x < cols; x++) {
     
     PVector v = new PVector(6,6);
     
     float r = noise(xoff, yoff, zoff) * TWO_PI * 4;
     
     v.rotate(r);
     /*
     fill(r);
     stroke(0);
     strokeWeight(1);
     line(x*scl,y*scl,x*scl+v.x,y*scl+v.y);
     */
     v.setMag(mag);
     int index = x + y * cols;
     flowfield[index] = v;
     
     //rect(x * scl, y * scl, scl, scl);
     //point(x*scl,y*scl);
     
     xoff += inc;
   }
   yoff += inc;
   
   zoff += 0.0001;
  }
  
  for (Particle p : particles) {
   p.follow(flowfield);
   p.update();
   p.edges();
   p.show();
   
  }
  /*
  for (Slidebar s : s) {
   s.display();
   s.moveButton();
  }
  g = map(s[0].returnValue(),0,1,255,0);
  b = map(s[1].returnValue(),0,1,255,0);
  r = map(s[2].returnValue(),0,1,255,0);
  
  
  if (counter > 60) {
   r++;
   if (r > 255) {
    g++;
    if (g>255) {
     b++; 
    }
   }
  }
  counter ++;
  */
  
}

void mousePressed() {
  for (Slidebar s : s) {
    if (s.isOver()){
     s.locked = false;
  }
  }
  
}

void mouseReleased() {
  for (Slidebar s : s) {
    s.locked = true; 
  }
 
}

void keyPressed() {
 if (running) {
    noLoop();
    running = false;
  } else {
    loop();
    running = true;
  } 
}