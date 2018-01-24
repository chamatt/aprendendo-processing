int w = 800;
int h = 600;
float rot = 0;
int posCaixaX = w/2;
int posCaixaY = h/2;
int tamCaixa = 400;
int centroX = w/2;
int centroY = h/2;

int posSliderContainerX = centroX;
int posSliderContainerY = centroY+100;
int tamSliderContainerX = 300;
int tamSliderContainerY = 80;

int tamSlider = 70;
//int posSliderX = centroX;
int posSliderY = centroY+100;
int posSliderX = mouseX;

float barStart = posSliderContainerX-tamSliderContainerX/2+tamSlider/2+5;
float barEnd = posSliderContainerX+tamSliderContainerX/2-tamSlider/2-5;


boolean isOn = true;

color onColorDefault = #00ff64;
color offColorDefault = #ff0064;
color greyColorDefault = #333333;
color onContainer = #ffffff;
color offContainer = #ffffff;

int posOnButtonX = centroX-100;
int posOnButtonY = centroY-100;
int tamOnButton = 100;

int posOffButtonX = centroX+100;
int posOffButtonY = centroY-100;
int tamOffButton = 100;
int lastSetPercentage = 0;


int percentage;

void setup(){
  size(800, 600);
}

void draw(){
  background(greyColorDefault);
  fill(255);  
  rectMode(CENTER);
  rect(w/2, h/2, tamCaixa, tamCaixa, 10, 10, 10, 10);
  
  //interruptor on
  fill(onContainer);
  rectMode(CENTER);
  color onColor = onColorDefault;
  if(!isOn)
     onColor = greyColorDefault;
  rect(posOnButtonX, posOnButtonY, tamOnButton, tamOnButton, 10, 10, 10, 10);
  fill(onColor);
  rect(posOnButtonX, posOnButtonY+30, 50, 10, 10);
  fill(0);
  text("ON", posOnButtonX, posOnButtonY);
  
  
  //interruptor off
  fill(offContainer);
  rectMode(CENTER);
  rect(posOffButtonX, posOffButtonY, tamOffButton, tamOffButton, 10, 10, 10, 10);
  color offColor = offColorDefault;
  if(isOn)
     offColor = greyColorDefault;
  fill(offColor);
  rect(posOffButtonX, posOffButtonY+30, 50, 10, 10);
  fill(0);
  text("OFF", posOffButtonX, posOffButtonY);
  
  //Slider
  fill(#555555);
  rectMode(CENTER);
  rect(posSliderContainerX, posSliderContainerY, tamSliderContainerX, tamSliderContainerY, 10, 10, 10, 10);
  fill(246);
  //if(!isOn){
  //  //posSliderX = posSliderContainerX-tamSliderContainerX/2-tamSlider/2-5;
  //  posSliderX = int(percentage*(barEnd-barStart)/100 + barStart);
  //}
  if(posSliderX+tamSlider/2 >= posSliderContainerX+tamSliderContainerX/2){
      posSliderX = int(barEnd);
  }
  else if(posSliderX-tamSlider/2 <= posSliderContainerX-tamSliderContainerX/2){
    posSliderX = int(barStart);
  }
  fill(20);
  ellipse(posSliderX+2, posSliderY+2, tamSlider , tamSlider);
  fill(255);
  ellipse(posSliderX, posSliderY, tamSlider , tamSlider);
  
  //percentage
  
  percentage = int(100*(posSliderX-barStart)/(barEnd-barStart));
  print(percentage);
  print("\n");
  fill(greyColorDefault);
  rect(centroX, centroY, 50, 50, 10);
  fill(#eeeeee);
  textAlign(CENTER);
  textSize(14);
  text(str(percentage) + "%", centroX, centroY+5);
  
  
  
}


void mouseDragged(){
  if(mouseHoveringSlider()){
    posSliderX = mouseX;
    print("oi");
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

//MouseClickedOnButton()