class MaskCircle{
    float diameter,
          _diameter,
          maxDiameter, 
          minDiameter,
          positionX, 
          positionY; 
    int   angle;

    PGraphics maskMask;
    
    MaskCircle(float posX, float posY) {
        positionX   = posX;
        positionY   = posY;
        angle       = int(random(1,360));
        minDiameter = random(10);
        maxDiameter = constrain(minDiameter+minDiameter* sin(angle), minDiameter, width/3);
        diameter    = random(10,maxDiameter);

        maskMask = createGraphics(width, height, P2D);
    }
    
    void changeSize() {
        _diameter = diameter+diameter* sin(angle);
        diameter = _diameter;
        println("increasing size...", _diameter);
        
    }
    void display(PGraphics g) {
        g.noStroke();  
        changeSize(); // <-- Modifies _diameter
        g.circle(positionX, positionY, _diameter);
    }

    void resetPosition(){
        maskMask.beginDraw();
        maskMask.noStroke();
        maskMask.endDraw();
        //=============>
        println("resetting ...");
        positionX = random(width);
        positionY = random(height);
        diameter  = random(5,maxDiameter);
        angle     = int(random(90));
    }
    void update() {
        while(_diameter <= minDiameter) _diameter += 1;
        
        if (_diameter >= maxDiameter) resetPosition(); 
        else angle += 1;

        diameter = _diameter;
    }
}