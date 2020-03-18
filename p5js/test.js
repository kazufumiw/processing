function setup(){
    blendMode(ADD);
    createCanvas(800, 800);
    background(0,0,0);
    
    drawingContext.shadowOffsetX = width*3*0;
    drawingContext.shadowOffsetY = height*3*0;
    drawingContext.shadowBlur = 60;
    drawingContext.shadowColor = color(0,255,255);  
    
    slider_c = createSlider(0, 100, 20, 0.1);
    slider_c.position(50, 50);
    slider_c.style('width', '480px');

    slider_n = createSlider(0, 50, 10, 1);
    slider_n.position(50, 70);
    slider_n.style('width', '480px');

    //noLoop() 
}
/*
function draw(){
    background(0,0,0)
    push()
    translate(-width, -height
    push()
    fill(255)
    drawingContext.shadowOffsetX = width*3;
    drawingContext.shadowOffsetY = height*3;
    drawingContext.shadowBlur = 100*noise(frameCount/30);
    drawingContext.shadowColor = color(0,255,255);
    ellipse(200, 200, 100, 100)
    drawingContext.shadowBlur = 100*noise(frameCount/30+30);
    rect(300*cos(PI*0.5 - noise(frameCount/60)), 300*sin(PI*0.5 - noise(frameCount/60)), 100, 100)
    pop()
}
*/
/*
function draw(){
    background(0);
    a = width*noise(frameCount/200.0)
    b = (width - a)*noise(frameCount/200.0 + 100)
    c = (width - (a + b))*noise(frameCount/200.0 + 200)
    stroke(255, 255, 255)
    fill(200, 100, 50)
    rect(0, 400, a, 50)
    fill(50, 200, 100)
    rect(a, 400, b, 50)
    fill(100, 50, 200)
    rect(a + b, 400, c, 50)
    fill(200, 200, 200)
    rect(a + b + c, 400, width - (a + b + c), 50)
}
*/

function draw(){
    
    background(2,20*pow(noise(frameCount*0.2), 2),20*pow(noise(frameCount*0.2), 2));
    let r = 200.0;
    let sr = 12.0;
    let c = slider_c.value();//14.1//*noise(frameCount/500.0)
    let ball_n = slider_n.value();//27//90//*noise(frameCount/50.0)
    let w = width * 0.5;
    let h = height * 0.5;
    translate(w, h);
    //rotate(0.01*frameCount)
    //rotate(0.5*PI/2)
    for(let i = 0; i < ball_n; i++){
        fill(255);
        let x = sqrt(pow(r,2) - pow(2*r*i/ball_n - r, 2))*cos(2*PI*c*i/ball_n + frameCount*0.05);
        let y = sqrt(pow(r,2) - pow(2*r*i/ball_n - r, 2))*sin(2*PI*c*i/ball_n + frameCount*0.05);
        let z = 1*(2*r*i/ball_n - r);

        y = map(y, -r*1.0, 1.0*r, 0.0, 1);
        let x_next = sqrt(pow(r,2) - pow(2*r*(i+1)/ball_n - r, 2))*cos(2*PI*c*(i+1)/ball_n + frameCount*0.05);
        let z_next = 1*(2*r*(i+1)/ball_n - r);
        let x_vn = sqrt(pow(r,2) - pow(2*r*(i+ball_n/c)/ball_n - r, 2))*cos(2*PI*c*(i+ball_n/c)/ball_n + frameCount*0.05);
        let z_vn = 2*r*(i+ball_n/c)/ball_n - r;
        let x_vn_next = sqrt(pow(r,2) - pow(2*r*(i+1+ball_n/c)/ball_n - r, 2))*cos(2*PI*c*(i+1+ball_n/c)/ball_n + frameCount*0.05);
        let z_vn_next = 2*r*(i+1+ball_n/c)/ball_n - r;
        //sr = sr*y
        noStroke();
        fill(0, 255, 255);

        //ellipse(x, z, sr, sr)
        //ellipse(x_vn, z_vn, sr, sr)
        //ellipse(x, z, sr, sr)
        //ellipse(x, z, sr, sr)
        //ellipse(x, z, sr, sr)
        //ellipse(x, z, sr, sr)
        //ellipse(x, z, sr, sr)
        //ellipse(x, z, sr, sr)
        //ellipse(x, z, sr, sr)
        strokeWeight(5+9*pow(noise(frameCount*0.2), 3));
        stroke(255*y,255*y,255*y);
        drawingContext.shadowColor = color(0,255*y,255*y);
        //line(x, z, x_next, z_next)
        point(x, z);
        point(x_vn, z_vn);
        strokeWeight(12*pow(noise(frameCount*0.2), 3));
        //strokeWeight(cos(frameCount*0.05))
        line(x, z, x_next, z_next);
        line(x, z, x_vn, z_vn);
        line(x_vn, z_vn, x_vn_next, z_vn_next);
    }
    
    
    //ellipse(w + 100*cos(2*PI*c*1.0/100), 400 + 2*r*1.0/, 10,10)
}
