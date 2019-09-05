float x;
float y;
float t = 0;
PImage img;

void setup(){
  size(500, 500);
  background(0);
  colorMode(ADD);
  //noLoop();
  img = loadImage("data/light.png");
  imageMode(CENTER);
}
void draw(){
  /*
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      x = i - width*0.5;
      y = j - height*0.5;
      x *= 0.03;
      y *= 0.03;
      strokeWeight(2);
      stroke(255*exp(-(x*x + y*y)/2));
      point(i+t, j+t);
    }
  }
  t += 1;
  */
  
  image(img, mouseX, mouseY);
  
}

void mousePressed(){
  image(img, mouseX, mouseY);
}
void keyPressed(){
  save("asd.png");
}
