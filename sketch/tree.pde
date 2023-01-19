class Tree {
  
  ArrayList<PVector> elements = new ArrayList<PVector>();
  PVector boundingRectTopLeft;
  PVector boundingRectBottomRight;
  float topLine;
  float bottomLine;
  float leftLine;
  float rigthLine;
  int r = walkerRadius;
  
  Tree() {
    boundingRectTopLeft = new PVector(width/2, height/2);
    boundingRectBottomRight = new PVector(width /2, height/2);
  }
  
  void add(PVector newElement) {
    elements.add(newElement);
    updateBoundingRect(newElement);
  }
  
  void draw() {
    for (int i = 0; i < tree.elements.size(); i++) {
      PVector pos = tree.elements.get(i);
      fill(255,0,100);
      noStroke();
      ellipse(pos.x, pos.y, walkerRadius * 2, walkerRadius * 2);
      //drawBoundingRect();
    }
  }

  boolean checkInside(Walker walker) {
    return ((walker.pos.x + walker.r > boundingRectTopLeft.x) &&
            (walker.pos.y + walker.r > boundingRectTopLeft.y) &&
            (walker.pos.x - walker.r < boundingRectBottomRight.x) &&
            (walker.pos.y - walker.r < boundingRectBottomRight.y));
  }

  void updateBoundingRect(PVector newElement) {
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
    int margin = 50;
    topLine = tree.boundingRectTopLeft.y - margin;
    bottomLine = tree.boundingRectBottomRight.y + margin;
    leftLine = tree.boundingRectTopLeft.x - margin;
    rigthLine = tree.boundingRectBottomRight.x + margin;
  }

  void drawBoundingRect() {
    stroke(0, 255, 0);
    noFill();
    rectMode(CORNERS);
    rect(boundingRectTopLeft.x, boundingRectTopLeft.y,
    boundingRectBottomRight.x, boundingRectBottomRight.y);
  }
}
