class Obj {
  float x;
  float y;
  float spd;
  float dir;
  final int sz;
  
  Obj(float x_, float y_, float spd_, float dir_, int sz_) {
    x = x_;
    y = y_;
    spd = spd_;
    dir = radians(dir_);
    sz = sz_;
  }

  void update() {
    x += cos(dir) * spd;
    y -= sin(dir) * spd;
    wrap();
  }

  void display(PShape shape) {
    pushMatrix();
    translate(x, y);
    rotate(-dir + HALF_PI);
    shape(shape, 0, 0, sz, sz);
    popMatrix();
  }

  void wrap() {
    if (x < -sz/2) {
      x = width + sz/2;
    }
    if (x > width + sz/2) {
      x = -sz/2;
    }
    if (y < -sz/2) {
      y = height + sz/2;
    }
    if (y > height + sz/2) {
      y = -sz/2;
    }
  }
}