class DisplayInfo {
    int x;
    int y;
    DisplayInfo() {}
    void print(String txt) {
        fill(0);
        noStroke();
        text(txt, x, y);
        y += 20;
    }
    void begin() {
        x = 10;
        y = 15;
    }
}
