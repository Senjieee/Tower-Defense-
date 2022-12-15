void mapselect() {
  mapSelectInterface();
  handleMapSelectButtons();
}

void mapSelectInterface() {
  background(black);
  fill(white);
  textSize(50);
  if (flash > 25) {
    text("MAP SELECT", width/2, 150);
  }
  
  map1Select.show();
  map2Select.show();
  noStroke();
  fill(green);
  rect(300, height/2, 280, 280, 30);
  fill(red);
  rect(700, height/2, 280, 280, 30);
}

void handleMapSelectButtons() {
  if (map1Select.clicked) {
    map = map1;
    mode = PLAY;
  }
  
  if (map2Select.clicked) {
    map = map2;
    mode = PLAY;
  }
}
