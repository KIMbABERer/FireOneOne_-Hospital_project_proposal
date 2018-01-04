class Bubble{
  
  PVector location;
  PVector acceleration;
  PVector velocity;
  float size;

  Bubble(PVector l) {
     location = l.copy();
     acceleration = new PVector(0,-0.001);
     velocity = new PVector(0,-1);
     size = random(2,8);  
  }
  
  void run() {
     update();
     display();
  }
  
  void update() {
     velocity.add(acceleration);
     location.add(velocity);
  }
  
  void display() {
     colorMode(RGB);
     fill(245,235,196);
     ellipse(location.x, location.y, size,size);
  }
  
  boolean isDead() {
     if(location.y < 0.1) {
        return true;
     } else {
        return false;
     }
  }

}