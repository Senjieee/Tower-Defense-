//This function draws the PLAY screen

void play() {
  map();
  animation();
  playInterface();
  handleButtonClicks();
}

void map() {
  background(green);
  stroke(yellow);
  fill(yellow);
  strokeWeight(50);
  line(0, 400, 200, 400);
  line(200, 400, 200, 200);
  line(200, 200, 400, 200);
  line(400, 200, 400, 600);
  line(400, 600, 300, 600);
  line(300, 600, 300, 500);
  line(300, 500, 500, 500);
  line(500, 500, 500, 400);
  line(500, 400, 600, 400);
  line(600, 400, 600, 300);
  line(600, 300, 800, 300);

  int i = 0;
  while (i < 10) {
    nodes[i].show();
    i++;
  }
}

void playInterface() {
  stroke(white);
  fill(black);
  rect(900, height/2, 200, height);
  
  fill(white);
  textSize(20);
  text("Next Wave", 900, 30);
  nextWave.show();
  if (mobs.size() == 0) {
    nextWave.normal = green;
    nextWave.highlight = white;
  } else {
    nextWave.normal = grey;
    nextWave.highlight = grey;
  }
  
  fill(black);
  text("Wave:" + waveCounter, 100, 30);
}

void animation() {
  int i = 0;
  while (i < mobs.size()) {
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    if (myMob.lives <= 0) {
      mobs.remove(i);
    } else {
      i++;
    }
  }
  
  i = 0; 
  while (i < towers.size()) {
    Tower myTower = towers.get(i);
    if (mobs.size() > 0) {
      myTower.act();
    }
    myTower.show();
    i++;
  }
  
  i = 0; 
  while (i < bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.lives <= 0) {
      bullets.remove(i);
    } else {
      i++;
    }
  }
}

void handleButtonClicks() {
  if (nextWave.clicked && mobs.size() == 0) {
    mobs.add(new Mob(0, 400, 1, 0));
    waveCounter++;
  }
}
