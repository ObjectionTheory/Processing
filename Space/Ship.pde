class Ship {
  
  PShape ship = loadShape("Dartship.svg");
  
  float x;
  float y;
  float easing = 0.1;
  
  int lives = 3;
  
  
  void load() {
    
    ship.disableStyle(); 
    strokeWeight(10);
    stroke(255);
    fill(138,43,226);
    shapeMode(CENTER);
    
    shape(ship, width/2, 800, 100, 100);
  }
  
  void update() {
    
    float targetX = mouseX;
    float targetY = mouseY;
    float dx = targetX - x;
    float dy = targetY - y;
    x += dx * easing;
    y += dy * easing;
    stroke(255);
    fill(138,43,226);
    shape(ship, x, y, 100, 100);
  }
  
  void checkDeath(Rock rock) {
    float dis = dist(this.x, this.y, rock.x, rock.y);
    if (dis < rock.d) {
      lives -= 1;
    
   }
  }
 
}