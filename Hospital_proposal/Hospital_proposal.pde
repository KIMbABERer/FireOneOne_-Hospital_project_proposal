// Credits
//Seaweed by oggy https://www.openprocessing.org/sketch/154196
//Daniel Shiffman "The Nature Of code"

import processing.serial.*;
import java.util.Iterator;

//bubble,fish ,text
float t = 0.0;
BubbleSystem bs;
FishSystem fs;
PFont font;
TextSystem ts;

//Seaweed number
final int nb = 30;
SeaWeed[] weeds;
PVector rootNoise = new PVector(random(123456), random(123456));

//connect to Arduino
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port

//API connection
String headline;
JSONObject json;
int disappear = 255;

int articlesNum;

void setup() {
  
  size(1280,720);
  bs = new BubbleSystem();
  fs = new FishSystem();
  ts = new TextSystem();
  smooth();
  
  //font for text in middle of the screen
  font = createFont("font.ttf", 32);
  textFont(font);
  
  //Start the seaweed
  weeds = new SeaWeed[nb];
  for (int i = 0; i < nb; i++)
  {
    weeds[i] = new SeaWeed(random(0, width), height);
  }
  
  //setup arduino connection
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  
  
  //New York Times API
  // The URL for the JSON data (replace "imperial" with "metric" for celsius)
  String apiKey = "efd1eeb4ed804181a722728fe068bacf";
  String url    = "http://api.nytimes.com/svc/search/v2/articlesearch.json";
  String query  = "?q=processing&sort=newest";

  // Load the XML document
  json = loadJSONObject(url+query+"&api-key="+apiKey);
  
}


void draw() {
  
  background(11,189,222);
  
  //Back layer seabed
  float xoff = t;
  fill(108,207,192);
  noStroke();
  
  beginShape();
    for (int i = 0; i < width + 1; i++) {
      float y = noise(xoff);
      float z = map(y,0,1,height/1.2,height);
      xoff += 0.0008;
      vertex(i,z);
    }
    
    vertex(width,height);
    vertex(0,height);
  endShape(CLOSE);
  
  //Show bubble
  bs.addBubble(new PVector(random(width), height/1.1));
  bs.run();
  
  //Front layer seabed
  float xxoff = t + 10000;
  fill(155,230,223);
  noStroke();
  
  beginShape();  
    for (int i = 0; i < width + 1; i++) {
      float y = noise(xxoff);
      float z = map(y,0,1,height/1.2,height);
      xxoff += 0.0008;
      vertex(i,z);
    }
    
    vertex(width,height);
    vertex(0,height); 
  endShape(CLOSE);
  
  //seabed noise
  t+= 0.001;
  
  //Add fish to the tank
  fs.addFish(new PVector(random(width), random(0,height/1.1)));
  fs.run();
  
  //Loop and updated all the seaweed
  for (int i = 0; i < nb; i++) {
    weeds[i].update();
  }
   
  //listen to the Arduino sonic sensor then show up the text
  if ( myPort.available() > 0) {  

    val = myPort.readStringUntil('\n');   
    
    if(val != null) {
      if(int(val) < 20){
        ts.addText(new PVector(width/2, height/2));
      }
    }
    
  }
  
  //keep the text fade
  ts.run();
    
}