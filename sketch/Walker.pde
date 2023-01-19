class Walker {
  PVector pos;
  boolean stuck = false;
  int r = walkerRadius;
  int rSq = 4 * r * r;
  
  Walker(Tree tree) {
    this.pos = bornPosition(tree);
  }
  
  PVector bornPosition(Tree tree) {
    int dir = floor(random(4));
    if (dir == 0) {
      pos = new PVector(floor(random(tree.leftLine, tree.rigthLine)), tree.topLine);
    } else if (dir == 1) {
      pos = new PVector(floor(random(tree.leftLine, tree.rigthLine)), tree.bottomLine);
    } else if (dir == 2) {
      pos = new PVector(tree.leftLine, floor(random(tree.topLine, tree.bottomLine)));
    } else {
      pos = new PVector(tree.rigthLine, floor(random(tree.topLine, tree.bottomLine)));
    }
    return pos;
  }
  
  void walk() {
    PVector vel = new PVector(random(-4,4), random(-4,4));
    this.pos.add(vel);
    pos.x = constrain(pos.x, tree.leftLine, tree.rigthLine);
    pos.y = constrain(pos.y, tree.topLine, tree.bottomLine);
  }
  
  void draw() {
    fill(255);
    noStroke();
    ellipse(pos.x, pos.y, 2 * r, 2 * r);
  }
  
  boolean checkStuck(Tree tree) {
    if (tree.checkInside(this)) {
      ArrayList<PVector> other = tree.elements;
      for (int i = other.size() - 1; i >= 0; i--) {
        PVector posB = other.get(i);
          if (distSq(pos, posB) < rSq) {
            if (random(1) < stickyness) {
              this.stuck = true;
              return true;
            }
        }
      }
    }
    return false;  
  }

  float distSq(PVector a, PVector b) {
    int xD = int(a.x) - int(b.x);
    int yD = int(a.y) - int(b.y);
    int distSqInt = (xD * xD) + (yD * yD);
    return float(distSqInt);
  }
  
}
