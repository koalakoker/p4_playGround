class Walker {
  PVector pos;
  boolean stuck = false;
  int r = walkerRadius;
  int rSq = 4 * r * r;
  
  Walker() {
    this.pos = bornPosition();
  }
  
  PVector bornPosition() {
    int dir = floor(random(4));
    if (dir == 0) {
      pos = new PVector(floor(random(width)), 0);
    } else if (dir == 1) {
      pos = new PVector(floor(random(width)), height);
    } else if (dir == 2) {
      pos = new PVector(0, floor(random(height)));
    } else {
      pos = new PVector(width, floor(random(height)));
    }
    return pos;
  }
  
  void walk() {
    PVector vel = new PVector(random(-2,2), random(-2,2));
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
      for (int i = 0; i < other.size(); i++) {
        PVector posB = other.get(i);
        if (distSq(pos, posB) < rSq) {
          this.stuck = true;
          return true;
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
