class WaveyLine {
    PVector pointPos, 
            prevPos;
    float size = random(2), 
         speed = .5,
         noiseScale = 10000,
         noiseStrength = 10,
         angle,
         z = random(.2,1.2);
    color strokeColor = color(random(200), 25, 55, random(100));
    
    WaveyLine() {
        pointPos = new PVector(random(0, width), random(0, height));
        prevPos = new PVector(pointPos.x, pointPos.y);
    }
    void display(PGraphics g){
        g.strokeWeight(size);
        g.stroke(strokeColor);

        g.line(prevPos.x, prevPos.y,pointPos.x, pointPos.y);
        prevPos.set(pointPos.x, pointPos.y);
    }
    void update(){
        angle =
            noise(
                pointPos.x/noiseScale, 
                pointPos.y/noiseScale, 
                z)*PI*noiseStrength;

        pointPos.x += min(cos(angle)*random(speed),width);
        pointPos.y += min(sin(angle)*random(speed), height);

        z += .001;
    }
}
