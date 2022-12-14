// -------------------------------------------- Variables
PGraphics bg,mask; // Background and mask
int width     = 400, 
    height    = 600,
    count     = 30,
    lineCount = 15;

float x , y, diam;

PVector[] position          = new PVector[count];
color bgColor = color(233, 236, 201, 60),
      baseBkg = color(250,206,250, random(100));

WaveyLine[] movingLine      = new WaveyLine[lineCount];
MaskCircle stagnantCircle;
// ---------------------------------------------- Functions
void settings() {
    size(width, height, P2D);
}

void setup() {
    // frameRate(5);
    surface.setTitle("Masking");
    surface.setLocation(900, 100);
    
    // Define the positions of squares and the Circles
    for (int i = 0; i < count; i++) {
        position[i] = new PVector(
            random(10,width), 
            random(10,height));  
    }
    stagnantCircle = new MaskCircle(
            position[int(random(count))].x, 
            position[int(random(count))].y);
    // -------------------------------
    // Define the Lines
    for (int i = 0; i < lineCount; i++) {
        movingLine[i] = new WaveyLine();
    }
    // -------------------------------
    bg = createGraphics(width, height);
    bg.beginDraw();
    bg.background(baseBkg);
    // Create odd shaped squares
    for (int i = 0; i < count; ++i) {
        oddRect(
            position[i].x, 
            position[i].y, 
            random(10,width / 4), 
            random(10,height / 4),
            random(count), 
            bg);
    }
    // -------------------------
    bg.endDraw();
    
    mask = createGraphics(width, height);
}

void draw() {
    background(bgColor);
    mask.beginDraw();
    mask.noStroke();

    // Create circles to show the squares
    stagnantCircle.display(mask);
    stagnantCircle.update();
    // ----------------------------------
    mask.endDraw();

    // Draw the lines under the mask
    bg.beginDraw();
    for (WaveyLine l : movingLine) {
        l.display(bg);
        l.update();
    }
    bg.endDraw();

    bg.mask(mask);
    image(bg, 0, 0);
}

void oddRect(float x, float y, float width, float height, float offSet, PGraphics g) {
    g.beginShape();
    g.noStroke();
    g.fill(random(255),random(255),random(255),random(255));
    g.vertex(x + random( -offSet, offSet), y + random( -offSet, offSet));
    g.vertex(x + width + random( -offSet, offSet), y + random( -offSet, offSet));
    g.vertex(x + width + random( -offSet, offSet), y + height + random( -offSet, offSet));
    g.vertex(x + random( -offSet, offSet), y + height + random( -offSet, offSet));
    g.endShape(CLOSE);
}