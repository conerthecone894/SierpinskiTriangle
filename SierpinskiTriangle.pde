stars[] bopis = new stars[256];

void setup(){
  size(512, 512);
  
  for(int i = 0; i < bopis.length; i++){ //stars
    bopis[i] = new stars();  
  }
}

void draw(){
  fill(0);
  rect(0, 0, 512, 512);
  
  for(int i = 0; i < bopis.length; i++){
    bopis[i].show();
    bopis[i].drift();
  }
  
  sierpinski(0,512, mouseX*2);
}

// Sierpinski_Triangle.pde

void sierpinski(int x, int y, int len){
  int[] clr = new int[6];
  
  clr[0] = color(255, 185, 170);
  clr[1] = color(247, 212, 176);
  clr[2] = color(244, 247, 173);
  clr[3] = color(183, 247, 173);
  clr[4] = color(173, 226, 247);
  clr[5] = color(220, 173, 255);
  
  if(len <= 88) {
    fill(clr[(int)(Math.random()*6)]);
    triangle(x, y, x+(len/2), y-len, x+len, y);
  } else {
    sierpinski(x, y, len/2); //L
    sierpinski(x+(len/2), y, len/2); //R
    sierpinski(x+(len/4), y-(len/2), len/2); //U
  }
}

// Sierpinski.pde

class stars{
  private float myX, myY, mySpeed;
  
  public stars(){
    myX = (float)(Math.random()*512);
    myY = (float)(Math.random()*512);
    mySpeed = (float)(Math.random()*1);
  } 
  public void show(){ //draws stars
    noStroke();
    fill(#c6b7be);
    ellipse(myX, myY, 3, 3);
  }
  public void drift(){ //makes stars move
    myX += mySpeed;
    if(myX >= 516)
      myX = -4;
  }
}

// Stars.pde (copied from asteroids)
