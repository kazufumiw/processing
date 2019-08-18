float DETAIL = 200; //  noise()の連続性の具合
float counter = 0;
//color c1 = color(10, 86, 194);
//color c2 = color(187, 41, 187);
color c1 = color(0, 0, 0);
color c2 = color(0, 255, 255);

//color c2 = color(0, 0, 0);

void setup(){
  size(400, 400);
  colorMode(RGB, 255, 255, 255);
}
 
void draw(){
  background(255);
  loadPixels();
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      float d = noise(x / DETAIL, y / DETAIL, counter / DETAIL) * 255;
      d = d * d / 255;
      int id = x + y * height;
      pixels[id] = color(red(c1) + (red(c2) - red(c1))/255.0*d, green(c1) + (green(c2) - green(c1))/255.0*d, blue(c1) + (blue(c2) - blue(c1))/255.0*d);
    }
  }
  updatePixels();
  counter += 1.0;
}
