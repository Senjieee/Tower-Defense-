//Johnny Geng
//1-2
//Oct 24
//Tower Defense Game

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
int mode;

PFont doom;

//Pallette
color red = color(255, 0, 0);
color blue = color(24, 0, 255);
color yellow = color(255, 247, 0);
color green = color(0, 255, 44);
color orange = color(255, 132, 0);
color purple = color(195, 0, 255);
color grey = color(59, 53, 54);
color black = color(0);
color white = color(255);

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start;

//Collections of objects

//Images and Gifs

//Fonts


// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
  doom = createFont("DooM.ttf", 200);
  textFont(doom);
}

void initializeVariables() {
  //Load Images & Gifs

  //Load Fonts

  //Create Collections of Objects
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/5, 200, 100, white, black);

  //PLAY - Next Wave, To Build Mode

  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE

  //GAMEOVER - Reset
}

void makeNodes() {
  //Plot the nodes on the map
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
  
  textSize(20);
  fill(black);
  text(mouseX + ", " + mouseY, mouseX, mouseY-20);
}
