int w = width;
int h = height;
float rot = 0;
int posCaixaX = w/2;
int posCaixaY = h/2;
int tamCaixa = h/2;
int centroX = w/2;
int centroY = h/2;

int posSliderContainerX = centroX;
int posSliderContainerY = centroY+int(tamanhoRelativo(100, 400, tamCaixa));
int tamSliderContainerX = int(tamanhoRelativo(300, 400, tamCaixa));
int tamSliderContainerY = int(tamanhoRelativo(80, 400, tamCaixa));

int tamSlider = int(tamanhoRelativo(70, 400, tamCaixa));
//int posSliderX = centroX;
int posSliderY = centroY+int(tamanhoRelativo(100, 400, tamCaixa));
int posSliderX = mouseX;

float barStart = posSliderContainerX-tamSliderContainerX/2+tamSlider/2+5;
float barEnd = posSliderContainerX+tamSliderContainerX/2-tamSlider/2-5;


boolean isOn = true;

color onColorDefault = #00ff64;
color offColorDefault = #ff0064;
color greyColorDefault = #333333;
color onContainer = #ffffff;
color offContainer = #ffffff;

int posOnButtonX = centroX-int(tamanhoRelativo(100, 400, tamCaixa));
int posOnButtonY = centroY-int(tamanhoRelativo(100, 400, tamCaixa));
int tamOnButton = int(tamanhoRelativo(100, 400, tamCaixa));

int posOffButtonX = centroX+int(tamanhoRelativo(100, 400, tamCaixa));
int posOffButtonY = centroY-int(tamanhoRelativo(100, 400, tamCaixa));
int tamOffButton = int(tamanhoRelativo(100, 400, tamCaixa));


int percentage;


void setup() {
  size(800, 600);
  surface.setResizable(true);
}

void draw(){
  variablesRestart();
  drawContainer();
  drawOnButton();
  drawOffButton();
  drawSliderContainer();
  drawSlider();
  drawPercentage();
}


void mouseDragged(){
  if(mouseHoveringSlider()){
    posSliderX = mouseX;
  }
}

boolean mouseHoveringSlider(){
  if(mouseX >= posSliderX-tamSlider/2 && mouseX < posSliderX + tamSlider/2 && mouseY > posSliderY - tamSlider /2 && mouseY < posSliderY + tamSlider/2)
    return true;
  return false;
}

boolean MouseClickedOnButton(){
   if(mouseX >= posOnButtonX - tamOnButton/2 && mouseX <= posOnButtonX + tamOnButton && mouseY >= posOnButtonY - tamOnButton/2 && mouseY <= posOnButtonY + tamOnButton/2){
     return true;
   }
   return false;
}

boolean MouseClickedOffButton(){
   if(mouseX >= posOffButtonX - tamOffButton/2 && mouseX <= posOffButtonX + tamOffButton/2 && mouseY >= posOffButtonY - tamOffButton/2 && mouseY <= posOffButtonY + tamOffButton/2){
     return true;
   }
   return false;
}

void mousePressed(){
  if(MouseClickedOnButton()){
    isOn = true;
    onContainer = #333333;
  }
  else if(MouseClickedOffButton()){
    isOn = false;
    offContainer = #333333;
  }
 }

void mouseReleased(){
  onContainer = #ffffff;
  offContainer = #ffffff;
}

void drawContainer(){
  background(greyColorDefault);
  fill(255);  
  rectMode(CENTER);
  rect(w/2, h/2, tamCaixa, tamCaixa, 10, 10, 10, 10); 
}

void drawOnButton(){
  fill(onContainer);
  rectMode(CENTER);
  color onColor = onColorDefault;
  if(!isOn)
     onColor = greyColorDefault;
  rect(posOnButtonX, posOnButtonY, tamOnButton, tamOnButton, 10, 10, 10, 10);
  fill(onColor);
  rect(posOnButtonX, posOnButtonY+int(tamanhoRelativo(30, 400, tamCaixa)), int(tamanhoRelativo(50, 400, tamCaixa)), int(tamanhoRelativo(10, 400, tamCaixa)), 10);
  fill(0);
  text("ON", posOnButtonX, posOnButtonY); 
}

