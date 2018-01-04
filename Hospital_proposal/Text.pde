class Text {
  
  PVector location;
  float   size;
  int     life;

  Text(PVector l) {
     location = l.copy();
     size = random(2,8);  
     life = 255;
     headline = json.getJSONObject("response").getJSONArray("docs").getJSONObject(articlesNum).getJSONObject("headline").getString("main");
  }
  
  void run() {
     update();
     display();
  }
  
  void update() {
     
     //fade the text color
     life -= 0.1;
     
  }
  
  void display() {
     colorMode(RGB);
     fill(155,230,223,life);
     textAlign(CENTER);
     rectMode(CENTER);  
     textSize(36);
     text(headline, location.x, location.y,400,400);
  }
  
  boolean isDead() {
    
     // if text no longer visible just remove it from the array
     if(life < 1) {
        return true;
     } else {
        return false;
     }
  }
  
}