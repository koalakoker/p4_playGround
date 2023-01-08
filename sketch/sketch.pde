float waveSpeed = 0.004;
int planeSide = 800;
int planeElement = 150;
int lastTime = 0;
int deltaTime = 0;

WavePlane plane;

void setup() {
  size(800, 600, P3D);
  fullScreen(P3D);
  plane = new WavePlane(planeSide, planeElement, waveSpeed);
  
  PFont font;
  font = loadFont("ArialRoundedMTBold-24.vlw");
  textFont(font, 24);
}

void draw() {
  deltaTime = millis() - lastTime;
  lastTime = millis();
  
  background(0);
  int fps = 1000/deltaTime;
  text(String.valueOf(fps), 50, 200);
  plane.draw();
}
