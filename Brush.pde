class Brush extends Shape {
  float r;

  boolean isDragging = true;

  Brush(float radius) {
    r = radius;
  }

  public void move() {
    if (isDragging)
    {
      x += sX;
      z += sZ;

      if (x < -1 || x > 1) {
        sX *= -1;
      }
      if (z < -1 || z > 1) {
        sZ *= -1;
      }
    }
  }

  public void display() {
    pushMatrix();
    translate(x, y-r*1.5, z);
    drawConeWithCylinder();
    popMatrix();
  }

  void drawConeWithCylinder() {
    int numSegments = 360; 

    beginShape(TRIANGLE_FAN);
    vertex(0, 0.1, 0);

    for (int i = 0; i <= numSegments; i++) {
      float theta = i * TWO_PI / numSegments;
      float x = r/2 * cos(theta);
      float z = r/2 * sin(theta);
      vertex(x, 0, z);
    }

    endShape();

    beginShape(QUAD_STRIP);
    fill(100);
    
    texture(whiteMarbleImage);

    for (int i = 0; i <= numSegments; i++) {
      float theta = i * TWO_PI / numSegments;
      float x = r/2 * cos(theta);
      float z = r/2 * sin(theta);

      float u = map(i, 0, numSegments, 0, 1);

      vertex(x, 0, z, u, 0);
      
      vertex(x, -0.2, z, u, 1);

  }

    endShape();
  }
}
