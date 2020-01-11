class Asteroid extends Obj {
  final int points;
  final int lvl;

  Asteroid(float x, float y, float spd, float dir, int lvl_) {
    super(x, y, spd, dir, asterSzLvls[lvl_]);
    points = asterPntLvls[lvl_];
    lvl = lvl_;
  }

  void display() {
    asterShape.setStrokeWeight(15 + 10*lvl);
    super.display(asterShape);
  }

  void destroy() {
    score += points;
    bonus += points;
    if (lvl < 2) {
      breakApart();
    }
    asteroids.remove(this);


    if (sound != 0) {
      sounds[1 + 3*(sound-1)].trigger();
    }
  }

  boolean hasCollided(float ix, float iy, float r) {
    return
      (ix + r > x-sz/2
      ||  ix - r > x-sz/2)
      && (ix + r < x+sz/2
        ||  ix - r < x+sz/2)

        && (iy + r > y-sz/2
          || iy - r > y-sz/2)
          && (iy + r < y+sz/2
            || iy - r < y+sz/2);
  }

  void breakApart() {
    asteroids.add(new Asteroid(x, y, random(asterMinSpeed, asterMaxSpeed)*(lvl+1), random(360), lvl+1));
    asteroids.add(new Asteroid(x, y, random(asterMinSpeed, asterMaxSpeed)*(lvl+1), random(360), lvl+1));
  }
}