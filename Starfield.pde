Particle[] aBunch = new Particle [500];
public int mySize, myColor;
public double myX, myY,myAngle,mySpeed;

void setup()
{
  size(880,880);
  background(255);
  noStroke();
  aBunch = new Particle[6000];
  for (int i =0; i< aBunch.length; i++)
  {
    aBunch[i] = new Normal();
  }
  aBunch[0] = new Oddball(20,20);
  aBunch[1] = new Jumbo();
 
  
}

void draw()
{
  background(0);
  for (int i =0; i <aBunch.length; i++)
  {
    aBunch[i].move();
    aBunch[i].show();
  }
}

class Normal implements Particle
{
  
  Normal()
  {
    myX=250;
    myY=250;
    myColor= color( (int)(Math.random()*300), (int)(Math.random()*300),  (int)(Math.random()*300));
    mySize=4;
    myAngle=(Math.PI*2*Math.random());
    mySpeed = 5;
  }
  public void move()
  {
    myX = myX + (int)(Math.cos(myAngle)*mySpeed);
    myY = myY + (int)(Math.sin(myAngle)*mySpeed);
    myAngle = myAngle + .05;
    mySpeed = myAngle - .1;
  }
  public void show()
  {
    fill(myColor);
    ellipse((int)myX,(int)myY,mySize,mySize);
  }
}
  
  
class Jumbo implements Particle
{
  public void show()
  {
    fill(myColor);
    ellipse((int)myX,(int)myY,40,40);
  }
  public void move()
  {
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
    fill(255);
    ellipse(myX+10,myY+10,10,20);
    ellipse(myX+10,myY,10,20);
    ellipse(myX,myY+10,20,10);
    ellipse(myX,myY,20,10); 
  }
  public void move()
  {
    myX = myX + (int)(Math.random()*7)-3;
    myY = myY + (int)(Math.random()*7)-3;
  }
}

interface Particle //list names of methods the classes have in common
{
  void show();
  void move();
}