Particle[] aBunch = new Particle [500];
public int oddballColor;

void setup()
{
  size(800,800);
  background(255);
  noStroke();

  aBunch = new Particle[6000];
  for (int i =0; i< aBunch.length; i++)
  {
    aBunch[i] = new Normal();
  }
  
  for (int i =0; i < 10; i++)
  {
    int newX = (int)(Math.random()*700)+50;
    int newY = (int)(Math.random()*700)+50;
    oddballColor = (int)(Math.random()*100)+180;
    fill(250,oddballColor,240);
    aBunch[i] = new Oddball(newX,newY);
  }

  
  aBunch[27] = new Jumbo();
  
 
  
}

void draw()
{
  background(255);
  for (int i =0; i < aBunch.length; i++)
  {
    aBunch[i].move();
    aBunch[i].show();
  }
}

class Normal implements Particle
{
  public int mySize, myColor;
  public double myX, myY,myAngle,mySpeed;
  Normal()
  {
    myX=(Math.random()*100)+300;
    myY=400;
    myColor= color( (int)(Math.random()*300), (int)(Math.random()*300),  (int)(Math.random()*300));
    mySize=4;
    myAngle=(Math.PI*2*Math.random());
    mySpeed = (Math.random()*50);
    
  }
  public void move()
  {
    myX = myX + (int)(Math.cos(myAngle)*mySpeed);
    myY = myY + (int)(Math.sin(myAngle)*mySpeed);
    myAngle = myAngle + .08;
    mySpeed = myAngle - .03;
    
   if((Math.abs(myX) > 880) && (Math.abs(myY) > 880) || ((myX) < -10) && ((myY) < - 10))
    {
      myX = 440;
      myY = 440;
    }
  }
  public void show()
  {
    fill(myColor);
    ellipse((int)myX,(int)myY,mySize,mySize);
  }
}
  
  
class Jumbo extends Normal
{
  public void show()
  {
    fill(myColor);
    ellipse((int)myX,(int)myY,40,40);
  }

 
}

class Oddball implements Particle
{
  int myX,myY;
  Oddball(int x, int y)
  {
    myX=x;
    myY=y;
  }
  public void show()
  {
    noStroke();
    ellipse(myX,myY+10,5,10);
    ellipse(myX,myY,5,10);
    ellipse(myX-6,myY+5,10,5);
    ellipse(myX+6,myY+5,10,5); 
  }
  public void move()
  {
    myX = myX + (int)(Math.random()*5)-2;
    myY = myY + (int)(Math.random()*5)-2;
  }
}

interface Particle //list names of methods the classes have in common
{
  void show();
  void move();
}