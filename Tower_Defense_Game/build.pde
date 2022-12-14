//This function draws the BUILD screen

void build() {
  map();
  buildInterface();
  handleBuildButtonClicks();
  animation();
  if (flash > 25) {
    fill(yellow);
    textSize(40);
    text("BUILD MODE", 450, 100);
  }
}

void buildInterface() {
  stroke(white);
  fill(black);
  strokeWeight(3);
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
    towers.add(new Tower(GUN));
    money = money - 5000;
  }
  
  if (aoe.clicked && money >= 8000) {
    towers.add(new Tower(AOE));
    money = money - 8000;
  }
  
  if (sniper.clicked && money >= 10000) {
    towers.add(new Tower(SNIPER));
    money = money - 10000;
  }
}
