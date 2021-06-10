class DraggingPic {
 
  int x;
  int y;
  int xOffset = 0;
  int yOffset = 0;
  PImage sample;
 
  // controls whether we are dragging (holding the mouse)
  boolean hold;
 
  // constructor
  DraggingPic(int posx, int posy, 
    String imageNameAsString) {
    x=posx;
    y=posy;
    sample = loadImage(imageNameAsString);
    sample.resize(160, 0); // optional
  }// constructor
 
  void display() {
    pushStyle();
    tint(253,240,166); //sepia tint
    image(sample, x, y);
    popStyle();
  }
 
  void draggingpicMousePressed() { //test if the cursor is over the pics
    if (mouseX > x &&
      mouseY > y &&
      mouseX < x + sample.width && 
      mouseY < y + sample.height) {
      hold=true;
      xOffset = mouseX - x;
      yOffset = mouseY - y;
    }
  }
 
  void draggingpicMouseReleased() {
    hold=false;
    xOffset = 0;
    yOffset = 0;
  }
 
  void mouseDragged() {
    if (hold) {
      x=mouseX - xOffset; //Preserva o offset, ao invés de usar sample.width/2
      y=mouseY - yOffset;
    }
  }//method
  
}//class 