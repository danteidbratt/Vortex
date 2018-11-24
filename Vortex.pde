int numberOfPoints = 100;
float multiple = 2;
float increment = 0;
float steps = 0.001;
float radius = 300;

Color red = new Color(0, true);
Color green = new Color(170, true);
Color blue = new Color(170, false);

boolean rainbow = false;
boolean showText = false;
float fallback = 0;
boolean running = true;

int centerX = 0;
int centerY = 0;

void setup() {
  fullScreen();
  strokeWeight(2);
  frameRate(30);
  noCursor();
  textSize(20);
  centerX = width / 2;
  centerY = height / 2;
  setColors();
}

void draw() {
  background(20);
  setMultiple();
  if (rainbow) { 
    setColors();
  }
  if (showText) {
    writeText();
  }
  drawLines();
}

void setMultiple() {
  multiple += increment;
}

void drawLines() {
  float angle = TWO_PI / numberOfPoints;
  float a, b;
  for (int i = 0; i < numberOfPoints; i++) {
    a = angle * i;
    b = a * multiple;
    line(
      centerX + radius * sin(a), 
      centerY + radius * cos(a), 
      centerX + radius * sin(b), 
      centerY + radius * cos(b));
  }
}

void setColors() {
  stroke(red.getValue(), green.getValue(), blue.getValue());
}

void writeText() {
  text("multiple: " + String.format("%.3f", multiple), 20, 40);
  text("points: " + numberOfPoints, 20, 70);
  text("increment: " + String.format("%.3f", increment), 20, 100);
}

void keyPressed() {
  if (key == ' ') {
      swap(increment, fallback);
  } else if (keyCode == ESC) {
    exit();
  } else if (keyCode == UP) {
    if (numberOfPoints < 200) {
      numberOfPoints++;
    }
  } else if (keyCode == DOWN) {
    if (numberOfPoints > 5) {
      numberOfPoints--;
    }
  } else if (keyCode == LEFT) {
    increment -= steps;
    fallback = 0;
  } else if (keyCode == RIGHT) {
    increment += steps;
    fallback = 0;
  } else if (key == '+') {
    multiple = (float) Math.ceil(multiple + 0.00001);
  } else if (key == '-') {
    multiple = (float) Math.floor(multiple - 0.00001);
  } else if (key == 'c') {
    rainbow = !rainbow;
  } else if (key == 't') {
    showText = !showText;
  }
}

void swap(float x, float y) {
  float temp = fallback;
      fallback = increment;
      increment = temp;
}
