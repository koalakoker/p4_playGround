class DisplayInfo {
    int x;
    int y;
    DisplayInfo() {}
    void print(String txt) {
        text(txt, x, y);
        y += 20;
    }
    void begin() {
        x = 10;
        y = 15;
    }
}
