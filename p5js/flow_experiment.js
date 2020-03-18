let ps = []
let n

function setup(){
    createCanvas(800, 800, Path2D)
    //drawingContext.shadowOffsetX = width*3*0;
    //drawingContext.shadowOffsetY = height*3*0;
    reset()
}

function reset(){
    background(0,0,0,20)
    addBalls()
}

function addBalls(){
    n = 10.0
    /*
    if(ps.length > n*20){
        text(ps.length, 100, 100)
        ps.splice(1000, 100)
    }
    */
    /*
    for(let i = 0; i < n+1; i++){
        ps.push(createVector(i*width/n*(random()*0.2+0.8)), -100*random())
    }
    */
    for(let i = 0; i < n+1; i++){
        ps.unshift(createVector(-100*random(), i*height/n*(random()*0.2+0.8)))
        //text(ps.length, 100, 100)
        ps.splice(n*20, n*2)
    }
    
}

function draw(){
    if(random() < 0.05){
        addBalls()
    }    
    background(0,0,0,99)
    for(let i in ps){
        push()
        //drawingContext.shadowBlur = 10;
        //drawingContext.shadowColor = color(0,255,255);
        textSize(40)
        text("🍣", ps[i].x, ps[i].y)
        //point(ps[i].x, ps[i].y);
        pop()
        let vel = createVector(0.0, 0.0);
        vel.add(uniformFlowFunction(6.0, 0.0));
        vel.add(columnFunction(100.0, 200.0, ps[i]));
        vel.add(columnFunction(500.0, 100.0, ps[i]));
        vel.add(columnFunction(200.0, 400.0, ps[i]));
        vel.add(columnFunction(650.0, 300.0, ps[i]));
        vel.add(columnFunction(120.0, 600.0, ps[i]));
        vel.add(columnFunction(500.0, 500.0, ps[i]));
        stroke(200, 255, 255)
        strokeWeight(10)
        ps[i].x += vel.x
        ps[i].y += vel.y
    }
    saveFrames('~/Desktop/tmp/'+str(frameCount)+'.png', extension, duration, framerate, [callback])
}

function keyPressed()(){
    saveFrames('~/Desktop/tmp/'+str(frameCount), 'png', 10, 60)
}

function columnFunction(x0, y0, p){
    let ux = -40000.0*(pow((p.x - x0), 2) - pow((p.y - y0), 2))/pow(pow((p.x - x0), 2) + pow((p.y - y0), 2), 2)
    let uy = -40000.0 * (2.0*(p.x - x0)*(p.y - y0))/pow(pow((p.x - x0), 2) + pow((p.y - y0), 2), 2);
    let vel = createVector(ux, uy)
    return vel
}

function uniformFlowFunction(magx, magy){
    let ux = magx
    let uy = magy
    let vel = createVector(ux, uy);
    return vel
}
