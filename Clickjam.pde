boolean mouseHeld = false;
PImage[] img;
int[][] tiles;
int wx = 50;
int wy = 50;
Entity e;

void setup() {
  noCursor();
  img = new PImage[3];
  img[0] = loadImage("data/img/brick.png");
  img[1] = loadImage("data/img/enemy.png");
  img[2] = loadImage("data/img/enemy2.png");
  tiles = new int[wx][wy];
  for(int i = 0; i < wx; i++) {
    for(int j = 0; j < wy; j++) {
      tiles[i][j] = 1;
    }
  }
  for(int i = 10; i < 30; i++) {
    for(int j = 10; j < 30; j++) {
      tiles[i][j] = 0;
    }
  }
  e = new Entity(img[1], new PVector(170, 170));
}
void settings() {
  size(800, 800);
}
void draw() {
  for(int i = 0; i < height; i++) {
    color k = lerpColor(color(128, 0, 50), color(128, 0, 200), float(i+20)/float(height));
    stroke(red(k), green(k), blue(k));
    line(0, i, width, i); 
  }
  noStroke();
  for(int i = 0; i < wx; i++) {
    for(int j = 0; j < wy; j++) {
      if(tiles[i][j] != 0) {
        image(img[tiles[i][j]-1], i*16, j*16);
      }
    }
  }
  e.tick();
  if(!mouseHeld) {
    rect(mouseX-10, mouseY-10, 20, 20);
  } else {
    rect(mouseX-7, mouseY-7, 14, 14);
  }
}
void mousePressed() {
  mouseHeld = true;
}
void mouseReleased() {
  mouseHeld = false;
}
void loadLevel() {
  
}
