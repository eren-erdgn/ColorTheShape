class InputHandler {
  float rotY = 0;
  float prevMouseX;
  void rotAroundTheFloor() {
    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        rotY += 0.05;
      } else if (key == 'd' || key == 'D') {
        rotY -= 0.05;
      } else if (key == 'z' || key == 'Z') {
        zoomFactor += 0.1;
      }
    }
    if (mousePressed && mouseButton == RIGHT) {
      float rotationSpeed = (mouseX - prevMouseX) * 0.005;
      rotY += rotationSpeed;
      }
    prevMouseX = mouseX;
    rotateY(rotY);
  }
}
