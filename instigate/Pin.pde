class Pin {
  int x;
  int y;
  PImage sample;

  // controls whether we are dragging (holding the mouse)
  boolean hold;

  // constructor
  Pin(int posx, int posy, String imageNameAsString) {
    x=posx;
    y=posy;
    sample = loadImage(imageNameAsString);
  }// constructor

  void display() {    

    image(sample, x, y);
    sample.resize (20, 0);

    // //INÍCIO HARDCODE FEIO HORROROSO

    //curvex1 = pins1[1].x+(sample.width); // why is the bend curving to the right without these???
    //curvey1 = -1000;
    //curvex2 = pins1[0].x+(sample.width/2);
    //curvey2 = pins1[0].y+(sample.height/2); 
    //curvex3 = pins1[1].x+(sample.width/2);
    //curvey3 = pins1[1].y+(sample.height/2);
    //curvex4 = pins1[1].x+(sample.width);
    //curvey4 = -1000;

    //curvex5 = pins3[1].x+(sample.width); // why is the bend curving to the right without these???
    //curvey5 = -1000;
    //curvex6 = pins3[0].x+(sample.width/2);
    //curvey6 = pins3[0].y+(sample.height/2); 
    //curvex7 = pins3[1].x+(sample.width/2);
    //curvey7 = pins3[1].y+(sample.height/2);
    //curvex8 = pins3[1].x+(sample.width);
    //curvey8 = -1000;

    //pushStyle(); //begin curve styling
    //noFill();
    //strokeWeight(4);
    //stroke(255, 0, 0);
    //curveTightness(0.6);
    //curve(curvex1, curvey1, curvex2, curvey2, curvex3, curvey3, curvex4, curvey4);
    //curve(curvex5, curvey5, curvex6, curvey6, curvex7, curvey7, curvex8, curvey8);
    //popStyle(); //end curve styling

    ////FINAL HARDCODE FEIO HORROROSO
  }
  void draggingpinMousePressed() {
    if (mouseX > x && mouseY > y && mouseX < x + sample.width && mouseY < y + sample.height) {
      hold=true;
    }
  }

  void draggingpinMouseReleased() {
    hold=false;
  }

  void mouseDraggedIfHolding() { 
    if (hold) {
      x=mouseX - sample.width/2; 
      y=mouseY - sample.height/2;
    }
  }//method
}//class 
