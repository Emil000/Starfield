Particle[] aBunch = new Particle [500];

void setup()
{
	size(880,880);
	background(255);
	noStroke();
	aBunch = new Particle[6000];

  
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

class Normal implements Particle;
{
  double myX, myY, myColir,mySize;
  Normal()
  {
    myX=250;
    myY=250;
    myColor=(int)(Math.random()*50)+170;
    mySize=4;
    myAngle=()
}
}
  
  
class Oddball implements Particle;
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
  }
  public void move()
  {

  }
}

interface Particle //list names of methods the classes have in common
{
  void show();
  void move();
}