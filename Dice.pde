Die d1,d2,d3,d4,d5,d6,d7,d8,d9,d10;
void setup()
{
  size(500,500);
  noLoop();
  d1=new Die(25,150);
  d2=new Die(125,150);
  d3=new Die(225,150);
  d4=new Die(325,150);
  d5=new Die(425,150);
  d6=new Die(25,300);
  d7=new Die(125,300);
  d8=new Die(225,300);
  d9=new Die(325,300);
  d10=new Die(425,300);
}
void draw()
{
  background(80,140,250);
  d1.roll();
  d1.show();
  d2.roll();
  d2.show();
  d3.roll();
  d3.show();
  d4.roll();
  d4.show();
  d5.roll();
  d5.show();
  d6.roll();
  d6.show();
  d7.roll();
  d7.show();
  d8.roll();
  d8.show();
  d9.roll();
  d9.show();
  d10.roll();
  d10.show();
}
void mousePressed()
{
  redraw();
}
void keyPressed()
{
  redraw();
}
class Die //models one single dice cube
{
  int mX,mY,dicenum;
  Die(int x, int y) //constructor
  {
    mX=x;
    mY=y;
  }
  void roll()
  {
    dicenum=(int)(Math.random()*6)+1;
  }
  void show()
  {
    stroke(0);
    strokeWeight(2);
    fill(240,240,240);
    rect(mX,mY,50,50);
    fill(0);
    if(dicenum==1){
      ellipse(mX+25,mY+25,5,5);
    }
    else if(dicenum==2){
      ellipse(mX+20,mY+25,5,5);
      ellipse(mX+30,mY+25,5,5);
    }
    else if(dicenum==3){
      ellipse(mX+15,mY+25,5,5);
      ellipse(mX+25,mY+25,5,5);
      ellipse(mX+35,mY+25,5,5);
    }
    else if(dicenum==4){
      ellipse(mX+15,mY+15,5,5);
      ellipse(mX+35,mY+15,5,5);
      ellipse(mX+15,mY+35,5,5);
      ellipse(mX+35,mY+35,5,5);
    }
    else if(dicenum==5){
      ellipse(mX+15,mY+15,5,5);
      ellipse(mX+35,mY+15,5,5);
      ellipse(mX+25,mY+25,5,5);
      ellipse(mX+15,mY+35,5,5);
      ellipse(mX+35,mY+35,5,5);
    }
    else if(dicenum==6){
      ellipse(mX+15,mY+15,5,5);
      ellipse(mX+35,mY+15,5,5);
      ellipse(mX+15,mY+25,5,5);
      ellipse(mX+35,mY+25,5,5);
      ellipse(mX+15,mY+35,5,5);
      ellipse(mX+35,mY+35,5,5);
    }
  }
}