void drawOffButton(){
  fill(offContainer);
  rectMode(CENTER);
  rect(posOffButtonX, posOffButtonY, tamOffButton, tamOffButton, 10, 10, 10, 10);
  color offColor = offColorDefault;
  if(isOn)
     offColor = greyColorDefault;
  fill(offColor);
  rect(posOffButtonX, posOffButtonY+int(tamanhoRelativo(30, 400, tamCaixa)), int(tamanhoRelativo(50, 400, tamCaixa)), int(tamanhoRelativo(10, 400, tamCaixa)), 10);
  fill(0);
  text("OFF", posOffButtonX, posOffButtonY);
}

void drawSliderContainer(){
  fill(#555555);
  rectMode(CENTER);
  rect(posSliderContainerX, posSliderContainerY, tamSliderContainerX, tamSliderContainerY, 10, 10, 10, 10); 
}

void drawSlider(){
  if(!isOn){
    posSliderX = posSliderContainerX-tamSliderContainerX/2-tamSlider/2-5;
    //posSliderX = int(percentage*(barEnd-barStart)/100 + barStart);
  }
  checkOutOfBounds();
  fill(20);
  ellipse(posSliderX+2, posSliderY+2, tamSlider , tamSlider);
  fill(255);
  ellipse(posSliderX, posSliderY, tamSlider , tamSlider);
}

void checkOutOfBounds(){
  if(posSliderX+tamSlider/2 >= posSliderContainerX+tamSliderContainerX/2){
    posSliderX = int(barEnd);
  }
  else if(posSliderX-tamSlider/2 <= posSliderContainerX-tamSliderContainerX/2){
    posSliderX = int(barStart);
  } 
}

void drawPercentage(){
  percentage = int(100*(posSliderX-barStart)/(barEnd-barStart));
  fill(greyColorDefault);
  rect(centroX, centroY, int(tamanhoRelativo(50, 400, tamCaixa)), int(tamanhoRelativo(50, 400, tamCaixa)), 10);
  fill(#eeeeee);
  textAlign(CENTER);
  textSize(int(tamanhoRelativo(18, 400, tamCaixa)));
  text(str(percentage) + "%", centroX, centroY+int(tamanhoRelativo(5, 400, tamCaixa))); 
}
//MouseClickedOnButton()

float tamanhoRelativo(int valor, int referencia, int dimensao ){
  return float(valor)/float(referencia)*float(dimensao);
}

void variablesRestart(){
   w = width;
   h = height;
   posCaixaX = w/2;
   posCaixaY = h/2;
   tamCaixa = 3*h/4;
   centroX = w/2;
   centroY = h/2;
  
   posSliderContainerX = centroX;
   posSliderContainerY = centroY+int(tamanhoRelativo(100, 400, tamCaixa));
   tamSliderContainerX = int(tamanhoRelativo(300, 400, tamCaixa));
   tamSliderContainerY = int(tamanhoRelativo(80, 400, tamCaixa));
  
   tamSlider = int(tamanhoRelativo(70, 400, tamCaixa));
  //int posSliderX = centroX;
   posSliderY = centroY+int(tamanhoRelativo(100, 400, tamCaixa));
  
  barStart = posSliderContainerX-tamSliderContainerX/2+tamSlider/2+5;
  barEnd = posSliderContainerX+tamSliderContainerX/2-tamSlider/2-5;
  
   onColorDefault = #00ff64;
   offColorDefault = #ff0064;
   greyColorDefault = #333333;
   onContainer = #ffffff;
   offContainer = #ffffff;
  
   posOnButtonX = centroX-int(tamanhoRelativo(100, 400, tamCaixa));
   posOnButtonY = centroY-int(tamanhoRelativo(100, 400, tamCaixa));
   tamOnButton = int(tamanhoRelativo(100, 400, tamCaixa));
  
   posOffButtonX = centroX+int(tamanhoRelativo(100, 400, tamCaixa));
   posOffButtonY = centroY-int(tamanhoRelativo(100, 400, tamCaixa));
   tamOffButton = int(tamanhoRelativo(100, 400, tamCaixa));
  
}