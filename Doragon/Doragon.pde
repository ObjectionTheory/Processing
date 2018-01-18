import Turtle.*;

//String step = "R";
String current;
Turtle pen = new Turtle(this);

void setup() {
  size(1920, 1080);
  background(255);
  stroke(150, 105, 150);
  
  pen.penUp();
  pen.goToPoint(width/2, height/2);
  pen.penDown();
  
  current = "R";
  
  frameRate(1080);
}

void draw() {
  current = next(current);
}

String next(String prev) {
  String first = prev + "R";

  String reversed = new StringBuilder(prev).reverse().toString();

  String second = "";

  for (int i = 0; i < reversed.length(); i++) {
    String temp = String.valueOf(reversed.charAt(i));
    if (temp.equals("R")) {
      second += "L";
    } else {
      second += "R";
    }
  }

  load(second);

  String total = first + second;

  return total;
}

void load(String steps) {
  for (int i = 0; i < steps.length(); i++) {
    String temp = String.valueOf(steps.charAt(i));
    if (temp.equals("R")) {
      pen.right(90); 
      pen.forward(1);
    } else {
      pen.left(90);
      pen.forward(1);
    }
  }
}