import processing.sound.*;

DraggingPic[] dragImages = new DraggingPic[11];

int NUM_OF_LOOSE_PINS = 8;
int NUM_OF_CONN_PINS = 10;
float LINE_TIGHTNESS = 0.6; //from 0 to 1

SoundFile dropsfx;
SoundFile grabsfx;
SoundFile sheet1;
SoundFile sheet2;
SoundFile sheet3;

Pin[] loosePins = new Pin[NUM_OF_LOOSE_PINS];
Pin[] connPins = new Pin[NUM_OF_CONN_PINS];

PImage centerpiece, cloud, bg;

void setup() {

  size(768, 1000); //tiles 256x
  background(255);   
  noStroke(); 
  noSmooth();
  rectMode (RADIUS);
  bg = loadImage("bg.png");
  centerpiece = loadImage("centerpiece.png");
  cloud = loadImage("cloud.png");
  grabsfx = new SoundFile(this, "paper1.wav");
  dropsfx = new SoundFile(this, "paper2.wav");
  sheet1 = new SoundFile(this, "sheet1.wav");
  sheet2 = new SoundFile(this, "sheet2.wav");
  sheet3 = new SoundFile(this, "sheet3.wav");

  //setup images         lampedusa    christ      clip1     clip2       clip3       clip4       marabout   worncard1  worncard2  crescentii lampcard
  int[] imgPositions = {570, 733, 306, 545, 18, 180, 588, 212, 588, 261, 588, 294, 587, 45, 70, 665, 63, 688, 45, 706, 26, 726};
  String[] imgNames = {"lampedusa.jpg", "christpereda.jpg", "clipping1.png", "clipping2.png", "clipping3.png", "clipping4.png", 
    "marabout1970.png", "worncard2.png", "worncard1.png", "crescentiicard.png", "lampedusacard.png"};

  for (int i = 0; i < imgNames.length; i++) {
    dragImages[i] = new DraggingPic(imgPositions[i*2], imgPositions[i*2 + 1], imgNames[i]);
  }

  //setup pins
  for (int i = 0; i < NUM_OF_LOOSE_PINS; i++) {
    loosePins[i] = new Pin(20, 20 + (23 * i), "pinblue.png");
  }
  for (int i = 0; i < NUM_OF_CONN_PINS; i++) { //TODO custom starting positions
    connPins[i] = new Pin((20 + 50*i), 50, "pin.png");
  }
} //setup

void draw() {
  background(120, 80, 40); //style background start
  pushStyle(); 
  tint (255, 127);
  for (int y = 0; y < height; y = y + 256) { // tile bg image
    for (int x = 0; x < width; x = x + 256) {
      image (bg, x, y);
    }
  }
  fill(201, 75, 2); //dark orange
  blendMode(MULTIPLY);
  rect (0, 0, 10, height); //left table corner
  rect (width, 0, 10, height); //right table corner
  rect (0, 0, width, 10); //top  table corner
  rect (0, height, width, 10); //bottom table corner
  popStyle(); //style background end

  pushStyle(); //centerpiece style start
  blendMode(MULTIPLY);
  fill(255, 110, 25); //light orange
  stroke(201, 75, 2);
  strokeWeight(10);
  rect (width/2, height/2, 100, 100);
  fill (0);
  textAlign (CENTER);
  textSize (14);
  text ("Photos of Hanged Christ \nare appearing around town.\nConnection to E⬛⬛⬛⬛\n pre-Indo-European sect \n is possible. Investigate \nat earliest convenience.", width/2, height/2-75);
  noStroke();
  rect (width/2+59, height/2-37, 30, 7); //black bar
  blendMode(DARKEST);
  image(centerpiece, width/2-30, height/2+40);
  centerpiece.resize(75, 0);
  popStyle();
  pushStyle();//textura noise no centerpiece abaixo
  blendMode(MULTIPLY);
  tint(255, 100);
  image(cloud, width/2-105, height/2-105);
  cloud.resize(210, 0);
  popStyle(); //centerpiece style end 

  for (DraggingPic currentDraggingPic : dragImages) {
    currentDraggingPic.display();
    currentDraggingPic.mouseDraggedIfHolding();
  }//for

  for (Pin currentDraggingPin : connPins) {
    currentDraggingPin.display();
    currentDraggingPin.mouseDraggedIfHolding();
  }//for

  for (Pin currentDraggingPin : loosePins) {
    currentDraggingPin.display();
    currentDraggingPin.mouseDraggedIfHolding();
  }//for

  //Code to connect pins
  float x1, y1, x2, y2, x3, y3, x4, y4;

  pushStyle(); //begin curve styling
  noFill();
  strokeWeight(4);
  stroke(255, 0, 0);
  curveTightness(LINE_TIGHTNESS);

  for (int i = 0; i < NUM_OF_CONN_PINS; i = i+2) {
    x1 = connPins[i].x + 10;
    y1 = connPins[i].y + 10 - 1000;

    x2 = connPins[i].x + 10;
    y2 = connPins[i].y + 10;

    x3 = connPins[i+1].x + 10;
    y3 = connPins[i+1].y + 10;

    x4 = connPins[i+1].x + 10;
    y4 = connPins[i+1].y + 10 - 1000;

    curve(x1, y1, x2, y2, x3, y3, x4, y4);
  }

  popStyle();//end curve styling

  fill(0);
  text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY ); //debug
}//draw

// --------------Grabbing a pin and a photo at the same time is intended behavior

void mousePressed() {
  for (int i = dragImages.length - 1; i >= 0; i--) {//Starts from the last, loops backward so we always grab pic on top
    if (mouseButton == LEFT) {
      dragImages[i].draggingpicMousePressed();
    }

    //leave "check mousepos & grab pics" loop as soon as one is grabbed to prevent grabbing many
    if (dragImages[i].hold == true) {
      break;
    }
  }//for

  Pin[] pins = new Pin[NUM_OF_LOOSE_PINS + NUM_OF_CONN_PINS];
  pins = (Pin[]) concat(connPins, loosePins);

  for (Pin currentDraggingPin : pins) {
    currentDraggingPin.draggingpinMousePressed();

    if (mouseButton == RIGHT && currentDraggingPin.hold == true) {
      break;
    }
  }//for
}

void mouseReleased() { //sets 'hold' variable to false
  for (DraggingPic currentDraggingPic : dragImages) {
    currentDraggingPic.draggingpicMouseReleased();
  }//for

  for (Pin currentDraggingPin : connPins) {
    currentDraggingPin.draggingpinMouseReleased();
  }//for

  for (Pin currentDraggingPin : loosePins) {
    currentDraggingPin.draggingpinMouseReleased();
  }//for

  //sound randomizing
  float soundRandomizing =random(0.9, 1.1);
  float ampRandomizing = random(0.5, 0.8);
  dropsfx.rate(soundRandomizing);
  dropsfx.amp(ampRandomizing);
}
