/*
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution; // Canvas size (width,height)
uniform vec2 u_mouse;      // mouse position in screen pixels
uniform float u_time;     // Time in seconds since load

void main() {

  float r = 0.0;
  float g = 0.0;
  float b = 0.0;

  float u_time = u_time * 0.6;
  vec2 uv = (gl_FragCoord.xy / u_resolution.xx - 0.5) * 1.0;
  vec2 uv_color = uv;
  for(int loop = 0; loop < 3; loop++){
    uv_color = vec2(uv_color.x, uv_color.y);
    r = 0.1/length(uv_color);
    g = 0.1/length(uv_color);
    b = 0.1/length(uv_color);
  }
  gl_FragColor = vec4(vec3(1.0, 0.0, 0.0), 0.0);
}
*/
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution; // Canvas size (width,height)
uniform vec2 u_mouse;      // mouse position in screen pixels
uniform float u_time;     // Time in seconds since load

void main() {
  float r = 0.0;
  float g = 0.0;
  float b = 0.0;

  float u_time = u_time * 0.6;
  vec2 uv = (gl_FragCoord.xy / u_resolution.xx - 0.5) * 1.0;
  vec2 uv_color = uv;
  for(int loop = 0; loop < 10; loop++){
    vec2 r;
    r = vec2(cos(uv_color.y)+1.0, sin(uv_color.x)+1.0);
    r += vec2(r.x, r.y)*0.3;
    uv_color += r;
  }
  r = sin(uv_color.x - u_time + 0.0)*0.8+0.5;
  g = sin(uv_color.y - u_time + 0.3)*0.8+0.5;
  b = sin(uv_color.x + uv_color.y - u_time)*0.5+0.5;
  gl_FragColor = vec4(vec3(cos(r), sin(g), tan(b)),1.0);
}
