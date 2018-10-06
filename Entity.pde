class Entity {
  PImage texture;
  PVector pos;
  PVector vel;
  PVector acc;
  int frames;
  boolean collhit;
  private boolean grav;
  Entity(PImage text, PVector p) {
    collhit = false;
    grav = true;
    texture = text;
    pos = p;
    vel = new PVector();
    acc = new PVector();
  }
  void tick() {
    int cx = round(pos.x/16);
    int cy = round((pos.y+texture.height)/16);
    pos.add(vel);
    vel.add(acc);
    if(grav && collhit == false) {
      vel.add(new PVector(0, 0.1));
    }
    if(tiles[cx][cy] != 0) {
      if(collhit == false) {
        collhit = true;
        enterCollision();
      }
    } else {
      if(collhit == true) {
        collhit = false;
      }
    }
    acc.mult(0);
    image(texture, pos.x, pos.y);
  }
  void enterCollision() {
    vel.y = 0;
  }
}
