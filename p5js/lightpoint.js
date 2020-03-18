function setup(){
    blendMode(BLEND)
    createCanvas(800, 800, Path2D);
    colorMode(HSB, 360, 100, 100, 100);
    background(0, 0, 0);
    
    drawingContext.shadowOffsetX = width*3*0;
    drawingContext.shadowOffsetY = height*3*0;    
}

function draw(){
    background(0,0,0,10)
    fill(0, 0, 100)
    stroke(0, 0, 100)
    strokeWeight(2)
    let x = 200*(cos(frameCount*0.01))//200*cos(frameCount*0.01)
    let y = 200*(sin(frameCount*0.01))
    push()
    translate(width*0.5, height*0.5)
    drawingContext.shadowColor = color(180,100,100);
    drawingContext.shadowBlur = 20;
    point(x, y)
    pop()
}
