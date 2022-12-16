//This function draws the GAMEOVER screen.

void gameOver() {
  map();
  animation();
  gameOverInterface();
  handleGameOverClicks();
  
  fill(red);
  textSize(80);
  if (flash > 15) {
    text("YOU DIED", 400, 100);
  }
}

void gameOverInterface() {
  stroke(white);
  fill(black);
  rect(900, height/2, 200, height);
  
  menu.show();
  retry.show();
}

void handleGameOverClicks() {
  if (menu.clicked) {
    reset();
    mode = INTRO;
  }
  if (retry.clicked) {
    reset();
    mode = PLAY;
  }
}

void reset() {
  lives = 3;
  money = 10000;
  waveCounter = 0;
  towers = new ArrayList<Tower>();
  mobs = new ArrayList<Mob>();
  bullets = new ArrayList<Bullet>();
}
