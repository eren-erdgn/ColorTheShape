import java.util.Random; //<>//
class ScreenDesign {
  Timer t = new Timer();
  Random random = new Random();
  int colorIndex;
  int tempIndex = -1;
  int[] c = new int[4];


  void fillPalette()
  {
    for (int i = 0; i <= 3; i++)
    {
      c[i] = color(random(255), random(255), random(255));
    }

    for (int i = 0; i < c.length; i++) {
      int randomIndexToSwap = random.nextInt(c.length);
      int temp = c[randomIndexToSwap];
      c[randomIndexToSwap] = c[i];
      c[i] = temp;
    }
  }

  int getColor(int x)
  {
    return c[x];
  }

  
  void colorPicker() {
    for (int i = 0; i <= 3; i++) {
      pushMatrix();
      fill(getColor(i));
      rect(-i * 50, 0, 50, 50);
      popMatrix();
    }
  }

  void WinGameOver(){
    fill(255, 50); 
    rect(-width/2+500, -height/4 -220, 700, 250);
    fill(255);
    textSize(80);
    text("Score = " + t.getTime(), -width/4+200 , -height/4);
    text("You Win!" , -width/2+700 , -height/4 -150);
  }
  void LoseGameOver(){
    fill(255, 50); 
    rect(-width/2+500, -height/4 -220, 700, 250); 
    fill(255);
    textSize(100);
    text("Time Is Over :(" , -width/2+550 , -height/4 -100);
    
  }

  
  void timeHud() {
    fill(255);
    textSize(50);
    text("time left = " + t.getTime(), -width/2, -height/2 + 50);
  }

  
  void drawRefBox()
  {

    pushMatrix();
    translate(0, -0.3, 0);
    fill(getColor(0));
    box(0.1);
    popMatrix();
  }
  
  void drawRefSphere()
  {

    pushMatrix();
    translate(-0.2, -0.3, 0);
    fill(getColor(1));
    sphere(0.08);
    popMatrix();
  }
  
  void drawRefRect()
  {

    pushMatrix();
    translate(0.2, -0.3, 0);
    fill(getColor(2));
    box(0.2, 0.1, 0.1);
    popMatrix();
  }
  
  void drawRefPyr()
  {

    pushMatrix();
    translate(0.4, -0.25, 0);
    fill(getColor(3));
    drawPyramid(0.08);
    popMatrix();
  }
  
  void drawPyramid(float s)
  {
    beginShape(TRIANGLES);

    
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
