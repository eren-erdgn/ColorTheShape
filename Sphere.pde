class Sphere extends Shape {
  float r;
  color sphereColor =255;

  Sphere(float radius)
  {
    r = radius;
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
    translate(x, y - r, z); 
    fill(sphereColor);
    sphere(r);
    popMatrix();
  }
}
