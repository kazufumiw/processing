


PFont hello;

void setup(){
  size(1200, 1200);
  noLoop();
  //colorMode(HSB, 360, 100, 100);
  background(0, 0, 0);
  stroke(0, 0, 100, 20);
  strokeWeight(1.0);
  blendMode(ADD);
  hello = loadFont("DFWaWaTC-W5-48.vlw"); 
}

void draw(){
  textFont(hello, 300);
  textAlign(CENTER);
  textSize(300);
  /*
  loadPixels();
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      float gs = map(noise(x/200.0, y/200.0),0,1,0,255);
      pixels[y*width+x] = color(gs);
    }
  }
  
  updatePixels();
  */
  fill(50, 140, 255);
  text("neon", width*0.5, height*0.5);
  filter(BLUR, 100);
  text("neon", width*0.5, height*0.5);
  filter(BLUR, 100);
  text("neon", width*0.5, height*0.5);
  filter(BLUR, 100);
  
  text("neon", width*0.5, height*0.5);
  filter(BLUR, 10);
  text("neon", width*0.5, height*0.5);
  filter(BLUR, 5);
  text("neon", width*0.5, height*0.5);
  filter(BLUR, 4);
  text("neon", width*0.5, height*0.5);
  filter(BLUR, 3);
  text("neon", width*0.5, height*0.5);
  filter(BLUR, 2);
  text("neon", width*0.5, height*0.5);
  filter(BLUR, 1);
  
  //filter(BLUR, 6);
  filter(DILATE);
  
  fill(255, 255, 255);
  text("neon", width*0.5, height*0.5);
  //filter(BLUR, 6);
  
  /*
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      color c = pixels[x + y*width];
    }
  }
  */
  
}
  
