float x = 0;
float y = 0;
float rectWidth = 120;
float rectHeight = 120;
float margin = 0;
String s = "1.png";
float h1;
float h2;

color c1;
color c2;


void setup() {
  size(1280, 768);
  noLoop();
  frameRate(1);
  colorMode(HSB, 360, 100, 100);
  background(215, 50, 20);
}

void draw() {
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 5; j++){
      makeRects(0 + 256*j, 0 + 256*i, 256, 256, 8);
    }
  }
  
  
  //gradRect(color(250,40,90), color(300,40,90), 1, 0, 0, 300, 300, false);
  
  loadPixels();
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 5; j++){
      for(float k = i*256; k < 256+i*256; k++){
        for(float l = j*256; l < 256+j*256; l++){
          pixels[int(k*width+l)] += color(0, 0, random(0));
        }
      }      
    }
  }
  updatePixels();
  
}
void makeRects(float posX, float posY, float local_rectWidth, float local_rectHeight, int count){
  if(count != 0){
    print(count);
    //stroke(305, 0,80);
    //strokeWeight(count);
    if(random(1) < 0.5){
      //gradRect(color(230,20,90), color(280,20,90), 1, posX, posY, local_rectWidth, local_rectHeight, false);
      gradRect(color(230,90,20), color(230,90,20), 1, posX, posY, local_rectWidth, local_rectHeight, false);
    }else if(random(1) < 0.5){
      gradRect(color(210,100,90), color(260,100,90), 1, posX, posY, local_rectWidth, local_rectHeight, false);
    }else{
      gradRect(color(300,100,90), color(330,100,90), 1, posX, posY, local_rectWidth, local_rectHeight, false);
    }
     count--;
    
    if(random(1) < 0.5){
      makeRects(posX, posY, local_rectWidth*0.5, local_rectHeight*0.5, count);
    }
    if(random(1) < 0.5){
      makeRects(posX + local_rectWidth*0.5, posY, local_rectWidth*0.5, local_rectHeight*0.5, count);
    }
    if(random(1) < 0.5){
      makeRects(posX, posY + local_rectHeight*0.5, local_rectWidth*0.5, local_rectHeight*0.5, count);
    }
    if(random(1) < 0.5){
      makeRects(posX + local_rectWidth*0.5, posY + local_rectHeight*0.5, local_rectWidth*0.5, local_rectHeight*0.5, count);
    }
  }
}
void gradRect(color c1, color c2, color res, float posX, float posY, float local_rectWidth, float local_rectHeight, boolean randomNoise){
  if(random(1) < 0.5){
    color tmp = c1;
    c1 = c2;
    c2 = tmp;
  }
  noFill();
  //stroke(1);
  rect(posX, posY, local_rectWidth, local_rectHeight);
  if(random(1) < 0.5){
    for(float w = 0; w < local_rectWidth; w += res){
      color c = lerpColor(c1, c2, w / local_rectWidth);
      noStroke();
      fill(c);
      rect(w + posX, 0 + posY, res, local_rectHeight);
    }
  }else{
    for(float w = 0; w < local_rectHeight; w += res){
      color c = lerpColor(c1, c2, w / local_rectHeight);
      noStroke();
      fill(c);
      rect(posX, w + posY, local_rectWidth, res);
    }
  }
  if(randomNoise){
    loadPixels();
    for(float i = posY; i <= local_rectHeight + posY; i++){
      for(float j = posX; j <= local_rectWidth + posX; j++){
        pixels[int(i*width+j)] += color(0, 0, random(10));
      }
    }
    updatePixels();
  }
}
