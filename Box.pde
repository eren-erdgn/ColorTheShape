class Box extends Shape {
  float s;
  color boxColor = 255;

  Box(float size) {
    s = size;
  }
  
  public void move() {
    x += sX;
    z += sZ;

    if (x < -1 || x > 1) {
      sX *= -1;
    }
    if (z < -1 || z > 1) {
      sZ *= -1;
    }
  }

  public void display() {
    pushMatrix();
    translate(x, y - s / 2, z);
    fill(boxColor);
    box(s);
    popMatrix();
  }
}
