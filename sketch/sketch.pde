ArrayList<Walker> walkers = new ArrayList<Walker>();
int walkersNum = 400;
int iterations = 200;
int walkerRadius = 4;

ArrayList<PVector> tree = new ArrayList<PVector>();

void setup() {
  size(800,600);
  fullScreen();
  tree.add(new PVector(width/2, height/2));
  for (int i = 0; i < walkersNum; ++i) {
    walkers.add(new Walker());  
  }
   
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
  int missing = walkersNum - walkers.size();
  for (int i = 0; i < missing; i++) {
    walkers.add(new Walker());
  }
}
