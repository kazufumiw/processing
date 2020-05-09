varying vec2 p ; // axis -1.0 <= x, y <= 1.0
uniform sampler2D texture; //2D sample texture
uniform int count ; //loop count
uniform int u_time ; //random seed

const int WD = 10 ;
const int HD = 20 ;

int srand ;

int setCh(ivec2 p,int s) {
  int ch=0  ;
  int zc = 0 ;
  int kf = 0 ;
  int pofs = p.x + p.y*WD ;

  for(int i=0; i<WD*HD; i++) {
    ch = 6 ;
    if(i>=s) ch=6 ; //blank
    else if(kf==0) {
      srand =  srand*1103515245+12345 ;
      int r = srand/16384 ;
      if(r<0) r = - r ;

      ch = (r - r/2*2)*2 ; // 0=zun 2=doko
      if(ch==0) zc++ ;
      else {
        if(zc>=4) kf = i ;
        zc = 0 ;
      }
    } else {
      if(i==kf+1) ch = 4 ; //　koyo
      if(i==kf+2) ch = 5 ; //  shi!
    }
    if(i==pofs) break ; //指定座標まできたら抜ける
  }
  return ch ;
}

void main() {
  srand = u_time ;
　//座標を正規化し、表示するキャラクタを求める
  vec2 np = vec2((p.x+1.0)/2.,1.0-(p.y+1.0)/2.) ;
  float px = np.x * float(WD) ;
  float py = np.y * float(HD) ;
  vec2 op = vec2( fract(px),fract(py)) ;
  ivec2 pa = ivec2(floor(px),floor(py) ) ;
  int ch = setCh(pa,count/10) ;

  //表示キャラクタからテクスチャのオフセットを算出
  float ox = mod(float(ch),2.) * 0.5 ;
  float oy = float(ch/2) * 0.25 ;
  vec2 tp = vec2(op.x/2.+ox,op.y/4.+oy) ;

　//表示色を決める
  vec4 col ;
  if(ch/2==0 ) col = vec4(1.0,0,1.0,1.0) ;
  else if(ch/2==1 ) col = vec4(0,1.0,0,1.0) ;
  else col = vec4(1.0,0,0,1.0) ;

　//ピクセルの色を決定
  gl_FragColor = texture2D(texture,tp) * col ;
}
