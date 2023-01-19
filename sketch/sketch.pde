ArrayList<Walker> walkers = new ArrayList<Walker>();
int walkersNum = 100;
int iterations = 800;
int walkerRadius = 2;
float stickyness = 0.1;
Tree tree;
DisplayInfo log = new DisplayInfo();

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
  background(0);
  
  tree.draw();

  frameRateCheck();

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
  displayInfo();
}

void reborn() {
  int missing = walkersNum - walkers.size();
  for (int i = 0; i < missing; i++) {
    walkers.add(new Walker(tree));
  }
}

void frameRateCheck() {
  if (frameRate < 30) {
    if (walkersNum > 50) {
      walkersNum--;
    } else {
      if (iterations > 1) {
        iterations--;
      } else {
        noLoop();
      }
    }
    
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
  
  
  log.print("grow rate: " + String.valueOf(growRate));
}

String elapsedTime() {
  float totalSeconds = millis()/1000.0;
  int minutes = int(totalSeconds / 60);
  int seconds = int(totalSeconds) % 60;
  return String.format("%d", minutes)+"m:"+ String.format("%d",seconds) + "s";
}
