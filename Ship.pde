class Ship extends Obj {
  int timeDecel;
  int timeImmune;
  
  boolean left;
  boolean up;
  boolean right;
  boolean down;
  boolean space;
  boolean immune;

  final float maxSpeed = 10;
  final float accel = 0.1;
  final float decel = 0.2;
  final float handling = radians(3);

  Ship() {
    super(width/2, height/2, 0.0, 90.0, 56);
  }

  void update() {
    if (up) {
      if (spd < maxSpeed) {
        spd += accel;
      } else {
        spd += 1/(2*frameRate);
      }
    }
    if (left) {
      dir += handling;
    }
    if (right) {
      dir -= handling;
    }
    if (down) {
      hyperspace();
    }
    if (space) {
      shoot();
    }
    
    if (millis() - timeDecel >= 100) {
      spd -= decel;
      if (spd < 0) {
        spd = 0.0;
      }
      timeDecel = millis();
    }
    
    if (immune) {
      if (millis() - timeImmune >= 3000) {
        immune = false;
      }
    } 
    
    super.update();
  }

  void shoot() {
    if (projectiles.size() < maxProjs) {
      projectiles.add(new Proj(x + cos(dir)*sz/2, y - sin(dir)*sz/2, dir));
      space = false;

      if (sound != 0) {
        sounds[3*(sound-1)].trigger();
      }
    }
  }

  void display() {
    super.display(shipShape);
  }

  void hyperspace() {
    x = random(width);
    y = random(height);
    down = false;
  }

  void destroy() {
    x = width/2;
    y = height/2;
    spd = 0.0;
    dir = HALF_PI;
    lives -= 1;
    immune = true;
    timeImmune = millis();

    if (sound != 0) {
      sounds[2 + 3*(sound-1)].trigger();
    }

    if (lives == -1) {
      displayMessage("GAME OVER", "Score: " + score);
      startGame();
    }
  }
}