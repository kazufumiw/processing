float pn = 1000;
float fn = 10;


class PhysicalPoint{
 float posx;
 float posy;
 float velx;
 float vely;
 float accx;
 float accy;
 float mass;
 float forcex;
 float forcey;
 
 PhysicalPoint(float _posx, float _posy, float _velx, float _vely, float _accx, float _accy, float _mass){
   posx = _posx;
   posy = _posy;
   velx = _velx;
   vely = _vely;
   accx = _accx;
   accy = _accy;
   mass = _mass;
   forcex = 0;
   forcey = 0;
   
 }
 void setForce(float _forcex, float _forcey){
   forcex += _forcex;
   forcey += _forcey;
 }
 
 void updateAcc(){  
   accx = forcex;
   accy = forcey;
 }
 void updateVel(){  
   velx += accx;
   vely += accy;
 }
 void updatePos(){
   posx += velx;
   posy += vely;
 }
}

class PhysicalField{
 float posx;
 float posy;
 float force;
 float forcex;
 float forcey;
 PhysicalField(float _posx, float _posy){
   posx = _posx;
   posy = _posy;
 }
 void force(PhysicalPoint _p, float _powparam, boolean ispull){
   force = 1/pow(dist(posx, posy, _p.posx, _p.posy), _powparam);
   if(ispull){
     force = -force;
   }
   forcex = force*((_p.posx - posx)/dist(posx, posy, _p.posx, _p.posy));
   forcey = force*((_p.posy - posy)/dist(posx, posy, _p.posx, _p.posy)); 
 }
}

PhysicalPoint p1 = new PhysicalPoint(470, 0, 0, 0.5, 0.0, 0.0, 1);
PhysicalField f1 = new PhysicalField(500, 500);

ArrayList<PhysicalPoint> ps;
ArrayList<PhysicalField> fs;


void setup(){
  size(1440, 800);
  blendMode(ADD);
  colorMode(HSB, 360, 100,100);
  background(0, 0, 0);
  //stroke(0,100,100);
  //strokeWeight(4);
  //point(f1.posx, f1.posy);
  //frameRate(10);
  noLoop();
  ps = new ArrayList<PhysicalPoint>();
  fs = new ArrayList<PhysicalField>();
  for(int i = 0; i < pn; i++){
    ps.add(new PhysicalPoint(random(1.0)*width, 0, 0, 0.1*(random(1.0) + 1), 0.0, 0.0, 1));
  }
  
  for(int i = 0; i < fn; i++){
    fs.add(new PhysicalField(random(1.0)*width, height*0.4+height*random(0.6)));
    
  }
  
  
  
}

void draw(){
  for(int i = 0; i < 2000; i++){
    for(int j = 0; j < pn; j++){
      ps.get(j).setForce(0, 0);
      for(int k = 0; k < fn; k++){
        fs.get(k).force(ps.get(j), 2, true);
        ps.get(j).setForce(fs.get(k).forcex, fs.get(k).forcey);
        stroke(0,0,100, 100);
        point(fs.get(k).posx, fs.get(k).posy);
      }
      ps.get(j).updateAcc();
      ps.get(j).updateVel();
      ps.get(j).updatePos();
      println(ps.get(j).accx, ps.get(j).accy);
      stroke(0,0,100, 100);
      strokeWeight(1);
      point(ps.get(j).posx, ps.get(j).posy);
    }
  }
}
