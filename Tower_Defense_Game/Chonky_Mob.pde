class ChonkyMob extends Mob {
  
  ChonkyMob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 80;
    maxlives = 20 + waveCounter;
    mobLives = maxlives;
    value = 2000;
    fillColor = orange;
    strokeColor = black;
    speed = 0.5;
  }
}
