//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.

class Bullet {
  
  float x, y, vx, vy, d;
  int bulletLives;
  
  Bullet(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 15;
    bulletLives = 1;
  }
  
  void show() {
    stroke(black);
    strokeWeight(4);
    fill(yellowBullet);
    circle(x, y, d);
  }
  
  void act() {
    x = x + vx;
    y = y + vy;
    
    if (x < 0 || x > width - 200 || y < -100 || y > height) {
      bulletLives = 0;
    }
  }
}
