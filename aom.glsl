#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution; // Canvas size (width,height)
uniform vec2 u_mouse;      // mouse position in screen pixels
uniform float u_time;     // Time in seconds since load

void main() {
  float u_time = u_time * 0.6;
  vec2 uv = (gl_FragCoord.xy / u_resolution.xx - 0.5) * 1.0;
  vec2 uv0 = uv;
  float i0 = 1.0;
  float i1 = 1.0;
  float i2 = 1.0;
  float i4 = 0.0;
  vec2 uv_color = uv;
  for (int s = 0; s < 7; s++) {
    vec2 r;
    r = vec2(1.0*cos(1.0*uv_color.y * i0 - i4 + u_time / i1), 0.01*sin(uv_color.x * i0 - i4 + u_time / i1)) / i2;
    r += vec2(r.y, r.x) * 0.3;
    uv_color.xy += r;

    i0 *= 2.20;
    i1 *= 1.15;
    i2 *= 1.3;
    i4 += 0.05 + 0.1 * u_time * i1;
  }
  float r = 0.0;
  float b = 0.0;
  float g = 0.0;

  //if(uv.x < 0.2 && uv.y < 0.2 && uv.x > -0.2 && uv.y > -0.2){
  if(true/*distance(uv, vec2(0.0, 0.0)) < 1.25*/){
    r = sin(uv_color.x - u_time) * 0.5 + 0.5;
    b = sin(uv_color.x-0.01 - u_time) * 0.5 + 0.5;
    g = sin(uv_color.x+0.01 - u_time) * 0.5 + 0.5;
  }else{
    r = 1.0;
    g = 1.0;
    b = 1.0;
  }
  gl_FragColor = vec4(vec3(
    18.0*(1.0 - cos(3.14 - 3.14*pow(r, 2.0))),
    1.7*(1.0 - cos(3.14 - 3.14*pow(g, 8.0))),
    5.0*(1.0 - cos(3.14 - 3.14*pow(b, 6.0)))
    ),
    1.0);



}
