class Item extends Rock {
  float type;
  
  Item () {
    this.type = round(random(0,3));
    
  }
  
  void rapidFire(Ship ship, ArrayList shots) {
   if (type == 1) {
      Shot shot = new Shot(ship.x, ship.y);
      shots.add(shot);
    } 
  }
}