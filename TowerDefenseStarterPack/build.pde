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
  tower.show();
}

void handleBuildButtonClicks() {
  if (play.clicked) {
    mode = PLAY;
  }
  
  if (tower.clicked) {
    towers.add(new Tower(0, 0, 0, 60));
  }
}
