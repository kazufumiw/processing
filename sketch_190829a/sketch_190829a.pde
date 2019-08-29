int xn = 30;
int yn = 20;
float pointscale = 100;
float resolution = 40;

float seed_1 = 0;
float seed_2 = 0;
float seed_3 = 0;
float seed_4 = 10;
float seed_5 = 100;
float seed_6 = 100;
float noiseval;

void setup() {
  size(900, 600);
  noFill();
  frameRate(30);
  //noLoop(); 
  colorMode(HSB, 360, 100, 100);
  //blendMode(ADD);
}
void draw() {
  background(230, 90, 20);
  stroke(0,0,30,50);
  seed_1 = 0;
  seed_2 = 0;
  for(int j = 0; j <= xn; j++){
    seed_1 = j;
     for(int i = 0; i < yn; i++){
       seed_2 = i;
       noiseval = noise(seed_1/resolution, seed_2/resolution, seed_3);
       stroke(150+70*pow(noiseval, 1),100,100);
       //strokeWeight(pointscale*mapWeight(pow(noiseval, 4)));
       strokeWeight(pointscale*pow(noiseval, 4));
       //y = amp*(noise(seed_1, seed_2) - 0.5) + height*0.5;
       point(width/xn*j, height/yn*i);
     }
  }
  
  for(int j = 0; j <= xn; j++){
    seed_1 = j+800;
     for(int i = 0; i < yn; i++){
       seed_2 = i+800;
       noiseval = noise(seed_1/resolution, seed_2/resolution, seed_3);
       stroke(130+70*pow(noiseval, 1),100,100);
       //strokeWeight(pointscale*mapWeight(pow(noiseval, 4)));
       strokeWeight(pointscale*pow(noiseval, 4));
       //y = amp*(noise(seed_1, seed_2) - 0.5) + height*0.5;
       point(width/xn*j+5, height/yn*i+5);
     }
  }
  for(int j = 0; j <= xn; j++){
    seed_1 = j+1600;
     for(int i = 0; i < yn; i++){
       seed_2 = i+1600;
       noiseval = noise(seed_1/resolution, seed_2/resolution, seed_3);
       stroke(100+70*pow(noiseval, 1),100,100);
       //strokeWeight(pointscale*mapWeight(pow(noiseval, 4)));
       strokeWeight(pointscale*pow(noiseval, 4));
       //y = amp*(noise(seed_1, seed_2) - 0.5) + height*0.5;
       point(width/xn*j-5, height/yn*i-5);
     }
  }
  
  for(int j = 0; j <= xn; j++){
    seed_1 = j+2400;
     for(int i = 0; i < yn; i++){
       seed_2 = i+2400;
       noiseval = noise(seed_1/resolution, seed_2/resolution, seed_3);
       stroke(180+70*pow(noiseval, 1),100,100);
       strokeWeight(pointscale*pow(noiseval, 4));
       //strokeWeight(pointscale*mapWeight(pow(noiseval, 4)));
       //y = amp*(noise(seed_1, seed_2) - 0.5) + height*0.5;
       point(width/xn*j-5, height/yn*i+5);
     }
  }
  
  seed_3 += 0.02;
  
  
  if(frameCount < 300){
    save(String.format("%06d", frameCount) + ".png");
  }
  
  
}

float mapWeight(float x){
  if(x < 0.1){
    return 0.0;
  }else if(x < 0.2){
    return 0.1;
  }else if(x < 0.3){
    return 0.2;
  }else if(x < 0.4){
    return 0.3;
  }else if(x < 0.5){
    return 0.4;
  }else if(x < 0.6){
    return 0.5;
  }else if(x < 0.7){
    return 0.6;
  }else if(x < 0.8){
    return 0.7;
  }else if(x < 0.9){
    return 0.8;
  }else{
    return 0.9;
  }
}
void keyPressed(){
  save("work.png");
}
