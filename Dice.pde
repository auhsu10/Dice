int cumulativeSum=0;
int roundSum=0;
int backgroundNum=0;
int numRolls=1;

void setup()
{
  size(500,500);
  textAlign(CENTER);
  textSize(20);
  noLoop();
}
void draw()
{
  noStroke();
  if(backgroundNum==0){
    noStroke();
    background(80,140,250);
    fill(220);
    rect(0,0,500,60);
    rect(0,500,500,-40);
    quad(120,460,160,390,340,390,380,460);
    fill(0);
    stroke(0);
    strokeWeight(1.5);
    line(0,60,500,60);
    strokeWeight(1.5);
    stroke(0);
    line(0,460,120,460);
    line(120,460,160,390);
    line(160,390,340,390);
    line(340,390,380,460);
    line(380,460,500,460);
    textSize(22);
    text("Number of Rolls: "+numRolls,250,40);
    textSize(15);
    text("Light Mode",55,38);
  }
  else if(backgroundNum==1){
    noStroke();
    background(0,0,50);
    fill(20);
    rect(0,0,500,60);
    rect(0,500,500,-40);
    quad(120,460,160,390,340,390,380,460);
    fill(250);
    stroke(250);
    strokeWeight(1.5);
    line(0,60,500,60);
    strokeWeight(1.5);
    line(0,460,120,460);
    line(120,460,160,390);
    line(160,390,340,390);
    line(340,390,380,460);
    line(380,460,500,460);
    textSize(22);
    text("Number of Rolls: "+numRolls,250,40);
    textSize(15);
    text("Dark Mode",55,38);
  }
  textSize(20);
  for(int y=100;y<=320;y+=100){
    for(int x=25;x<=425;x+=100){
      Die d=new Die(x,y);
      d.roll();
      d.show();
    }
  }
  if(backgroundNum==0)
    fill(0);
  else if(backgroundNum==1)
    fill(255);
  text("Round Sum: "+roundSum,250,420);
  text("Cumulative Sum: "+(cumulativeSum+roundSum),250,455);
  textSize(15);
  text("(This cumulative sum includes the current round sum amount.)",250,485);
}
void mousePressed()
{
  cumulativeSum+=roundSum;
  redraw();
  roundSum=0;
  numRolls+=1;
}
void keyPressed()
{
  if(key=='r'||key=='R'){
    roundSum=0;
    cumulativeSum=0;
    redraw();
    numRolls=1;
  }
  if((key=='n'||key=='N')&&(backgroundNum==0)){
    backgroundNum=1;
  }
  if((key=='m'||key=='M')&&(backgroundNum==1)){
    backgroundNum=0;
  }
  if(keyCode==32){
    cumulativeSum+=roundSum;
    redraw();
    roundSum=0;
    numRolls+=1;
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
    rect(mX,mY,50,50,8);
    fill(0);
    textSize(18);
    if(dicenum==1){
      ellipse(mX+25,mY+25,6,6);
      fill(185,0,0);
      text(dicenum,mX+25,mY+70);
      roundSum+=1;
    }
    else if(dicenum==2){
      ellipse(mX+15,mY+25,6,6);
      ellipse(mX+35,mY+25,6,6);
      fill(150,90,0);
      text(dicenum,mX+25,mY+70);
      roundSum+=2;
    }
    else if(dicenum==3){
      ellipse(mX+15,mY+25,6,6);
      ellipse(mX+25,mY+25,6,6);
      ellipse(mX+35,mY+25,6,6);
      fill(150,130,0);
      text(dicenum,mX+25,mY+70);
      roundSum+=3;
    }
    else if(dicenum==4){
      ellipse(mX+15,mY+15,6,6);
      ellipse(mX+35,mY+15,6,6);
      ellipse(mX+15,mY+35,6,6);
      ellipse(mX+35,mY+35,6,6);
      fill(0,120,20);
      text(dicenum,mX+25,mY+70);
      roundSum+=4;
    }
    else if(dicenum==5){
      ellipse(mX+15,mY+15,6,6);
      ellipse(mX+35,mY+15,6,6);
      ellipse(mX+25,mY+25,6,6);
      ellipse(mX+15,mY+35,6,6);
      ellipse(mX+35,mY+35,6,6);
      fill(0,50,160);
      text(dicenum,mX+25,mY+70);
      roundSum+=5;
    }
    else if(dicenum==6){
      ellipse(mX+15,mY+15,6,6);
      ellipse(mX+35,mY+15,6,6);
      ellipse(mX+15,mY+25,6,6);
      ellipse(mX+35,mY+25,6,6);
      ellipse(mX+15,mY+35,6,6);
      ellipse(mX+35,mY+35,6,6);
      fill(70,0,180);
      text(dicenum,mX+25,mY+70);
      roundSum+=6;
    }
  }
}
