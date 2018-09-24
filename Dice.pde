void setup()
{
  size (500, 110);
	noLoop();
}
void draw()
{
	Die bob = new Die(5, 5);
  bob.show();
}
void mousePressed()
{
	redraw();
}
class Die //models one single dice cube
{
  //all of my variables that needs to be initiallized
	int myX, myY, num;
	
	Die(int x, int y) //constructor
	{
		myX = x;
    myY = y;
    roll();
	}
  
  //function to randomly determine the value of the die
	void roll()
	{
		num = (int)(Math.random() * 6) + 1;
	}

  //function to show die
	void show()
	{
		fill(255);
    rect(myX, myY, 100, 100);
    sideFace(2);
	}

  //function to show the face
  void sideFace(int a){
    //selects color
    fill(0, 0, 255);
    
    //picks a random side to show depending on the roll performed
    if (a == 1){
      ellipse(myX + 50, myY + 50, 40, 40);
    } else if (a == 2){
      ellipse(myX + 32, myY + 32, 30, 30);
      ellipse(myX + 68, myY + 68, 30, 30);
    }
  }
}
