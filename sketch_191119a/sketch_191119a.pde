float r = 200;
float r_noised = 500;
float noiseval;
float noisecol;
float theta_n = 2000;
float phi_n = 2000;
float detail = 0.01;

float x;
float y;
float z;

float seed_phi = 0;
float seed_theta = 100;
float seed_r = 200;
float seed_r_base = 300;
float seed_stroke = 400;
float seed_trans = 500;
float seed_color = 600;
float seed_weight = 700;


float t = 0;
float t_2 = 0;


int nline = 300;
int thickness = 15000;
float theta;
float phi;
float r_base;
float theta_base;
float phi_base;




void setup(){
  size(1200, 800);
  noLoop();
  colorMode(HSB, 360, 100, 100);
  background(290, 20, 30);
  stroke(0, 0, 100, 20);
  strokeWeight(1.5);
  background(0);
  blendMode(ADD);
  //colorMode(HSB, 360, 100, 100);
  
}

void draw(){
  //background(360, 0, 100);
  
  for(int i = 0; i < nline; i++){
    r_base = 0*noise(seed_r_base);
    theta_base = 2*PI*random(1);
    phi_base = 2*PI*random(1);
    for(int j = 0; j < thickness; j++){
      r = r_base + 500*noise(seed_r/1000.0);
      theta = theta_base + PI*noise(seed_theta);
      phi = phi_base + PI*noise(seed_phi)*(sin(theta));
      x = r*sin(theta)*cos(phi);
      y = r*sin(theta)*sin(phi);
      z = r*cos(theta);
      stroke(150 + 159*noise(t), 70, 100, 15*noise(seed_trans));
      strokeWeight(1.0);
      point(x + width*0.5, y + height*0.5);
      seed_r  += 0.005;
      seed_theta  += 0.005;
      seed_phi  += 0.005;
      seed_stroke += 0.005;
      seed_color += 0.005;
      seed_trans += 0.005;
      t += 0.005;
    }
    seed_r_base += 0.1;
  }
  
  
  
  
  
  /*
  for(float theta = 0; theta < PI; theta += 2*PI/theta_n){
    for(float phi = 0; phi < 2*PI; phi += 2*PI/phi_n){
      x = r*sin(theta + 0.1)*cos(phi + 0.1);
      y = r*sin(theta + 0.1)*sin(phi + 0.1);
      z = r*cos(theta + 0.1);
      noiseval = map(noise(x*detail+100, y*detail+100, z*detail+100), 0 ,1, 0.0, PI/2);
      noiseval = 2*pow(sin(noiseval), 8) + 1;
      
      x *= noiseval;
      y *= noiseval;
      z *= noiseval;
      
      r_noised = r*map(noise(theta*detail, phi*detail), 0 ,1, 0.0, 1.5);
      x = r_noised*sin(theta)*cos(phi);
      y = r_noised*sin(theta)*sin(phi);
      z = r_noised*cos(theta);
      
      stroke(19*noise(theta, phi), 50, 100, 25);
      point(x + width*0.5, z + height*0.5);
    }
  }
  t += 0.04;
  */
}

void keyPressed(){
  save("work.png");
}
