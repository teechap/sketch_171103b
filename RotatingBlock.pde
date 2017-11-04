
class RotatingBlock {
  PVector loc;
  float xDelta, rotationDelta, rotation;
  int w, h;
  color c;
  
  RotatingBlock() {
    this.xDelta = random(1, 18);
    this.rotation = random(0, 360);
    this.w = width/10;
    this.h = w/4;
    this.loc = new PVector(random(-width/2, -w), random(-(w*3),height+(w*3)));
    this.rotationDelta = random(1, 5);
    this.c = randomColor();
  }
  
  boolean isAlive() {
    return loc.x < (width + w);
  }

  void update() {
    loc.x += xDelta;
    rotation += rotationDelta;
  }
  
  void display() {
    strokeWeight(2);
    stroke(0);
    fill(c);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(radians(rotation));
    translate(-w/2, -h/2);
    rect(0,0,w,h);
    popMatrix();
  }
}