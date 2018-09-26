void setup(){
  size (700, 520);
  background(#0358FF);
  fill(0);
  textSize(20);
  text("Welcome to Dice Game", 280, 10);
	noLoop();
  textSize(11);
}
void draw(){
  //variables to track 2 different dice totals
  int firstPlayerScore = 0;
  int secondPlayerScore = 0;
  
  //2 for loops to make 2 sets of 3-by-3 dice squares
  for (int d = 105; d < 420; d += 105){
    for (int c = 5; c < 320; c +=105){
      Die playerA = new Die(c, d);
      playerA.show();
      firstPlayerScore += playerA.num;
    }
  }
  
  for (int f = 105; f < 420; f += 105){
    for (int e = 595; e > 320; e = e - 105){
      Die playerB = new Die(e, f);
      playerB.show();
      secondPlayerScore += playerB.num;
    }
  }
  
  //prints out each player's score
  scoreTextBox("Player A Total: " + firstPlayerScore, 30, 430);
  scoreTextBox("Player B Total: " + secondPlayerScore, 420, 430);
  
  //prints out which player wins
  if(firstPlayerScore > secondPlayerScore) {
    winnerTextBox("Player A Wins");
  }
  else if (firstPlayerScore < secondPlayerScore) {
    winnerTextBox("Player B Wins");
  }
  else {
    winnerTextBox("  All Tied Up");
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

void scoreTextBox(String text, int x, int y){
  fill(255);
  rect(x, y, 250, 50);
  fill(100);
  text(text, x + 75, y + 25);
}

void winnerTextBox(String text){
  fill(255, 255, 0);
  rect(300, 440, 100, 30);
  fill(0);
  text(text, 315, 460);
}
