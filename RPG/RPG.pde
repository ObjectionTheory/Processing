
PImage sprite;
int w;
int counter;
int delay = 0, ddir=1;
int dir;
Character main;

void setup() {
   size(800,600);
   sprite = loadImage("MainSheet.png");
   counter = 0;
   w = 193;
   dir = 0;
   main = new Character();
   main.stand(dir);
   frameRate(60);
}

void draw() {
  background(51);
  delay ++;
  if (delay % 20 == 0) {
   if (counter >= 2 || counter <= 0) {
    ddir = ddir * -1;
   }
   counter += ddir;
  }
  println(ddir); 
  main.counter = counter;
  main.move();
  
  if (main.up != true && main.down != true && main.left != true && main.right != true) {
   main.stand(dir); 
  }
  
  
  
}


void keyPressed() {
    switch(keyCode) {
      case UP:
        main.up = true;
        break;
      case DOWN:
        main.down = true;    
        break;
      case LEFT:
        main.left = true;
        break;
      case RIGHT:
        main.right = true;
        break;
    }
  }
  
 void keyReleased() {
  switch(keyCode) {
    case UP:
      main.up = false;
      dir = 1;
      break;
    case DOWN:
      main.down = false;
      dir = 0;
      break;
    case LEFT:
      main.left = false;
      dir = 2;
      break;
    case RIGHT:
      main.right = false;
      dir = 3;
      break;
  }
  
}
  