Mover movers[] = new Mover[10000];
ForceField field; 
int startTime;
int moverColor = 255;

void setup() {
  size(800, 600, P2D);
  fullScreen(P2D);
  
  field = new ForceField(30);
  field.display();
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(width), random(height));
    Mover mover = movers[i];
    float x = mover.position.x;
    float y = mover.position.y;
    PVector v = field.force(x, y);
    v.setMag(mover.maxSpeed);
    mover.velocity = v;
  }
  
  background(0);
  
  startTime = millis();
}

void draw() {
  
  field.display();
  for (int i = 0; i < movers.length; i++) {
    Mover mover = movers[i];
    float x = mover.position.x;
    float y = mover.position.y;
    PVector force = field.force(x, y);
    mover.applyForce(force);
    mover.update();
    mover.edge();
    mover.display(moverColor);
  }
  
  if ((millis() - startTime) > 20000) {
    if (moverColor == 255) {
      moverColor = 0;
    } else {
      moverColor = 255;
    }
    startTime = millis();
  }
}
