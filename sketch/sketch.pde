ArrayList<Walker> walkers = new ArrayList<Walker>();
int walkersNum = 100;
int iterations = 800;
int walkerRadius = 2;
float stickyness = 0.1;
Tree tree;

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
  text("fps: " + String.valueOf(frameRate), 10, 15);
  int activeWalkers = walkers.size();
  text("walkers: " + String.valueOf(activeWalkers), 10, 35);
  int treeSize = tree.elements.size();
  text("treeSize: " + String.valueOf(treeSize), 10, 55);
  text("elapsed: " + String.valueOf(millis()/1000.0), 10, 75);

}
