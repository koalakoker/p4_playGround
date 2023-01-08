class Mover {
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Mover(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
  }
  
  void update() {
    velocity.add(acceleration);
    acceleration.mult(0);
    position.add(velocity);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void display() {
    noStroke();
    fill(255);
    circle(position.x, position.y, 5);
  }
  
  void edge() {
    if (position.x < 0) {
      position.x = width; 
    }
    if (position.x > width) {
      position.x = 0; 
    }
    if (position.y < 0) {
      position.y = height; 
    }
    if (position.y > height) {
      position.y = 0; 
    }
  }
}
