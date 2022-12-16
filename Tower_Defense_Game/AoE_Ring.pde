//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a 
//short period of time.

class AoE_Ring {
  
  float x, y, d;
  float cooldown;
  int ringLives;
  AoE_Ring(float _x, float _y, float _d) {
    x = _x;
    y = _y;
    d = _d;
    ringLives = 1;
  }
  
  void show() {
    stroke(red);
    strokeWeight(3);
    fill(red2);
    circle(x, y, d);
  }
}
