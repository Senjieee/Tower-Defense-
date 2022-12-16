class SpeedyMob extends Mob {
  
  SpeedyMob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 20;
    maxlives = 3 + waveCounter/10;
    mobLives = maxlives;
    value = 3000;
    fillColor = black;
    strokeColor = white;
    speed = 5 + waveCounter/10;
  }
}
