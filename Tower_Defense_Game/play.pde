//This function draws the PLAY screen

void play() {
  map();
  animation();
  playInterface();
  handleButtonClicks();
  
  if(lives <= 0) {
    mode = GAMEOVER;
  }
}

void map() {
  if (map == map1) {
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
    }  else if (map == map2) {
    background(orange);
    stroke(black);
    fill(black);
    strokeWeight(50);
    line(0, 400, 200, 400);
    line(200, 400, 200, 700);
    line(200, 700, 400, 700);
    line(400, 700, 400, 300);
    line(400, 300, 300, 300);
    line(300, 300, 300, 200);
    line(300, 200, 600, 200);
    line(600, 200, 600, 500);
    line(600, 500, 800, 500);
  }
}

void playInterface() {
  stroke(white);
  strokeWeight(3);
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
  
  build.show();
  reset.show();
  menu2.show();
}

void animation() {
  int i = 0;
  while (i < mobs.size()) {
    Mob myMob = mobs.get(i);
    if (mode == PLAY) {
      myMob.act();
    }
    myMob.show();
    if (myMob.mobLives <= 0) {
      mobs.remove(i);
      money = money + myMob.value;
    } else if (myMob.x >= myMob.d/2 + 800) {
      mobs.remove(i);
      lives--;
    } else {
      i++;
    }
  }
  
  i = 0; 
  while (i < towers.size()) {
    Tower myTower = towers.get(i);
    if (mobs.size() > 0) {
      if (mode == PLAY) {
        myTower.act();
      }
    }
    myTower.show();
    i++;
  }
  
  i = 0; 
  while (i < bullets.size()) {
    Bullet myBullet = bullets.get(i);
    if (mode == PLAY) {
      myBullet.act();
    }
    myBullet.show();
    if (myBullet.bulletLives <= 0) {
      bullets.remove(i);
    } else {
      i++;
    }
  }
  
  i = 0;
  while (i < rings.size()) {
    AoE_Ring myRing = rings.get(i);
    if (mobs.size() >= 0) {
      myRing.show();
    }
    if (myRing.ringLives <= 0) {
      rings.remove(i);
    } else {
      i++;
    }
  }
  
  fill(black);
  textSize(30);
  textAlign(CORNER);
  text("Lives:" +  lives, 30, 45);
  text("Money:$" +  money, 370, 45);
  textAlign(CENTER, CENTER);
  text("Wave:" + waveCounter, 270, 30);
}

void handleButtonClicks() {
  if (nextWave.clicked && mobs.size() == 0) {
    int x = 0;
    while (mobs.size() < waveCounter + 1) {
      mobs.add(new Mob(x, 400, 1, 0));
      x=x-50;
    }
    
    if (waveCounter % 3 == 0) {
      int i = 0;
      x = 50;
      while (i < waveCounter/3) {
        mobs.add(new ChonkyMob(x, 400, 1, 0));
        x = x - 100;
        i++;
      }
    }
    
    if (waveCounter % 3 == 0) {
      int i = 0;
      x = 0;
      while (i < waveCounter/3) {
        mobs.add(new SpeedyMob(x, 400, 1, 0));
        x = x - 50;
        i++;
      }
    }
    waveCounter = waveCounter + 1;
  }
  
  if (build.clicked) {
    mode = BUILD;
  }
  
  if (reset.clicked) {
    reset();
  }
  
  if (menu2.clicked) {
    reset();
    mode = INTRO;
  }
}
