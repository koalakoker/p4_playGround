ArrayList<Walker> walkers = new ArrayList<Walker>();
int walkersNum = 100;
int iterations = 800;
int walkerRadius = 2;
float stickyness = 0.5;
boolean simulationRun = true;
Tree tree;
DisplayInfo log = new DisplayInfo();
GrowRate growRate = new GrowRate();

void setup() {
  size(800,600);
  fullScreen();
  tree = new Tree();
  tree.add(new PVector(width/2, height/2));
  for (int i = 0; i < walkersNum; ++i) {
    walkers.add(new Walker(tree));  
  }
  textSize(20); 
}

void draw() {
  background(255);
  
  tree.draw();
  
  frameRateCheck();
  if (simulationRun) {
    for (int i = 0; i < walkers.size(); ++i) {
      Walker walker = walkers.get(i);
      for (int j = 0; j < iterations; j++) {
       walker.walk();
       if (walker.checkStuck(tree)){
         walkers.remove(i);
         tree.add(new PVector(walker.pos.x, walker.pos.y));
         break;
       }
      }    
      walker.draw();
    }
    reborn();
  } else {
    noLoop();
  }
  
  displayInfo();
}

void reborn() {
  int missing = walkersNum - walkers.size();
  for (int i = 0; i < missing; i++) {
    walkers.add(new Walker(tree));
  }
}

float integral = 0.0;
float kp = 100.0;
float ki = 0;
float maxOut = 800.0;
float minOut = 1.0;
float frameRateTarget = 5;

int iter(float error) {
  integral += error * ki;
  float out = (error * kp) + integral;
  if (out > maxOut) {
    out = maxOut;
  }
  if (out < minOut) {
    out = minOut;
  }
  return int(out);
}

void frameRateCheck() {
  iterations = iter(frameRate - frameRateTarget); 
  
  if (tree.elements.size() >= 10000) {
    simulationRun = false;
  }
}

void displayInfo() {
  log.begin();
  log.print("fps: " + String.format("%.2f",frameRate));
  int activeWalkers = walkers.size();
  log.print("walkers: " + String.valueOf(activeWalkers));
  log.print("iteration:" + String.valueOf(iterations));
  int treeSize = tree.elements.size();
  log.print("treeSize: " + String.valueOf(treeSize));
  log.print("elapsed: " + elapsedTime());
  log.print("grow rate: " + String.valueOf(growRate.value()));
}

String elapsedTime() {
  float totalSeconds = millis()/1000.0;
  int minutes = int(totalSeconds / 60);
  int seconds = int(totalSeconds) % 60;
  return String.format("%d", minutes)+"m:"+ String.format("%d",seconds) + "s";
}
