class MyColor {
  
  float R, G, B, Rspeed, Gspeed, Bspeed;
  final static float minSpeed = 0.2;
  final static float maxSpeed = 0.8;
  final float minG = 180;
  
  MyColor() {
    init();
  }
  
  public void init() {
    R      = random(0, minG);
    G      = random(minG, 255);
    B      = random(0, minG);
    Rspeed = (random(1) > 0.5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Gspeed = (random(1) > 0.5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Bspeed = (random(1) > 0.5 ? 1 : -1) * random(minSpeed, maxSpeed);
  }
  
  public void update() {
    Rspeed = ((R += Rspeed) > minG || (R < 0)) ?    -Rspeed : Rspeed;
    Gspeed = ((G += Gspeed) > 255  || (G < minG)) ? -Gspeed : Gspeed;
    Bspeed = ((B += Bspeed) > minG || (B < 0)) ?    -Bspeed : Bspeed;
  }
  
  public color getColor() {
    return color(R, G, B);
  }
  
}