class DisplayInfo {
    int x;
    int y;
    DisplayInfo() {}
    void print(String txt) {
        fill(255, 255, 255);
        noStroke();
        text(txt, x, y);
        y += 20;
    }
    void begin() {
        x = 10;
        y = 15;
    }
}
