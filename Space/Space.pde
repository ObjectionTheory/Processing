Ship ship;

ArrayList<Shot> shots = new ArrayList<Shot>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Particle> plist = new ArrayList<Particle>();
int MAX = 10;
int counter = 0;

int score;

boolean running = true;

void setup() {
  size(1920, 1080);
  background(0);
  
  ship = new Ship();
  
  for (int i = 0; i < 100; i++) {
   Rock rock = new Rock();
   rocks.add(rock);
  }
  
  
  
  score = 0;
  
  ship.load();
}

void draw() {
  background(0);
  ship.update();
  
  
  
  
  for (Rock rock : rocks) {
   rock.load();
   rock.move(); 
   float curLife = ship.lives;
      ship.checkDeath(rock);
      
      if(ship.lives < curLife) {
        rock.isOff();
      }
  }
  
  for (int i = plist.size()-1; i >=0; i--) {
    Particle part = plist.get(i);
    if (part.isDestroy) {
      plist.remove(i);
    }
  }
  
  for (int i = shots.size()-1; i >= 0; i--) {
    Shot s = shots.get(i);
    s.move();
    s.render();
    for(int t = rocks.size()-1; t >= 0; t--) {
      Rock rock = rocks.get(t);
      rock.checkDestroyed(s.x, s.y);
      
      
      
      if (rock.isDestroyed) {
         rock.isOff();
         s.toDestroy = true;
         score += rock.points;
         for (MAX = 0; MAX < 10; MAX ++) {
            plist.add(new Particle(s.x, s.y));

            if(plist.size() > 5*MAX) {
            plist.remove(0);
      }
    }
      }
    }
  }
  

  
  textSize(50);
  fill(255);
  text(score,900,50);
  text("Lives: "+ship.lives,10,50);
  
  
  
  if(ship.lives == 0) {
   for (int i = shots.size()-1; i >= 0; i--) {
    shots.remove(i); 
   }
   text("GAME OVER!", width/2-150, height/2);
   plist.clear();
   shots.clear();
   running = false;
   noLoop();
  }
  
  for(int i = 0; i < plist.size(); i++) {
    Particle p = (Particle) plist.get(i); 
    p.run();
    p.update();
  }
  
  for (int i = shots.size()-1; i >= 0; i--) {
   Shot s = shots.get(i);
   if (s.toDestroy) {
     shots.remove(i);
   }
  }
  
    
}
  
void mousePressed() {
    Shot shot = new Shot(ship.x, ship.y);
    shots.add(shot);
    
    
}

void keyPressed() {
   if (key == ' ' && running == false) {
    ship.lives = 3;
    score = 0;
    running = true;
    rocks.clear();
    
    for (int i = 0; i < 100; i++) {
       Rock rock = new Rock();
       rocks.add(rock);
    }
  
    loop(); 
   }
}

  
  
  
  