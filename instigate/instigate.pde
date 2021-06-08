DraggingPic[] dragImages = new DraggingPic[7];
Pin[] pins1 = new Pin[2];
Pin[] pins2 = new Pin[2];

PImage centerpiece, cloud, bg;
float curvex1, curvey1, curvex2, curvey2, curvex3, curvey3, curvex4, curvey4;

void setup() {
  size(768, 1024); //tiles 256x
  background(255);   
  noStroke(); 
  noSmooth();
  rectMode (RADIUS);
  bg = loadImage("bg.png");
  centerpiece = loadImage("centerpiece.png");
  cloud = loadImage("cloud.png");
  dragImages[0] = new  DraggingPic(180, 50, "lampedusa.jpg");
  dragImages[1] = new  DraggingPic(306, 555, "Pereda-varon_de_dolores.jpg");
  dragImages[2] = new  DraggingPic(588, 25, "clipping1.png");
  dragImages[3] = new  DraggingPic(588, 117, "clipping2.png");
  dragImages[4] = new  DraggingPic(588, 144, "clipping3.png");
  dragImages[5] = new  DraggingPic(588, 170, "clipping4.png");
  dragImages[6] = new  DraggingPic(345, 50, "marabout 1970.png");
  pins1[0] = new Pin(10, 10, "pin.png");
  pins1[1] = new Pin(155, 30, "pin.png");
  pins2[0] = new Pin(10, 50, "pinblue.png");
  pins2[1] = new Pin(31, 50, "pinblue.png");
}
 
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
  image(centerpiece,width/2-30,height/2+40);
  centerpiece.resize(75,0);
  popStyle();
  pushStyle();//textura noise no centerpiece abaixo
  blendMode(MULTIPLY);
  tint(255,100);
  image(cloud,width/2-105,height/2-105);
  cloud.resize(210,0);
  popStyle(); //centerpiece style end
   
  
  for (DraggingPic currentDraggingPic : dragImages) {
    currentDraggingPic.display();
    currentDraggingPic.mouseDragged();
  }//for
  
  for (Pin currentDraggingPin : pins1) {
    currentDraggingPin.display();
    currentDraggingPin.mouseDragged();
  }//for
  
  for (Pin currentDraggingPin : pins2) { //TODO fix grab multiple pin (inneficient stack of fors)
    currentDraggingPin.display();
    currentDraggingPin.mouseDragged();
  }//for
 
 
  fill(0);
  text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY ); //debug

}//draw
 
// --------------Grabbing a pin and a photo at the same time is intented behavior
 
void mousePressed() { 
  for (DraggingPic currentDraggingPic : dragImages) { //TODO: invert for order to grab last one in the array first
    currentDraggingPic.draggingpicMousePressed();
    
    //leave "check mousepos & grab pics" loop as soon as one is grabbed to prevent grabbing many
    if (currentDraggingPic.hold == true) {
      break;
    }
    
  }//for
  
  for (Pin currentDraggingPin : pins1) {
    currentDraggingPin.draggingpinMousePressed();
    
    //leave "check mousepos & grab pics" loop as soon as one is grabbed to prevent grabbing many
    if (currentDraggingPin.hold == true) {
      break;
    }

  }//for
  
   for (Pin currentDraggingPin : pins2) {
    currentDraggingPin.draggingpinMousePressed();
    
    //leave "check mousepos & grab pics" loop as soon as one is grabbed to prevent grabbing many
    if (currentDraggingPin.hold == true) {
      break;
    }

  }//for

}

void mouseReleased() { //sets 'hold' variable to false
  for (DraggingPic currentDraggingPic : dragImages) {
    currentDraggingPic.draggingpicMouseReleased();
  }//for
  
  for (Pin currentDraggingPin : pins1) {
    currentDraggingPin.draggingpinMouseReleased();
  }//for


 for (Pin currentDraggingPin : pins2) {
    currentDraggingPin.draggingpinMouseReleased();
  }//for
}
