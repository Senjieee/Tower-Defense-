//This function draws the PLAY screen

void play() {
  map();
  animation();
}

void map() {
  background(green);
  stroke(yellow);
  fill(yellow);
  strokeWeight(50);
  line(0, 400, 200, 400);
  line(200, 400, 200, 200);
  line(200, 200, 450, 200);
  line(450, 200, 450, 600);
  line(450, 600, 300, 600);
  line(300, 600, 300, 500);
  line(300, 500, 600, 500);
  line(600, 500, 600, 400);
  line(600, 400, 800, 400);
  line(800, 400, 800, 300);
  line(800, 300, 1000, 300);

  int i = 0;
  while (i < 10) {
    nodes[i].show();
    i++;
  }
}

void animation() {
  mobs.show();
  mobs.act();
}
