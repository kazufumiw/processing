float s_1;
float s_2;
float xn = 100;
float x;
float y;
float amp = 100;
float seed_time = 0;


void setup(){
  size(800, 600);
  
  //noLoop();
}

void draw(){
  background(0);
  stroke(200);
  strokeWeight(2);
  for(int i = 0; i <= xn; i++){
    x = width/xn*i;
    y = amp*(noise(i/5.0, seed_time) - 0.5) + amp*0.5;
    point(x, y);
    point(x, amp*0.5 + amp*0.5);
    point(x, -amp*0.5 + amp*0.5);
  }
  
  for(int i = 0; i <= xn; i++){
    x = width/xn*i;
    y = amp*(pow(4*(noise(i/5.0, seed_time) - 0.5), 3)/4) + amp*0.5 + amp;
    point(x, y);
    point(x, amp*0.5 + amp*0.5 + amp);
    point(x, -amp*0.5 + amp*0.5 + amp);
  }
  
  for(int i = 0; i <= xn; i++){
    x = width/xn*i;
    y = amp*(pow(4*(noise(i/5.0, seed_time) - 0.5), 5)/16) + amp*0.5 + 2*amp;
    point(x, y);
    point(x, amp*0.5 + amp*0.5 + 2*amp);
    point(x, -amp*0.5 + amp*0.5 + 2*amp);
  }
    for(int i = 0; i <= xn; i++){
    x = width/xn*i;
    y = amp*(pow(4*(noise(i/5.0, seed_time) - 0.5), 9)/64) + amp*0.5 + 3*amp;
    point(x, y);
    point(x, amp*0.5 + amp*0.5 + 3*amp);
    point(x, -amp*0.5 + amp*0.5 + 3*amp);
  }
  
  seed_time += 0.02;
}
