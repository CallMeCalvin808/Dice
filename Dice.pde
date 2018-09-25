void setup(){
  size (700, 320);
	noLoop();
}
void draw(){
  for (int d = 5; d < 320; d += 105){
    for (int c = 5; c < 320; c +=105){
      Die playerA = new Die(c, d);
      playerA.show();
    }
  }
}
void mousePressed(){
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
	void roll(){
		num = (int)(Math.random() * 6) + 1;
	}

  //function to show die
	void show(){
		fill(255);
    rect(myX, myY, 100, 100);
    sideFace(num);
	}

  //function to show the face
  void sideFace(int a){
    //selects color
    fill(0, 0, 255);
    
    //picks a random side to show depending on the roll performed
    if (a == 1){
      ellipse(myX + 50, myY + 50, 40, 40);
    }
    else if (a == 2){
      ellipse(myX + 32, myY + 32, 30, 30);
      ellipse(myX + 68, myY + 68, 30, 30);
    }
    else if (a == 3){
      for (int j = 20; j <= 100; j +=30){
        ellipse(j + myX, j + myY, 20, 20);
      }
    }
    else if (a == 4){
      for (int j = 25; j <= 100; j +=50){
        for (int i = 25; i <= 100; i +=50){
          ellipse(i + myX, j + myY, 20, 20);
        }
      }
    }
    else if (a == 5) {
      for (int j = 25; j <= 100; j +=50){
        for (int i = 25; i <= 100; i +=50){
          ellipse(i + myX, j + myY, 20, 20);
        }
      }
      ellipse(myX + 50, myY + 50, 20, 20);
    }
    else {
      for (int j = 20; j <= 100; j +=30){
        for (int i = 30; i <= 100; i +=40){
          ellipse(i + myX, j + myY, 20, 20);
        }
      }
    }
  }
}
