class Mover{
  PVector location;
  PVector velocity;
  
  PVector acceleration;
  
  float topspeed;
  int radius = 0;
  
  Mover(){
    location = new PVector(width/2, height/2);
    velocity = new PVector(0.0,0.0);
    acceleration = new PVector(0, 0);
    topspeed = 10;
  }
  
  void update(){
    if (radius == 0)
      return;
    location.add(velocity);
    velocity.add(acceleration);
    velocity.limit(topspeed);
  }
  
  void display(){
    if (radius == 0)
      return;
    stroke(0);
    fill(255,0,0,50);
    ellipse(location.x, location.y, radius, radius);
  }
  
  void setLocation(int x, int y){
    location.x = x;
    location.y = y;
  }

  void setMotion(float x, float y){
    acceleration.x = x/500;
    acceleration.y = y/500;
    velocity.x = x;
    velocity.y = y;
  }

  
  void setRadius(int r){
    radius = r;
  }
  
  void checkEdges(){
    if (radius == 0)
      return;
    
    if ((location.x >= width) || (location.x <= 0)){
      velocity.x *= -1;
      acceleration.x *= -1;
    } 
    
    if ((location.y >= height) || (location.y <= 0)){
      velocity.y *= -1;
      acceleration.y *= -1;
    } 
    
  }
}
