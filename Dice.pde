Die d1,d2,d3,d4,d5,d6,d7,d8,d9,d10;
int cumulativeSum=0;
int roundSum=0;
int background=1;
void setup()
{
  size(500,500);
  textAlign(CENTER);
  textSize(20);
  noLoop();
  d1=new Die(25,150);
  d2=new Die(125,150);
  d3=new Die(225,150);
  d4=new Die(325,150);
  d5=new Die(425,150);
  d6=new Die(25,275);
  d7=new Die(125,275);
  d8=new Die(225,275);
  d9=new Die(325,275);
  d10=new Die(425,275);
}
void draw()
{
  noStroke();
  if(background==0){
    noStroke();
    background(80,140,250);
    fill(150);
    rect(0,0,500,60);
    fill(0);
    stroke(0);
    strokeWeight(2);
    line(0,60,500,60);
    textSize(20);
    text("Light Mode",80,38);
  }
  else if(background==1){
    noStroke();
    background(0,0,50);
    fill(150);
    rect(0,0,500,60);
    fill(0);
    stroke(0);
    strokeWeight(2);
    line(0,60,500,60);
    textSize(20);
    text("Dark Mode",80,38);
  }
  System.out.println(background);
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
  textSize(20);
  if(background==0)
    fill(0);
  else if(background==1)
    fill(255);
  text("Round Sum: "+roundSum,250,400);
  text("Cumulative Sum: "+(cumulativeSum+roundSum),250,440);
  textSize(15);
  text("(This cumulative sum includes the current round sum amount.)",250,480);
}
void mousePressed()
{
  cumulativeSum+=roundSum;
  redraw();
  roundSum=0;
}
void keyPressed()
{
  if(key==char('r')||key==char('R')){
    roundSum=0;
    cumulativeSum=0;
    redraw();
  }
  if((key==char('n')||key==char('N'))&&(background==0)){
    background=1;
  }
  if((key==char('m')||key==char('M'))&&(background==1)){
    background=0;
  }
  if(keyCode==int(32)){
    cumulativeSum+=roundSum;
    redraw();
    roundSum=0;
  }
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
    textSize(18);
    if(dicenum==1){
      ellipse(mX+25,mY+25,5,5);
      fill(185,0,0);
      text(dicenum,mX+25,mY+70);
      roundSum+=1;
    }
    else if(dicenum==2){
      ellipse(mX+20,mY+25,5,5);
      ellipse(mX+30,mY+25,5,5);
      fill(150,90,0);
      text(dicenum,mX+25,mY+70);
      roundSum+=2;
    }
    else if(dicenum==3){
      ellipse(mX+15,mY+25,5,5);
      ellipse(mX+25,mY+25,5,5);
      ellipse(mX+35,mY+25,5,5);
      fill(150,130,0);
      text(dicenum,mX+25,mY+70);
      roundSum+=3;
    }
    else if(dicenum==4){
      ellipse(mX+15,mY+15,5,5);
      ellipse(mX+35,mY+15,5,5);
      ellipse(mX+15,mY+35,5,5);
      ellipse(mX+35,mY+35,5,5);
      fill(0,120,20);
      text(dicenum,mX+25,mY+70);
      roundSum+=4;
    }
    else if(dicenum==5){
      ellipse(mX+15,mY+15,5,5);
      ellipse(mX+35,mY+15,5,5);
      ellipse(mX+25,mY+25,5,5);
      ellipse(mX+15,mY+35,5,5);
      ellipse(mX+35,mY+35,5,5);
      fill(0,50,160);
      text(dicenum,mX+25,mY+70);
      roundSum+=5;
    }
    else if(dicenum==6){
      ellipse(mX+15,mY+15,5,5);
      ellipse(mX+35,mY+15,5,5);
      ellipse(mX+15,mY+25,5,5);
      ellipse(mX+35,mY+25,5,5);
      ellipse(mX+15,mY+35,5,5);
      ellipse(mX+35,mY+35,5,5);
      fill(70,0,180);
      text(dicenum,mX+25,mY+70);
      roundSum+=6;
    }
  }
}
