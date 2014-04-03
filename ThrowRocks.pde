Mover[] rocks = new Mover[100];

int rockSize = 0;
int timer;
boolean mouseDown = false;
int rockCount = 0;

void setup(){
  size(800, 600);
  smooth();
  for (int i =0; i<100; i++)
    rocks[i] = new Mover();
}

void draw(){
  background(255,255,255); // White
  if (mouseDown){
      rockSize = (millis() - timer)/50;
      rocks[rockCount].setLocation(mouseX, mouseY);
      rocks[rockCount].setRadius(rockSize);
  }
  for (int i=0; i<100; i++){
    rocks[i].update();
    rocks[i].checkEdges();
    rocks[i].display();
  }
}

void mousePressed(){
  if (mouseButton == LEFT){
    rockCount ++;
    if (rockCount > 99)
      rockCount = 1;
    timer = millis();
    mouseDown = true;
  }
}

void mouseReleased(){
  if (mouseButton == LEFT){
    mouseDown = false;
    
    rocks[rockCount].setMotion((mouseX - pmouseX), (mouseY-pmouseY));
  }
}

