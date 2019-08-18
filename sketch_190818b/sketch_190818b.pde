void setup() {
  size(1280, 768);
  //noLoop();
  frameRate(30);
  colorMode(RGB, 255, 255, 255);
  background(20, 20, 50);
}

void draw() {
  background(240, 240, 240);
  stroke(255);
  blendMode(MULTIPLY);
  noStroke();
  fill(0, 100, 255, 100);
  myEllipse(width/2.0, height/2.0, 200, 6, 0);
  //fill(100, 240, 30, 100);
  //myEllipse(width/2.0, height/2.0, 200, 6, 1000);
  //fill(240, 100, 30, 100);
  //myEllipse(width/2.0, height/2.0, 200, 6, 500);
}


void myEllipse(float posX, float posY, float radius, int pointn, float seed){
  float theta;
  float px;
  float py;
  float r;
  float noiseparam = 100 + random(100);
  
  beginShape();
  for(int i = 0; i < pointn; i++){
    theta = 2*PI/pointn * i;
    r = radius*noise(i*100, i*100, (seed + frameCount)/200.0)*2;
    px = r * cos(theta);
    py = r * sin(theta);
    curveVertex(px + posX, py + posY);
    /*
    if(i == 0 || i == pointn - 1){
      curveVertex(px + posX, py + posY);
    }
    */
  }
  for(int i = 0; i < 3; i++){
    theta = 2*PI/pointn * i;
    r = radius*noise(i*100, i*100, (seed + frameCount)/200.0)*2;
    px = r * cos(theta);
    py = r * sin(theta);
    curveVertex(px + posX, py + posY);
    /*
    if(i == 0 || i == pointn - 1){
      curveVertex(px + posX, py + posY);
    }
    */
  }
  endShape();
}
