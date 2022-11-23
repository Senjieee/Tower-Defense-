//This function draws the INTRO screen.

void intro() {
  background(red);
  start.show();
  if (start.clicked) {
    mode = PLAY;
  }
  fill(blue);
  textSize(80);
  text("Tower Defense", width/2, height/3);
}
