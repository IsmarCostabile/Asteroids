class Button {
  float x;
  float y;
  int sz;

  Button(float x_, float y_, int sz_) {
    x = x_;
    y = y_;
    sz = sz_;
  }

  boolean overButton() {
    return mouseX >= x-sz/2 && mouseX <= x+sz/2 && 
      mouseY >= y-sz/2 && mouseY <= y+sz/2;
  }

  void update() {
    stroke(255);
    strokeWeight(2);
    if (overButton()) {
      fill(100);
    } else {
      noFill();
    }
    rect(x, y, sz, sz);
  }
}