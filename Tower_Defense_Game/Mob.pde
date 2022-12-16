//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  
  float x, y, vx, vy, d;
  float mobLives, maxlives;
  int value;
  color fillColor, strokeColor;
  float speed;
  
  Mob(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 40;
    maxlives = 5 + waveCounter/5;
    mobLives = maxlives;
    speed = 1;
    value = 1000;
    strokeColor = black;
    fillColor = purple;
  }
  
  void show() {
    fill(fillColor);
    stroke(strokeColor);
    strokeWeight(3);
    circle(x, y, d);
    healthbar();
  }
  
  void act() {
    
    x = x + vx*speed;
    y = y + vy*speed;
    
    int i = 0;
    while (i < nodes.length) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < 1) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    }
    
    i = 0;
    while (i < bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
        mobLives = mobLives - 1;
        myBullet.bulletLives--;
      }
      i++;
    }
  }
  
  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d)-2, 54, 15);//background
    fill(red);
    rect(x-25, y-(d), 50, 10);
    fill(green);
    rect(x-25, y-(d), mobLives*50/maxlives, 10);
    rectMode(CENTER);
  }
}
