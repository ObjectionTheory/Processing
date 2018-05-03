float r_width = 50;
float r_length = 450;
float step = 200;

ArrayList<Rect> rects = new ArrayList<Rect>();

void setup() {
 size (1000, 1000);
 
 /*
 for (int i = 0; i < 10; i++) {
  Rect rect = new Rect(0, i * step + counter);
  rect.update();
 }
 
 for (int i = 0; i < 10; i++) {
  Rect rect = new Rect(width - r_length, i * step - r_width + counter); 
  rect.update();
 }
 */
}

int counter = 0;

void draw() {
  background (255);
  noStroke();
  
  if (counter % step == 0) {
    Rect rect = new Rect(0, -r_width - 50, -10, true);
    rects.add(rect);
  }
  
  if ((counter + r_width) % step == 0) {
    Rect rect = new Rect(width - r_length, -r_width, +10, false);
    rects.add(rect);
  }
  
  for (int i = rects.size()-1; i >= 0; i--) {
    Rect tempRect = rects.get(i);
    
    
    
    if (tempRect.y > height + 10 || tempRect.rotation > 90) {
       rects.remove(i); 
    }
    
    if (tempRect.y > height - 400) {
      tempRect.update(1);
    }
    else {
     tempRect.update(0); 
    }
  }
 
 
 counter ++;
 
 
}