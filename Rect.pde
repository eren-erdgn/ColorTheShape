class Rect extends Shape {
  float s;
  color rectColor =255;

  Rect(float size) {
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
    fill(rectColor);
    box(2*s, s, s);
    popMatrix();
  }
}
