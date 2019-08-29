int xn = 30;
int pn = 20;
float amp = 600;

float seed_1 = 0;
float seed_2 = 0;
float seed_3 = 10;
float seed_4 = 10;
float seed_5 = 100;
float seed_6 = 100;


float y;
float x;

void setup() {
  size(1600, 800);
  noFill();
  frameRate(30);
  //noLoop(); 
  colorMode(HSB, 360, 100, 100);
  blendMode(ADD);
}
void draw() {
  background(360, 0, 0);
  stroke(0,0,30,50);
  seed_1 = 0;
  seed_3 = 0;
  for(float x = 0; x <= width; x += width/xn){
    //seed += 0.001;
     for(int p = 0; p < pn; p += 1){
       stroke(260*noise(seed_4) + 100*noise(seed_3, seed_4),100,100,70);
       strokeWeight(50*noise(seed_3, seed_4));
       seed_1 += 0.06;
       seed_3 += 0.1;
       y = amp*(noise(seed_1, seed_2) - 0.5) + height*0.5;
       //strokeWeight(10);
       point(x, y);
     }
  }
  
  seed_2 += 0.05;
  seed_4 += 0.05;
  if(frameCount < 300){
    save(String.format("%06d", frameCount) + ".png");
  }
}



void keyPressed(){
  save("work.png");
}
