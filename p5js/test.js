function setup(){
    blendMode(ADD);
    createCanvas(800, 800);

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
}
function draw(){
    background(2,20*pow(noise(frameCount*0.2), 2),20*pow(noise(frameCount*0.2), 2));
    let r = 200.0;
    let c = slider_c.value();//14.1//*noise(frameCount/500.0)
    let ball_n = slider_n.value();//27//90//*noise(frameCount/50.0)
    let w = width * 0.5;
    let h = height * 0.5;
    translate(w, h);
    for(let i = 0; i < ball_n; i++){
        fill(255);
        let x = sqrt(pow(r,2) - pow(2*r*i/ball_n - r, 2))*cos(2*PI*c*i/ball_n + frameCount*0.05);
        let y = sqrt(pow(r,2) - pow(2*r*i/ball_n - r, 2))*sin(2*PI*c*i/ball_n + frameCount*0.05);
        y = map(y, -r*1.0, 1.0*r, 0.0, 1);
        let z = 1*(2*r*i/ball_n - r);

         
        let x_next = sqrt(pow(r,2) - pow(2*r*(i+1)/ball_n - r, 2))*cos(2*PI*c*(i+1)/ball_n + frameCount*0.05);
        let z_next = 1*(2*r*(i+1)/ball_n - r);
        let x_vn = sqrt(pow(r,2) - pow(2*r*(i+ball_n/c)/ball_n - r, 2))*cos(2*PI*c*(i+ball_n/c)/ball_n + frameCount*0.05);
        let z_vn = 2*r*(i+ball_n/c)/ball_n - r;
        let x_vn_next = sqrt(pow(r,2) - pow(2*r*(i+1+ball_n/c)/ball_n - r, 2))*cos(2*PI*c*(i+1+ball_n/c)/ball_n + frameCount*0.05);
        let z_vn_next = 2*r*(i+1+ball_n/c)/ball_n - r;

        noStroke();
        fill(0, 255, 255);
        strokeWeight(5+9*pow(noise(frameCount*0.2), 3));
        stroke(255*y,255*y,255*y);
        drawingContext.shadowColor = color(0,255*y,255*y);
        point(x, z);
        if(i == ball_n-1){
            point(x_next, z_next);
        }
        point(x_vn, z_vn);
        strokeWeight(12*pow(noise(frameCount*0.2), 3));
        line(x, z, x_next, z_next);
        line(x, z, x_vn, z_vn);
        line(x_vn, z_vn, x_vn_next, z_vn_next);
        
        
        
    }
}
