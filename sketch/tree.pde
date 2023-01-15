class Tree {
  
  ArrayList<PVector> elements = new ArrayList<PVector>();
  
  Tree() {
  }
  
  void add(PVector newElement) {
    elements.add(newElement);
  }
  
  int size() {
    return elements.size();
  }
  
  PVector get(int i) {
    return elements.get(i);
  }
  
}
