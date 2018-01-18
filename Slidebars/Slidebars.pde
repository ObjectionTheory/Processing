//A thing for slidebars.


 Slidebar s;

void setup() {
  size(1000,1000);
  s = new Slidebar(50,50,200,50);
}

void draw() {
  background(51);
  s.display();  
  s.moveButton();
  println(s.returnValue());
}

void mousePressed() {
  if (s.isOver()){
     s.locked = false;
  }
}

void mouseReleased() {
 s.locked = true; 
}