function setup(){
    createCanvas(800, 800)
    background(0)
    blendMode(DIFFERENCE)
}

function draw(){
    clear()
    background(255)
    translate(0,0) 
    //rotate(0.01*frameCount)
    strokeWeight(6)
    
    strokeCap(ROUND)
    s = 5*noise(frameCount*0.2)*0.5
    fill(0,255,0)
    circle(400, 350, 200)
    fill(255,0,0)
    circle(350, 450, 200)
    fill(0,0,255)
    circle(450, 450, 200)
}