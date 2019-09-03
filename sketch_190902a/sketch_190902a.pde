int xn = 30*100;
int yn = 20*100;
float pointscale = 10;
float resolution = 500;

float seed_1 = 0;
float seed_2 = 0;
float seed_3 = 0;
float seed_4 = 50;
float seed_5 = 50;
float seed_6 = 100;
float seed_7 = 100;

float noiseval;
float movenoise_x;
float movenoise_y;



void setup() {
  size(1200, 800);
  noFill();
  frameRate(30);
  noLoop(); 
  colorMode(HSB, 360, 100, 100);
  //blendMode(ADD);
}
void draw() {
  background(230, 90 ,20);
  stroke(0,0,30,50);
  seed_1 = 0;
  seed_2 = 0;
  seed_4 = 50;
  seed_5 = 50;
  seed_6 = 100;
  seed_7 = 100;
  
  for(int j = 0; j <= xn; j++){
    seed_1 = j;
    seed_4 = j + 50;
    seed_6 = j + 100;
    
     for(int i = 0; i < yn; i++){
       seed_2 = i;
       seed_5 = i + 50;
       seed_7 = i + 100;
       noiseval = noise(seed_1/resolution, seed_2/resolution, seed_3);
       movenoise_x = noise(seed_4/resolution, seed_5/resolution, seed_3);
       //movenoise_y = noise(seed_6/resolution, seed_7/resolution, seed_3);
       stroke(0+10*(pow(noiseval, 1)), 100, 100, 20);
       strokeWeight(pointscale*(pow(noiseval, 4)));
       point(width*0.1 + width*0.8/xn*j + 300*pow(movenoise_x, 4), height*0.1 + height*0.8/yn*i + 300*pow(noiseval, 4));
       
     }
  }
  
  seed_3 += 0.02;
  
  /*
  if(frameCount < 300){
    save(String.format("%06d", frameCount) + ".png");
  }
  */
  
  
}

void keyPressed(){
  save("work.png");
}
