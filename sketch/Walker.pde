class Walker {
  PVector pos;
  boolean stuck = false;
  int r = walkerRadius;
  int rSq = 4 * r * r;
  
  Walker() {
    this.pos = new PVector(width / 2, height / 2);
  }
  
  void walk() {
    PVector vel = new PVector(random(-4,4), random(-4,4));
    this.pos.add(vel);
  }
  
  void draw() {
    fill(0);
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
