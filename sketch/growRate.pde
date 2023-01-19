class GrowRate {
  float lastTime = 0;
  int lastTreeSize = 0;
  int gr = 0;
  GrowRate(){}
  int value() {
    int treeSize = tree.elements.size();
    if (lastTime == 0) {
      lastTime = millis();
      lastTreeSize = treeSize;
    }
    if (millis() >= lastTime + 1000) {
      lastTime = millis();
      gr = treeSize - lastTreeSize;
      lastTreeSize = treeSize;
    }
    return gr;
  }
}
