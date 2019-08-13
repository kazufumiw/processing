float x = 0;
float y = 0;
float rectWidth = 100;
float rectHeight = 100;
float margin = 20;
String s = "1.png";
float h1;
float h2;

color c1;
color c2;


void setup() {
  size(1960, 1240);
  noLoop();
  frameRate(2);
  colorMode(HSB, 360, 100, 100);
  background(215, 50, 20);
}

void draw() {
  loadPixels();
  c1 = color(180, 80, 100);
  c2 = color(289, 80, 100);
  for(float i = margin; i <= height - (100 + margin); i += rectHeight + margin){
    for(float j = margin; j <= width - (100 + margin); j += rectWidth + margin){
      h1 = 210+random(59);
      h2 = h1 + 50;
      s = "14.png";
      if(359 < h2){
        h2= h1-(h2-h1);
      }
      c1 = color(h1, 80, 90);
      c2 = color(h2, 80, 90);
      gradRect(c1, c2, 1, j, i, rectWidth, rectHeight);
    }
  }
  loadPixels();
  for(float i = margin; i <= height - (100 + margin); i += rectHeight + margin){
    for(float j = margin; j <= width - (100 + margin); j += rectWidth + margin){
      h1 = 20 + random(50);
      h2 = h1 + 30;
      if(359 < h2){
        h2= h1-(h2-h1);
      }
      c1 = color(h1, 80, 90);
      c2 = color(h2, 80, 90);
      gradRect(c1, c2, 1, j, i, rectWidth, rectHeight);
      for(float k = i; k <= rectHeight + i; k++){
        for(float l = j; l <= rectWidth + j; l++){
          pixels[int(k*width+l)] += color(0, 0, random(10));
        }
      }
      
    }
    
  }
  
  /*
  for(float i = 0; i < height; i++){
    for(float j = 0; j < width; j++){
      pixels[int(i*width+j)] += color(0, 0, random(5));
    }
  }
  */
  
  updatePixels();
  save(s);
  
}

void gradRect(color c1, color c2, color res, float posX, float posY, float rectWidth, float rectHeight){
  for(float w = 0; w < rectWidth; w += res){
    color c = lerpColor(c1, c2, w / rectWidth);
    noStroke();
    fill(c);
    rect(w + posX, 0 + posY, res, rectHeight);
  }
}
