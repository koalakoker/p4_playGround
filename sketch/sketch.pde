Mover movers[] = new Mover[100];

void setup() {
  size(800,600,P2D);
  fullScreen(P2D);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(width), random(height));
    movers[i].velocity = new PVector(random(10), random(10));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < movers.length; i++) {
    Mover mover = movers[i];
    mover.update();
    mover.edge();
    mover.display();
  }
}
