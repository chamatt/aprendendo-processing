int w = 800;
int h = 400;
float rot = 0;
int posX = w/2;
int posY = h/2;
float vX = 2;
float vY = 3;
int count = 0;

void setup(){
  size(800, 400, P3D);
}

void draw(){
 background(#ff0033);
 // PImage img = loadImage("dory.jpg");
 // image(img, 0, 0, w, h);
  
 // fill(0, 0, 200);
 // noStroke();
 // vertex(2, 2);
 // ellipse(w/2+50, h/2, 50 , 50);
  
 // //rectangle
 // fill(#ffff00);
 // rect(700, 10, 100, 200, 25, 15, 15, 15);
  
 // //four corners poligon
 // fill(#ff0000);
 // quad(10, 10, 10, 50, 50, 10, 50, 50);
  
 // //triangle
 // stroke(255);
 // strokeWeight(10);
 // triangle(100, 10, 60, 60, 120, 60);
  
  
 // //text
 //fill(#00ff00);
 //textSize(48);
 //text("Onde tá a dori", 450, 300);
 
 //fill(0, 0, 255);
 
 //translate(400, 200, 0);
 //strokeWeight(1);
 //rot = (rot+(3.14/15));
 //rotate(PI/6 * mouseX / 10);
 //sphere(100);
 
 //translate(-100, -100, 0);
 //strokeWeight(1);
 //box(100);
 //int x = mouseX;
 //int y = mouseY;
 //rectMode(CENTER);
 //rect(400, 200, 800-x, 400-y);
 
 
 
 posX+= vX;
 posY+= vY;
 ellipse(posX, posY, 100, 100);
 if(posX >= w || posX <= 0)
   vX = -vX;
 if(posY >= h || posY <= 0)
   vY = -vY;
 
 count++;
  if(count % 100 == 0){
    float aux = vY; 
    vY = vX; 
    vX = aux;
  }
  
}