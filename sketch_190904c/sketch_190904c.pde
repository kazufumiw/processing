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

float seed_phi;
float seed_theta;
float seed_r;


float t = 0;

void setup(){
  size(1500, 1000);
  noLoop();
  background(20);
  stroke(255);
  strokeWeight(1);
  background(0);
  colorMode(HSB, 360, 100, 100);
  
}

void draw(){
  background(0);
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
      /*
      r_noised = r*map(noise(theta*detail, phi*detail), 0 ,1, 0.0, 1.5);
      x = r_noised*sin(theta)*cos(phi);
      y = r_noised*sin(theta)*sin(phi);
      z = r_noised*cos(theta);
      */
      stroke(19*noise(theta, phi), 50, 100, 25);
      point(x + width*0.5, z + height*0.5);
    }
  }
  t += 0.04;

}

void keyPressed(){
  save("work.png");
}
