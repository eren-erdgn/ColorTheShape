ScreenDesign sd = new ScreenDesign();
InputHandler inputHandler = new InputHandler();
Scene scene = new Scene();
Box box = new Box(0.2);
Rect rect = new Rect(0.2);
Sphere sphere = new Sphere(0.1);
Pyramid pyramid = new Pyramid(0.1);
Brush brush = new Brush(0.1);
Timer timer = new Timer();

color brushColor = 255;
boolean colorPicked =false;
float shapeOffset = 0.15;
int point = 0;
float zoomFactor = 1;
PImage woodImage;
PImage whiteMarbleImage;
boolean gameOver = false;

void setup() {
  fullScreen(P3D);
  textureMode(NORMAL);
  noStroke();
  scene.InitCamera();
  sd.fillPalette();
  registerMethod("mouseWheel", this);
  woodImage = loadImage("wood.jpg");
  whiteMarbleImage = loadImage("WhiteMarble.jpg");
}



void draw() {
  
  
  background(0);
  gameHud();
  
  winOrLoseConditions();
  
  inputHandler.rotAroundTheFloor();
  scale(600 * zoomFactor);

  displayBrush();

  displayFloor();
  
  references();
  
  shapeDisplay();

  shapeMovement();
}





void gameHud()
{
  sd.colorPicker();
  sd.timeHud();
}

void displayBrush()
{
  fill(brushColor);
  brush.display();
}
void displayFloor()
{
  scene.drawFloor();
}
void references()
{
  sd.drawRefBox();
  sd.drawRefSphere();
  sd.drawRefRect();
  sd.drawRefPyr();

}
void shapeDisplay()
{
  box.display();
  rect.display();
  sphere.display();
  pyramid.display();
}


void shapeMovement()
{
  if(gameOver!=true) {
    brush.move();
    box.move();
    rect.move();
    sphere.move();
    pyramid.move();
  }
}
void winOrLoseConditions()
{
  if(sd.getColor(0) == box.boxColor && sd.getColor(1) == sphere.sphereColor && sd.getColor(2) == rect.rectColor && sd.getColor(3) == pyramid.pyramidColor)
      {
         gameOver=true;
         sd.WinGameOver();
       }

    if(timer.getTime()== 0)
      {
        gameOver=true;
        sd.LoseGameOver();
      }
}


void mouseClicked() {
  if (mouseX - width/2 <= 50 && mouseX - width/2 >= -150 && mouseY - height/2 <= 50 && mouseY - height/2 >= 0) {
    colorPicked =true;
    brushColor = get(mouseX, mouseY);
  } else {
    return;
  }
}

void keyPressed() {
  if(gameOver!=true){
      if(colorPicked == true && key == ' ') {

          if (box.x + shapeOffset >= brush.x && box.x - shapeOffset <= brush.x && box.z + shapeOffset >= brush.z && box.z - shapeOffset <= brush.z ) {
            box.boxColor=brushColor;
          }

          if (rect.x + shapeOffset >= brush.x && rect.x - shapeOffset <= brush.x && rect.z + shapeOffset >= brush.z && rect.z - shapeOffset <= brush.z ) {
           rect.rectColor=brushColor;
          }

          if (sphere.x + shapeOffset >= brush.x && sphere.x - shapeOffset <= brush.x && sphere.z + shapeOffset >= brush.z && sphere.z - shapeOffset <= brush.z ) {
            sphere.sphereColor=brushColor;
          }

          if (pyramid.x + shapeOffset >= brush.x && pyramid.x - shapeOffset <= brush.x && pyramid.z + shapeOffset >= brush.z && pyramid.z - shapeOffset <= brush.z ) {
            pyramid.pyramidColor=brushColor;
          }

        }
  }

  if (key == 'W' || key == 'w')
  {
    brush.isDragging = !brush.isDragging;
  }
  
  if (key == 'p' || key == 'P')
  {
    exit();
  }
}

void mouseWheel(MouseEvent event) {
  float delta = event.getCount();
  zoomFactor = constrain(zoomFactor, 0.7,1.5);
  if (delta > 0) {
    zoomFactor -= 0.1;
  } else {
    zoomFactor += 0.1;

    if (zoomFactor < 0.1) {
      zoomFactor = 0.1;
    }
  }
}
