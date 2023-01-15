class Walker {
  PVector pos;
  boolean stuck = false;
  int r = walkerRadius;
  
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
