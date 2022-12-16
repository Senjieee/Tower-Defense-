//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  
  float x, y, vx, vy, d;
  float mobLives;
  float healthBar;
  
  Mob(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 40;
    mobLives = 3;
    healthBar = map(mobLives, 3, 0, 50, 0);
  }
  
  void show() {
    fill(purple);
    stroke(black);
    strokeWeight(3);
    circle(x, y, d);
    healthbar();
  }
  
  void act() {
    
    x = x + vx;
    y = y + vy;
    
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
    rect(x-25, y-(d), mobLives*50/3, 10);
    rectMode(CENTER);
  }
}
