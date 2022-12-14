//This function draws the GAMEOVER screen.

void gameOver() {
  map();
  animation();
  gameOverInterface();
  
  fill(red);
  textSize(80);
  text("YOU DIED", 450, 100);
}

void gameOverInterface() {
  stroke(white);
  fill(black);
  rect(900, height/2, 200, height);
}

void handleGameOverClicks() {
}
