//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {
  
  final int PLACING = 0;
  final int PLACED = 1;
  
  float x, y;
  float cooldown, threshold;
  int towerMode;
  int towerType;
  
  Tower(int type) {
    x = mouseX;
    y = mouseY;
    cooldown = 0;
    towerMode = PLACING;
    towerType = type;
    if (towerType == GUN) threshold = 30;
    if (towerType == AOE) threshold = 30;
    if (towerType == SNIPER) threshold = 90;
  }
  
  void show() {
    if (towerMode == PLACED) {
      if (towerType == GUN) showGunTower();
      if (towerType == AOE) showAoeTower();
      if (towerType == SNIPER) showSniperTower();
    } else if (towerMode == PLACING) {
        if (towerType == GUN) showGunTower();
        if (towerType == AOE) showAoeTower();
        if (towerType == SNIPER) showSniperTower();
        x = mouseX;
        y = mouseY;
      if (mousePressed && mouseX < 800) {
        towerMode = PLACED;
        x = mouseX;
        y = mouseY;
      }
    }
  }
  
  void act() {
    if (towerType == GUN) actGunTower();
    if (towerType == AOE) actAoeTower();
    if (towerType == SNIPER) actSniperTower();
    }
  
  void showGunTower() {
    stroke(black);
    strokeWeight(4);
    fill(red);
    square(x, y, 40);
  }
  
  void showAoeTower() {
    if (cooldown >= 20) {
      stroke(red);
      strokeWeight(3);
      fill(red2);
      circle(x, y, 300);
    }
    stroke(black);
    strokeWeight(4);
    fill(blue);
    circle(x, y, 50);
  }
  
  void showSniperTower() {
    stroke(white);
    strokeWeight(4);
    fill(black);
    triangle(x-20, y+20, x+20, y+20, x, y-20);
  }
  
  void actGunTower() {
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;
      bullets.add(new Bullet(x, y, 0, -10, 15, yellowBullet)); //Up
      bullets.add(new Bullet(x, y, 0, 10, 15, yellowBullet)); //Down
      bullets.add(new Bullet(x, y, 10, 0, 15, yellowBullet)); //Right
      bullets.add(new Bullet(x, y, -10, 0, 15, yellowBullet)); //Left
    }
  }
  
  void actAoeTower() {
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;   
    }
    
    if (cooldown >= 20) {
      stroke(red);
      strokeWeight(3);
      fill(red2);
      circle(x, y, 300);
    }
    
    int i = 0;
    while (i < mobs.size()) {
      Mob myMob = mobs.get(i);
      if (dist(myMob.x, myMob.y, x, y) < 150 + myMob.d/2) {
        myMob.mobLives = myMob.mobLives - 1;
        cooldown = 0;
      }
      i++;
    }
  }
  
  void actSniperTower() {
    Mob firstMob = mobs.get(0);
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;
      stroke(red);
      strokeWeight(8);
      line(x, y, firstMob.x, firstMob.y);
      firstMob.mobLives = firstMob.mobLives - 3;
    }
    
    if (cooldown > 10) {
      stroke(purple);
      strokeWeight(2);
      line(x, y, firstMob.x, firstMob.y);
    }
  }
}
