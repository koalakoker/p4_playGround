class Walker {
  PVector pos;
  boolean stuck = false;
  int r = 8;
  
  Walker(int x, int y) {
    this.pos = new PVector(x, y);
  }
  
  void walk() {
    PVector vel = new PVector(random(-2,2), random(-2,2));
    this.pos.add(vel);
  }
  
  void draw() {
    fill(255);
    ellipse(pos.x, pos.y, 2 * r, 2 * r);
  }
  
  boolean checkStuck(ArrayList<PVector> other) {
    for (int i = 0; i < other.size(); i++) {
      PVector posB = other.get(i);
      if (dist(pos.x, pos.y, posB.x, posB.y) < 2 * r) {
        this.stuck = true;
        return true;
      }
    }
    return false;  
  }
  
}
