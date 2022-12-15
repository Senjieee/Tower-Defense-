//This function draws the BUILD screen

void build() {
  map();
  buildInterface();
  handleBuildButtonClicks();
  animation();
  if (flash > 25) {
    fill(orange);
    textSize(40);
    text("BUILD MODE", 450, 100);
  }
}

void buildInterface() {
  stroke(white);
  fill(black);
  rect(900, height/2, 200, height);
  
  play.show();
  gun.show();
  aoe.show();
  sniper.show();
}

void handleBuildButtonClicks() {
  if (play.clicked) {
    mode = PLAY;
  }
  
  if (gun.clicked && money >= 5000) {
    towers.add(new Tower(0, 0, 0, 60));
  }
  
  if (aoe.clicked && money >= 10000) {
  }
  
  if (sniper.clicked && money >= 10000) {
  }
}
