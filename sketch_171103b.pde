color[] colors = {
  color(58, 62, 59),
  color(234, 78, 91),
  color(247, 240, 220),
  color(36, 172, 180),
  color(178, 204, 185),
};

color randomColor() {
  return colors[(int) random(colors.length)];
}


int numBlocks = 75;
RotatingBlock[] blocks;

void setup() {
  size(1000,1000);
  nextColors();
  color bg = lerpColor(colorFrom, colorTo, colorLerp);
  background(bg);
  blocks = new RotatingBlock[numBlocks];
  for (int i = 0; i < numBlocks; i++) {
    blocks[i] = new RotatingBlock();
  }
}

float colorLerp = 0;
color colorFrom;
color colorTo;
int colorFromIdx = 0;
int colorToIdx = 1;
int pauseFrames = 60;

void nextColors() {
  colorLerp = 0;
  pauseFrames = 60;
  colorToIdx = (colorToIdx + 1) % colors.length;
  colorFromIdx = (colorFromIdx + 1) % colors.length;
  colorTo = colors[colorToIdx];
  colorFrom = colors[colorFromIdx];
}

void draw() {
  if (colorLerp > 1) {
    nextColors();
  } else {
    if (pauseFrames > 0) {
      pauseFrames -= 1;
    } else {
      colorLerp += 0.004;
    }
  }
  color bg = lerpColor(colorFrom, colorTo, colorLerp);
  background(bg);
  
  for (int i = 0; i < numBlocks; i++) {
    RotatingBlock b = blocks[i];
    if (b.isAlive()) {
      b.update();
      b.display();
    } else {
      RotatingBlock addedBlock = new RotatingBlock();
      addedBlock.display();
      blocks[i] = addedBlock;
    }
  }
  if (frameCount < 3700) {
    //saveFrame("/Users/travis/Desktop/PFrames/#####.png");
  }
}