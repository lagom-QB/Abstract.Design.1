class MaskCircle{
    float diameter,
          _diameter, 
          positionX, 
          positionY; 
    int   angle;

    PGraphics maskMask;
    
    MaskCircle(float posX, float posY) {
        positionX   = posX;
        positionY   = posY;
        diameter    = random(10,50);
        angle       = int(random(90));
    }
    
    void changeSize() {
        _diameter = constrain((diameter+diameter* sin(angle)), 10, width/3);

        println("increase -> ",diameter, _diameter);
        
        diameter = _diameter;
    }
    void display(PGraphics g) {
        g.noStroke();  

        changeSize();

        g.ellipse(positionX, positionY, _diameter, _diameter);
    }

    void resetPosition(){
            positionX = random(width);
            positionY = random(height);
            diameter  = random(5,width/3);
            angle     = int(random(90));
    }
    void update() {
        if (_diameter <  width/3) angle += .01;
        else resetPosition();
    }
}