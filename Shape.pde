abstract class Shape {
  float x;
  float y;
  float z;
  float sX;
  float sZ;

  Shape()
  {
    x = random(-1, 1);
    y = 0.49;
    z = random(-1, 1);
    sX = random(-0.015, 0.015);
    sZ = random(-0.015, 0.015);
  }

  public abstract void display();
  public abstract void move();
}
