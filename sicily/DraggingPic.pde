class DraggingPic {

  int x;
  int y;
  int xOffset = 0;
  int yOffset = 0;
  PImage sample;
  String gfxfolder=sketchPath("data//gfx");//i know this is duplicated on sicily.pde and Pin.pde but moving the gfxpath String outside setup to try and make it global breaks sketchPath for some reason.

  // controls whether we are dragging (holding the mouse)
  boolean hold;

  // constructor
  DraggingPic(int posx, int posy, 
    String imageNameAsString) {
    x=posx;
    y=posy;
    sample = loadImage(gfxfolder + "//" + imageNameAsString);
    sample.resize(160, 0); // optional
  }// constructor

  void display() {
    pushStyle();
    tint(253, 240, 166); //sepia tint
    image(sample, x, y);
    popStyle();
  }

  void draggingpicMousePressed(SoundFile sfx) { //test if the cursor is over the pics
    if (mouseX > x &&
      mouseY > y &&
      mouseX < x + sample.width && 
      mouseY < y + sample.height) {
      if (sfx.isPlaying() == false) {
        sfx.rate(random(0.9, 1.1));
        sfx.play();
      } else {
        sfx.stop(); 
        sfx.rate(random(0.9, 1.1));
        sfx.play();
      }
      hold=true;
      xOffset = mouseX - x;
      yOffset = mouseY - y;
    }
  }//method

  void draggingpicMouseReleased(SoundFile sfx) {
    if (hold) {
      //release sfx
      //without these checks, a horrible sound bug will permanently
      // screech at us if we spam click 
      if (sfx.isPlaying()) {
        sfx.stop();
      }
      sfx.rate(random(0.9, 1.1));
      sfx.play();
    }//method
    hold=false;
    xOffset = 0;
    yOffset = 0;
  }

  void mouseDraggedIfHolding() {
    if (hold) {
      x=mouseX - xOffset; //Preserva o offset, ao invés de usar sample.width/2
      y=mouseY - yOffset;
    }
  }//method
}//class 
