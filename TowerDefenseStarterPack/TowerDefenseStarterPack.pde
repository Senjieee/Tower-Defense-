//Johnny Geng
//1-2
//Oct 24
//Tower Defense Game

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
final int MAPSELECT = 4;

final int map1 = 1;
final int map2 = 2;

int mode;
int map;
int waveCounter;
int flash;
int lives;
int money;

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
color greenSwamp = color(32, 100, 28);
color yellowBullet = color(255, 196, 0);

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start, nextWave, build, play, gun, sniper, aoe, menu, retry, map1Select, map2Select;

//Collections of objects
Node[] nodes;
ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;

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
  waveCounter = 0;
}

void initializeVariables() {
  //Load Images & Gifs

  //Load Fonts

  //Create Collections of Objects
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  
  lives = 3;
  money = 10000;
  waveCounter = 0;
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/5, 200, 100, white, black);

  //PLAY - Next Wave, To Build Mode
  nextWave = new Button("NEXT", 900, 100, 140, 100, green, white);
  build = new Button("BUILD", 900, 220, 140, 100, green, white);
  play = new Button("PLAY", 900, 100, 140, 100, green, white);
  gun = new Button("GUN", 900, 220, 140, 100, blue, white);
  aoe = new Button("AOE", 900, 340, 140, 100, blue, white);
  sniper = new Button("SNIPE", 900, 460, 140, 100, blue, white);
  menu = new Button("MENU", 900, 100, 140, 100, green, white);
  retry = new Button("AGAIN", 900, 220, 140, 100, green, white);
  map1Select = new Button("", 700, height/2, 300, 300, white, yellow);
  map2Select = new Button("", 300, height/2, 300, 300, white, yellow);

  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE

  //GAMEOVER - Reset
}

void makeNodes() {
  nodes = new Node[10];
  //Plot the nodes on the map
  nodes[0] = new Node(200, 400, 0, -1);
  nodes[1] = new Node(200, 200, 1, 0);
  nodes[2] = new Node(400, 200, 0, 1);
  nodes[3] = new Node(400, 600, -1, 0);
  nodes[4] = new Node(300, 600, 0, -1);
  nodes[5] = new Node(300, 500, 1, 0);
  nodes[6] = new Node(500, 500, 0, -1);
  nodes[7] = new Node(500, 400, 1, 0);
  nodes[8] = new Node(600, 400, 0, -1);
  nodes[9] = new Node(600, 300, 1, 0);
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
  } else if (mode == MAPSELECT) {
    mapselect();
  }
  
  textSize(20);
  fill(black);
  text(mouseX + ", " + mouseY, mouseX, mouseY-20);
  
  flash++;
  if (flash > 50) {
    flash = 0;
  }
}
