function setup(){
    createCanvas(400, 400)
    background(0,0,0,20)
    //blendMode(ADD)
}

function draw(){
    fill(255)
    background(0,0,0,20)
    strokeWeight(5)
    stroke(200)
    let theta = frameCount/60.0
    let r = 100
    translate(200, 200)
    point(r*cos(theta), r*sin(theta))
}

