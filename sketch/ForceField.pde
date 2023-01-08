class ForceField {
  int size;
  int cols, rows;
  float zoff = 0;
  PVector force[];
  
  ForceField(int size) {
    this.size = size;
    cols = floor(width / size);
    rows = floor(height / size);
    force = new PVector[rows * cols];
  }
  
  PVector force(float x, float y) {
    int col = constrain(floor(x / size), 0, cols - 1);
    int row = constrain(floor(y / size), 0, rows - 1);
    return force[col + row * cols];
  }
  
  void display() {
    float nInc = 0.04;
    float zInc = 0.005;
    stroke(255);
    noFill();
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        PVector p = new PVector(size,0);
        p.rotate(map(noise(col * nInc, row * nInc, zoff), 0, 1, -PI, PI));
        //line (col*size, row*size, (col*size) + p.x, (row*size) + p.y);
        p.setMag(0.01);
        force[col + row * cols] = p;
      }
    }
    zoff += zInc;
  }
}
