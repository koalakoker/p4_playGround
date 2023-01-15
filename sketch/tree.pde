class Tree {
  
  ArrayList<PVector> elements = new ArrayList<PVector>();
  PVector boundingRectTopLeft;
  PVector boundingRectBottomRight;
  int r = walkerRadius;
  
  Tree() {
    boundingRectTopLeft = new PVector(width/2, height/2);
    boundingRectBottomRight = new PVector(width /2, height/2);
  }
  
  void add(PVector newElement) {
    elements.add(newElement);
    if (newElement.x - r < boundingRectTopLeft.x) {
      boundingRectTopLeft.x = newElement.x - r;
    }
    if (newElement.y - r < boundingRectTopLeft.y) {
      boundingRectTopLeft.y = newElement.y - r;
    }
    if (newElement.x + r > boundingRectBottomRight.x) {
      boundingRectBottomRight.x = newElement.x + r;
    }
    if (newElement.y + r > boundingRectBottomRight.y) {
      boundingRectBottomRight.y = newElement.y + r;
    }
  }
  
  void draw() {
    for (int i = 0; i < tree.elements.size(); i++) {
      PVector pos = tree.elements.get(i);
      fill(255,0,100);
      noStroke();
      ellipse(pos.x, pos.y, walkerRadius * 2, walkerRadius * 2);

      stroke(0, 255, 0);
      noFill();
      rectMode(CORNERS);
      rect(boundingRectTopLeft.x, boundingRectTopLeft.y,
      boundingRectBottomRight.x, boundingRectBottomRight.y);
    }
  }

  boolean checkInside(Walker walker) {
    return ((walker.pos.x + walker.r > boundingRectTopLeft.x) &&
            (walker.pos.y + walker.r > boundingRectTopLeft.y) &&
            (walker.pos.x - walker.r < boundingRectBottomRight.x) &&
            (walker.pos.y - walker.r < boundingRectBottomRight.y));
  }
}
