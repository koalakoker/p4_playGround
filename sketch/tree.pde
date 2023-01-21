class Tree {
  
  ArrayList<PVector> elements = new ArrayList<PVector>();
  PVector boundingCenter;
  float boundingRadius;
  float marginRadius;
  int r = walkerRadius;
  
  Tree() {
    boundingCenter = new PVector(width/2, height/2);
    boundingRadius = startingRadius;
  }
  
  void add(PVector newElement) {
    elements.add(newElement);
    updateBounding(newElement);
  }
  
  void draw() {
    for (int i = 0; i < tree.elements.size(); i++) {
      PVector pos = tree.elements.get(i);
      fill(0);
      noStroke();
      ellipse(pos.x, pos.y, walkerRadius * 2, walkerRadius * 2);
    }
    drawBounding();
  }

  boolean checkInsideBounding(PVector pos) {
    float dist = PVector.sub(boundingCenter, pos).mag();
    return (dist <  boundingRadius);
  }
  
  boolean checkInsideMargin(PVector pos) {
    float dist = PVector.sub(boundingCenter, pos).mag();
    return (dist <  marginRadius);
  }

  void updateBounding(PVector newElement) {
    float dist = PVector.sub(boundingCenter, newElement).mag();
    if (dist < boundingRadius) {
      boundingRadius = dist;
    }
    
    marginRadius = boundingRadius - margin;
  }

  void drawBounding() {
    stroke(0, 255, 0);
    noFill();
    circle(boundingCenter.x, boundingCenter.y, boundingRadius * 2);
  }
}
