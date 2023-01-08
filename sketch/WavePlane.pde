void drLine(PVector v1, PVector v2) {
  line(v1.x, v1.y, v1.z, v2.x, v2.y, v2.z);
}

class WavePlane {
  
  int side;
  int elements;
  float speed;
  
  float t;
  int rows;
  int cols;
  
  float baseX;
  float baseY;
  
  WavePlane(int side, int elements, float speed ) {
    this.side = side;
    this.elements = elements;
    this.speed = speed;
    this.t = 0;
    
    baseX = -side / 2;
    baseY = -side / 2;
    // Number of rows and columns = elements + 1
    rows = elements + 1;
    cols = elements + 1;
    
    stroke(255);
  }
  
  int index(int col, int row) {
    return col + row * cols;
  }
  
  float zoff = 0;
  
  float quote(float x, float y, float t) {
    float xoff = map(x,-side/2,side,0,5);
    float yoff = map(y,-side/2,side,0,5);
    float n = noise(xoff, yoff, zoff);
    return map(n, 0, 1, 0, 100);
  }
  
  float x(int col) {
    return baseX + (col * side) / elements;
  }
  
  float y(int row) {
    return baseY + (row * side) / elements;
  }

  void drPlaneDot() {
    t += deltaTime;
    strokeWeight(1);
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        float x = this.x(col); 
        float y = this.y(row); 
        float z = quote(x, y, t);
        point(x, y, z);
      }
    }
  }
  
  void drPlaneLine() {
    t += deltaTime;
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        PVector v1 = new PVector(x(col), y(row), 0);
        v1.z = quote(v1.x, v1.y, t);
        if (col + 1 < cols) {
          PVector v2 = new PVector(x(col+1), y(row), 0);
          v2.z = quote(v2.x, v2.y, t);
          drLine(v1, v2);
        }
        if (row + 1 < rows) {
          PVector v3 = new PVector(x(col), y(row+1), 0);
          v3.z = quote(v3.x, v3.y, t);
          drLine(v1, v3);
        }
      }  
    }
  }
  
  void draw() { 
    translate(width/2, height/2);
    rotateX(1.2);
    rotateY(0);
    rotateZ(0);
    //drPlaneDot();
    drPlaneLine();  
    zoff += 0.01;
  }
}
