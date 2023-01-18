class Walker {
  PVector pos;
  boolean stuck = false;
  int r = walkerRadius;
  int rSq = 4 * r * r;
  
  Walker(Tree tree) {
    this.pos = bornPosition(tree);
  }
  
  PVector bornPosition(Tree tree) {
    float topLine = tree.boundingRectTopLeft.y / 2;
    float bottomLine = (height + tree.boundingRectBottomRight.y) / 2;
    float leftLine = tree.boundingRectTopLeft.x / 2;
    float rigthLine = (width + tree.boundingRectBottomRight.x) / 2;

    int dir = floor(random(4));
    if (dir == 0) {
      pos = new PVector(floor(random(leftLine, rigthLine)), topLine);
    } else if (dir == 1) {
      pos = new PVector(floor(random(leftLine, rigthLine)), bottomLine);
    } else if (dir == 2) {
      pos = new PVector(leftLine, floor(random(topLine, bottomLine)));
    } else {
      pos = new PVector(rigthLine, floor(random(topLine, bottomLine)));
    }
    return pos;
  }
  
  void walk() {
    PVector vel = new PVector(random(-4,4), random(-4,4));
    this.pos.add(vel);
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
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
