class Scene
{
  float camZ = 0;

  void InitCamera()
  {
    camZ = (height/2) / tan((PI*60.0)/360.0);
    camera(0, 0, camZ,
      0, 0, 0,
      0, 1, 0);
  }

  void drawFloor()
  {
    beginShape(QUAD);
    texture(woodImage);

    vertex(-1, 0.5, 1, 0, 0);
    vertex( 1, 0.5, 1, 1, 0);
    vertex( 1, 0.5, -1, 1, 1);
    vertex(-1, 0.5, -1, 0, 1);

    endShape();
  }
}
