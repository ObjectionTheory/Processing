class Slidebar {
  PVector button, bar; //stores the x and y of the button and the bar as a vector
  float w, h; //floats for the width and height of the bar
  boolean locked; //whether the button can move or not
  
  Slidebar(float x, float y, float w, float h) {
    //initialise values
    this.bar = new PVector(x,y);
    this.button = new PVector(x+w/20,y+h/2);
    this.locked = true;
    this.w = w;
    this.h = h;
  }
  
  void display() {
   //loads the entire bar
   fill(255);
   rect(bar.x, bar.y, w, h);
   this.drawButton();
  }
  
  void drawButton() {
    
    fill(200);
    rectMode(CENTER);
    rect(button.x, button.y, w/10, h);
    rectMode(CORNER);
  }
  
  void moveButton() {
     if (!this.locked) {
       this.button.x = mouseX;
       this.button.x = constrain(this.button.x, bar.x+this.w/20, bar.x + w * 19/20);
     }
  }
  
  boolean isOver()
  {
    //checks if the mouse is within the button
    return (mouseX > this.button.x - this.w/20) && (mouseX < this.button.x + this.w/20) && (mouseY > this.button.y-this.h/2) && (mouseY < this.button.y + this.h/2);
  }
  
  float returnValue() {
    float value = (this.button.x - w/20 - this.bar.x) / (this.w - 2*(this.w/20));
    return value;
  }
}