ArrayList<PVector> ps;

void setup(){
  size(800, 1200,P2D);
  pixelDensity(displayDensity());
  colorMode(HSB, 360, 100, 100);
  blendMode(ADD);
  background(250,100,0);
  stroke(0,100,100, 20);
  ps = new ArrayList<PVector>();
  for(int i = 0; i < 1200; i++){
    /*
    ps.add(new PVector(800.0, i));
    ps.add(new PVector(800.0, i));
    ps.add(new PVector(800.0, i));
    ps.add(new PVector(800.0, i));
    ps.add(new PVector(800.0, i));
    ps.add(new PVector(800.0, i));
    ps.add(new PVector(800.0, i));
    */
    for(int pset_num = 0; pset_num < 5; pset_num++){
      ps.add(new PVector(i, 0.0));
    }
    for(int pset_num = 0; pset_num < 5; pset_num++){
      ps.add(new PVector(i, 1.0));
    }
    /*
    ps.add(new PVector(i*10, 0.0));
    ps.add(new PVector(i*10, 0.0));
    ps.add(new PVector(i*10, 0.0));
    ps.add(new PVector(i*10, 0.0));
    ps.add(new PVector(i*10, 0.0));
    ps.add(new PVector(i*10, 0.0));
    ps.add(new PVector(i*10, 0.0));
    ps.add(new PVector(i*10, 0.0));
    */
  }
}

void draw(){
  //background(250,100,20);
  for(int i=0;i<ps.size();i++){
    point(ps.get(i).x, ps.get(i).y);
    stroke(280, 0, 50);
    PVector vel = new PVector(0.0, 0.0);
    vel.add(uniformFlowFunction(0.0, 1.0));
    vel.add(columnFunction(400.0, 400.0, ps.get(i)));
    vel.sub(columnFunction(200.0, 300.0, ps.get(i)));
    vel.add(columnFunction(100.0, 500.0, ps.get(i)));
    vel.add(columnFunction(530.0, 100.0, ps.get(i)));
    vel.add(columnFunction(700.0, 100.0, ps.get(i)));
    vel.sub(columnFunction(400.0, 500.0, ps.get(i)));
    vel.add(columnFunction(200.0, 200.0, ps.get(i)));
    vel.add(columnFunction(130.0, 300.0, ps.get(i)));
    vel.add(columnFunction(600.0, 700.0, ps.get(i)));
    vel.add(columnFunction(300.0, 300.0, ps.get(i)));
    vel.add(columnFunction(350.0, 550.0, ps.get(i)));
    vel.add(columnFunction(600.0, 200.0, ps.get(i)));
    vel.add(columnFunction(700.0, 200.0, ps.get(i)));
    vel.add(columnFunction(300.0, 500.0, ps.get(i)));
    vel.add(columnFunction(550.0, 650.0, ps.get(i)));
    vel.add(columnFunction(330.0, 600.0, ps.get(i)));
    vel.add(columnFunction(600.0, 400.0, ps.get(i)));
    vel.add(columnFunction(450.0, 1050.0, ps.get(i)));
    vel.add(columnFunction(200.0, 800.0, ps.get(i)));
    vel.add(columnFunction(700.0, 1100.0, ps.get(i)));
    vel.add(columnFunction(500.0, 900.0, ps.get(i)));
    vel.add(columnFunction(150.0, 750.0, ps.get(i)));
    vel.add(columnFunction(630.0, 900.0, ps.get(i)));
    vel.add(columnFunction(380.0, 50.0, ps.get(i)));
    vel.add(columnFunction(30.0, 70.0, ps.get(i)));
    ps.get(i).x += vel.x;
    ps.get(i).y += vel.y;
    
  }
}

PVector columnFunction(float x0, float y0, PVector p) {
  float ux = -150.0*(pow((p.x - x0), 2) - pow((p.y - y0), 2))/pow(pow((p.x - x0), 2) + pow((p.y - y0), 2), 2);
  float uy = -5000.0 * (2*(p.x - x0)*(p.y - y0))/pow(pow((p.x - x0), 2) + pow((p.y - y0), 2), 2);
  PVector vel = new PVector(ux, uy);
  return vel;
}

PVector uniformFlowFunction(float magx, float magy) {
  float ux = magx;
  float uy = magy;
  PVector vel = new PVector(ux, uy);
  return vel;
}
