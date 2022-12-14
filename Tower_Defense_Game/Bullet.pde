//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.

class Bullet {
  
  float x, y, vx, vy, d;
  int bulletLives;
  color bulletColor;
  
  Bullet(float _x, float _y, float _vx, float _vy, float _d, color _bulletColor) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = _d;
    bulletLives = 1;
    bulletColor = _bulletColor;
  }
  
  void show() {
    stroke(black);
    strokeWeight(4);
    fill(bulletColor);
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
