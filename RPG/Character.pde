class Character {
  int x = 0, y = 0, speed = 2, step = 0, counter=0;
  PImage[] sprites;
  boolean left, right, up, down;
  
  Character() {
    sprites = new PImage[14];
    castImages();
    
  }
  
  void castImages() {
    int imgx, imgy, step = 0, w = 191;
    PImage temp = loadImage("MainSheet.png");
    
    for (int i = 0; i < sprites.length; i++) {
      
      imgx = (step % 4) * w;
      imgy = (step / 4) * w;
    
      sprites[i] = temp.get(imgx, imgy, w, w);
      step = step + 1;
    }
  }
  
  void animate(PImage[] images, int start, int i) {
    i = i + start;
    image(images[i], x, y);
  }
  
  void stand(int dir) {
    if (dir == 0) {
      image(sprites[0], x, y);
    }
    else if (dir == 1) {
      image(sprites[4], x, y); 
    }
    else if (dir == 2) {
      image(sprites[9], x, y);
    }
    else if (dir == 3) {
      image(sprites[12], x, y);
    }
    
  }
  
  void move() {
   
   if (up) {
     y -= speed;
     animate(sprites, 5, counter);
    
     
   }
   if (down) {
     y += speed;
     animate(sprites, 1, counter);
    
   }
   if (left) {
     x -= speed;
     animate(sprites, 8, counter);
    
    
   }
   if (right) {
     x += speed;
     animate(sprites, 11, counter);
    
     
   }
   
 }
 
 
  
 
  
  
}