class Fish {
  
  PVector location;
  PVector acceleration;
  PVector randomVal;
  PVector velocity;
  float   size;
  float   randomCounter;
  
  Fish(PVector l) {
     location = l.copy();
     velocity = new PVector(0,0);
     size = random(18,38);  
     randomCounter = 101;
  }
  
  void run() {
    
    update();
    display();
    
    randomCounter++;
    
  }
  
  void update() { 
    
    if(randomCounter > 50) {
      acceleration = new PVector(random(-1,1),random(-0.5,0.5));
      randomCounter = 0;
    }
    
     //velocity.add(acceleration);
     location.add(acceleration);
  }
  
  void display() {
    
    //body
    
     colorMode(RGB);
     fill(179,228,117);
     
     ellipse(location.x, location.y, size,size);
     
     //tail
     
     float tailX = 0;
     float tailY = 0;
     
     if(acceleration.x > 0) {
       tailX = location.x - (size/2 * acceleration.x * 1);
     } else if(acceleration.x <= 0) {
       tailX = location.x + (size/2 * acceleration.x * -1);
     }
     
     if(acceleration.y > 0) {
       tailY = location.y - (size/2 * acceleration.y * 1);
     } else if(acceleration.y <= 0) {
       tailY = location.y + (size/2 * acceleration.y * -1);
     }
     
     ellipse(tailX, tailY, size/1.5,size/1.5);
     
     //eye
     
     fill(11,189,222);
     
     float eyeX = 0;
     float eyeY = 0;
     
     if(acceleration.x > 0) {
       eyeX = location.x + (size/2 * acceleration.x * 0.5);
     } else if(acceleration.x <= 0) {
       eyeX = location.x - (size/2 * acceleration.x * -0.5);
     }
     
     if(acceleration.y > 0) {
       eyeY = location.y + (size/2 * acceleration.y * 0.5);
     } else if(acceleration.y <= 0) {
       eyeY = location.y - (size/2 * acceleration.y * -0.5);
     }
     
     ellipse(eyeX, eyeY, size/5,size/5);
     
     
     
     
  }
  
  boolean isDead() {
     if(location.y < 0 || location.y > height/1.1 || location.x < 0 || location.x > width) {
        return true;
     } else {
        return false;
     }
  }
  
}