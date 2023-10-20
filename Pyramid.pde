class Pyramid extends Shape {
  float s;
  color pyramidColor= 255;

  Pyramid(float size) {
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
    drawPyramid();
    popMatrix();
  }
  
  void drawPyramid()
  {
    beginShape(TRIANGLES);
    fill(pyramidColor);

    vertex(-s, 0, s);
    vertex(s, 0, s);
    vertex(s, 0, -s);

    vertex(-s, 0, s);
    vertex(s, 0, -s);
    vertex(-s, 0, -s);

    vertex(0, -s, 0);
    vertex(s, 0, -s);
    vertex(-s, 0, -s);

    vertex(0, -s, 0);
    vertex(-s, 0, -s);
    vertex(-s, 0, s);

    vertex(0, -s, 0);
    vertex(-s, 0, s);
    vertex(s, 0, s);

    vertex(0, -s, 0);
    vertex(s, 0, s);
    vertex(s, 0, -s);

    endShape();
  }
}
