void setup() {
  size(1080, 1080);
  noLoop();
}
void draw() {
  background(255);
  blendMode(MULTIPLY);
  stroke(0,0,0,3);
  noFill();
  for(float i = 0.0; i <= 5.0; i = i + 0.001 ){
    myLine(0, height/2 - i*200, width, height/2 , i);
  }
  
  //myLine(0);
  //myLine(1);
  //myLine(2);
  
  /*
  for(float i = 1.0; i <= 5.0; i = i + 1.0 ){
    myEllipse(width/2.0, height/2.0, 200, 6, 0, i);
  }
  
  myEllipse(width/2.0, height/2.0, 200, 6, 0, 1.0);
  myEllipse(width/2.0, height/2.0, 200, 6, 0, 1.1);
  myEllipse(width/2.0, height/2.0, 200, 6, 0, 1.2);
  myEllipse(width/2.0, height/2.0, 200, 6, 0, 1.3);
  myEllipse(width/2.0, height/2.0, 200, 6, 0, 1.4);
  */
}
void myLine(float px1, float py1, float px2, float py2, float seed){
  beginShape();
  curveVertex(0, height/2);
  curveVertex(0, height/2);
  
  for(float i = 0.1; i <= 1.0; i += 0.2){
    curveVertex(px1 + (px2 - px1)*i, py1 + (py2 - py1)*i + 500*noise(i*500, i*500, i/100.0 + seed));
  }
  curveVertex(width, height/2);
  curveVertex(width, height/2);
  endShape();

}

void myEllipse(float posX, float posY, float radius, int pointn, float seed, float size){
  float theta;
  float px;
  float py;
  float r;
  float noiseparam = 100 + random(100);
  
  beginShape();
  for(int i = 0; i < pointn; i++){
    theta = 2*PI/pointn * i;
    r = size*radius*noise(i*100, i*100, (seed + frameCount)/200.0);
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
    r = size*radius*noise(i*100, i*100, (seed + frameCount)/200.0);
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
