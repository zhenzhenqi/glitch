// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 15-7: Displaying the pixels of an image

PImage img;
color[] myColors;

void setup() {
  size(474, 600);
  img = loadImage("renee1.jpg");
  myColors = new color[100];

  loadPixels();

  // We must also call loadPixels() on the PImage since we are going to read its pixels.
  img.loadPixels();
  for (int y = 0; y < height; y++ ) {
    for (int x = 0; x < width; x++ ) {
      int loc = x + y*width;
      // The functions red(), green(), and blue() pull out the three color components from a pixel.
      float r = red(img.pixels [loc]); 
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      // Image Processing would go here
      // If we were to change the RGB values, we would do it here, before setting the pixel in the display window.

      // Set the display pixel to the image pixel
      pixels[loc] = color(r, g, b);
    }
  }

  updatePixels();
}

void draw() {
}

void mousePressed() {
  //println("pressed");
  int myX = mouseX;
  int myY = mouseY;
  for (int i = 0; i<myColors.length; i++) {
    int loc = (myX+i) + myY*width;
    // The functions red(), green(), and blue() pull out the three color components from a pixel.
    if (loc > width*height) {
    } else {
      color tempC = img.pixels[loc];
      myColors[i] = tempC;
    }
  }
  //println(myColors);
}

void mouseDragged() {
  //println("dragged");
  for (int i=0; i<myColors.length; i++) {
    stroke(myColors[i]);
    point(mouseX+i, mouseY);
  }
}