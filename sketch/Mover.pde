class Mover {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxSpeed = 2;
  
  Mover(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
  }
  
  void update() {
    velocity.add(acceleration);
    if (velocity.mag() > maxSpeed) {
      velocity.setMag(maxSpeed);
    }
    acceleration.mult(0);
    position.add(velocity);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void display(int moverColor) {
    noStroke();
    fill(moverColor, 50);
    circle(position.x, position.y, 1);
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
