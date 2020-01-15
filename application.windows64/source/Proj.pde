class Proj {  
  float x;
  float y;
  float dx;
  float dy;
  final int sz;
  final float spd;

  Proj(float x_, float y_, float dir) {
    sz = 5;
    spd = 15;
    x = x_;
    y = y_;
    dx = cos(dir) * spd;
    dy = sin(dir) * spd;
  }
  
  void update() {
    x += dx; 
    y -= dy;
  }

  void display() {
    fill(255);
    noStroke();
    ellipse(x, y, sz, sz);
  }

  boolean outOfBounds() {
    return x < 0 || x > width || y < 0 || y > height;
  }
}
