// Fabián Alfonso Beirutti Pérez
// 2021 - CIU

import controlP5.*;

ControlP5 cp5;
boolean showColorSelector, blockMousePosition, menu;

int numBalls;
Ball[] balls;

int menuNumBalls;
Ball[] menuBalls;

PShader shaderBall;
PImage image;

void setup() {
  size(1200, 800, P2D);
  numBalls = 5;
  menuNumBalls = 3;
  showColorSelector = false;
  blockMousePosition = true;
  menu = true;
  image = loadImage("Captura.JPG");
  initEffect();
  shaderBall = loadShader("shaderBall.glsl");
}

void draw() {
  if (menu) menu();
  else {
    updateBalls();
    showHelp();
  }
}

void initEffect() {
  balls = new Ball[numBalls];
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball();
  }

  cp5 = new ControlP5(this);
  cp5.addColorWheel("Ball #1", 150, 650, 100).setRGB(color(random(255), random(255), random(255)));
  cp5.addColorWheel("Ball #2", 350, 650, 100).setRGB(color(random(255), random(255), random(255)));
  cp5.addColorWheel("Ball #3", 550, 650, 100).setRGB(color(random(255), random(255), random(255)));
  cp5.addColorWheel("Ball #4", 750, 650, 100).setRGB(color(random(255), random(255), random(255)));
  cp5.addColorWheel("Ball #5", 950, 650, 100).setRGB(color(random(255), random(255), random(255)));
}

void updateBalls() {
  for (int i = 0; i < numBalls; i++) {
    balls[i].update();
  }
  
  shaderBall.set("resolution", float(width), float(height));
  
  shaderBall.set("location_Ball_One", balls[0].location.x/float(width), (height-balls[0].location.y)/float(height));
  shaderBall.set("location_Ball_Two", balls[1].location.x/float(width), (height-balls[1].location.y)/float(height));
  shaderBall.set("location_Ball_Three", balls[2].location.x/float(width), (height-balls[2].location.y)/float(height));
  shaderBall.set("location_Ball_Four", balls[3].location.x/float(width), (height-balls[3].location.y)/float(height));
  shaderBall.set("location_Ball_Five", balls[4].location.x/float(width), (height-balls[3].location.y)/float(height));
  
  int c = cp5.get(ColorWheel.class, "Ball #1").getRGB();
  shaderBall.set("color_Ball_One", red(c)/255.0, green(c)/255.0, blue(c)/255.0, 0.0);
  c = cp5.get(ColorWheel.class, "Ball #2").getRGB();
  shaderBall.set("color_Ball_Two", red(c)/255.0, green(c)/255.0, blue(c)/255.0, 0.0);
  c = cp5.get(ColorWheel.class, "Ball #3").getRGB();
  shaderBall.set("color_Ball_Three", red(c)/255.0, green(c)/255.0, blue(c)/255.0, 0.0);
  c = cp5.get(ColorWheel.class, "Ball #4").getRGB();
  shaderBall.set("color_Ball_Four", red(c)/255.0, green(c)/255.0, blue(c)/255.0, 0.0);
  c = cp5.get(ColorWheel.class, "Ball #5").getRGB();
  shaderBall.set("color_Ball_Five", red(c)/255.0, green(c)/255.0, blue(c)/255.0, 0.0);

  if (blockMousePosition){
    shaderBall.set("threshold", pow(map(mouseY, height, 0, 1.0, 0.0), 2));
    shaderBall.set("size", pow(map(mouseX, 0, width, 0.0, 1.0), 3));
  }
  
  shader(shaderBall);
  rect(0, 0, width, height);
}

void menu() {
  cp5.hide();
  background(0);
  textSize(50);
  textAlign(CENTER);
  fill(255);
  text("Color Shader Balls", width/2, height/2-280);
  text("(Using GLSL)", width/2, height/2-210);
  textSize(25);
  text("by Fabián B.", width/2, height/2-160);
  image(image, width/2-300, height/2-130, 600, 400);
  text("Press ENTER to continue", width/2, height/2+320);
}

void showHelp() {
  textAlign(LEFT);
  textSize(20);
  text("> Move the mouse up - down to change pixels distance.", 25, 50);
  text("> Move the mouse left - right to change light intensity.", 25, 100);
  text("> Press B to block mouse control.", 25, 150);
  text("> Press C to change balls position.", 25, 200);
  text("> Press H to show / hide color selector.", 25, 250);
  text("> Press ESC to close.", 25, 300);
}

void keyPressed() {
  if (keyCode == ENTER) {
    menu = false;
    cp5.show();
  }
  if (key == 'H' || key == 'h') {
    if(showColorSelector){
      cp5.hide();
      showColorSelector = !showColorSelector;
    }else{
      cp5.show();
      showColorSelector = !showColorSelector;
    }
  }
  if (key == 'B' || key == 'b'){
    blockMousePosition = !blockMousePosition;
  }
  if (key == 'C' || key == 'c'){
    for (int i = 0; i < numBalls; i++){
      balls[i].reset();
    }
  }
}
