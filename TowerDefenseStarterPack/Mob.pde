//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  
  float x, y, vx, vy;
  
  Mob(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
  }
  
  void show() {
    fill(greenSwamp);
    stroke(greenSwamp);
    strokeWeight(3);
    circle(x, y, 40);
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
  }
}
