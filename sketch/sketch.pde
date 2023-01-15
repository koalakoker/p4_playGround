ArrayList<Walker> walkers = new ArrayList<Walker>();
int walkersNum = 800;
int iterations = 400;
int walkerRadius = 2;
int lastTime;
Tree tree = new Tree();

void setup() {
  size(800,600);
  fullScreen();
  tree.add(new PVector(width/2, height/2));
  for (int i = 0; i < walkersNum; ++i) {
    walkers.add(new Walker());  
  }
  textSize(20); 
}

void draw() {
  background(0);
  
  for (int i = 0; i < tree.size(); i++) {
    PVector pos = tree.get(i);
    fill(255,0,100);
    ellipse(pos.x, pos.y, walkerRadius * 2, walkerRadius * 2);
  }

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
    walkers.add(new Walker());
  }
}

void displayInfo() {
  int deltaTime = millis() - lastTime;
  lastTime = millis();
  int fps = 1000/deltaTime;
  text("fps:" + String.valueOf(fps), 10, 15);
  int activeWalkers = walkers.size();
  text("walkers:" + String.valueOf(activeWalkers), 10, 35);
}
