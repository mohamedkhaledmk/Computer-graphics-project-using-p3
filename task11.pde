import processing.sound.*;  //importing sound library
PShape background;   //importing shapes and images used
PShape alien;
PShape planet;
PShape meteor;
PShape star;
PImage menu;
PImage bg2;

SoundFile sound5;   //declaring soundfile vars
SoundFile fail_sound;
SoundFile reward_sound;

boolean Menu = true;   //to check if we are in menu page or not
boolean paused = false;  //to check if we are in pause page or not

int planetCount = 7;             //to store number of planets on screen
int level = 1;                   //to store level
float angle = 0;                 //to store angle
int state = 0;                   //0--> means homepage, 1-->game ,2-->gameover page


// defining array list to store planets
ArrayList<planet> planetList; 

// defining array list to store stars shown in menu page
ArrayList<star> starlist;

// defining array list to store meteors 
ArrayList<meteor> meteorList;


Game game;    //defining objects of game, alien, score  classess
alien l;  
Score s;

void setup()
{
  size(1150, 600);           //setting window size    //1800*800
  
  /////////////////////////////////LOADING SHAPES AND IMAGES/////////////////////////////////
  bg2 = loadImage("bg2.jpg");  //loading shapes and images 
  star = loadShape("star.svg");
  background = loadShape("background.svg");
  alien = loadShape("alien.svg");
  planet = loadShape("planet.svg");
  meteor = loadShape("meteor.svg");
  menu = loadImage("menu2.png");
  
    /////////////////////////////////LOADING SOUNDS/////////////////////////////////
  sound5 = new SoundFile(this, "sound5.mp3");  //loading sounds, sound5-->ingame sound
  fail_sound = new SoundFile(this, "lose1.mp3");   //lose sound effect
  reward_sound = new SoundFile(this, "reward1.mp3");    //reward sound effect
  
    /////////////////////////////////INTIALIZING OUR ARRAYLISTS WITH EMPTY LISTS/////////////////////////////////
  planetList = new ArrayList<planet>();
  starlist = new ArrayList<star>();
  meteorList = new ArrayList<meteor>();

  /////////////////////////////////INTIALIZING VARIABLES/////////////////////////////////
  initialize(); 
  
  
/////////////////////////////////DRAWING STARS IN MENU/////////////////////////////////
  for (int i=0; i < 7; i++)
  {
    starlist.add(new star());   
  }
  noStroke();
  frameRate(40);      // setting the frame rate in menu page to 40 

  game = new Game();

}


void draw()
{
 /////////////////////////////////MENU SCREEN/////////////////////////////////
  if (state==0) {         //state 0 means we are in menu page
    background(bg2);      //loading background of menu
    rectMode(CENTER);     //start drawing from center
    textSize(30);         //setting text size
    translate(width/2, height/2);   // translate to center
    for (int i = 1; i < starlist.size(); i++)  //drawing starts
    {
      starlist.get(i).drawstar();        //getting star and drawing it
      starlist.get(i).movestar();        //moving animation 
    } 

    translate(-width/2, -height/2);     //returning back to corner

    image(menu, 418, 45, 330, 420);    //showing the background of menu 
    game.StartMenu();                  //calling StartMenu Function which draws buttons on menu.
    
  /////////////////////////////////GAME SCREEN/////////////////////////////////
  } else if (state==1)         
  {
    scale(0.6);             //adding scale to reduce sizes 
    shape(background);         //background of ingame screen

    for (int i = 0; i < meteorList.size(); i++) {    //for each meteor in the list
      meteorList.get(i).drawmeteor();    //draw the meteor
      meteorList.get(i).movemeteor();    //movement animation
      meteorList.get(i).level = level;   // assiging current level of game to meteor level
      if (meteorList.get(i).hitTest(l)) {    //check if meteor hitted alien
        fail_sound.play();                    //if so, play the funny fail sound
        state=2;                            //and go to state 2, which is gameover screen
      }
    }
    for (int i = 0; i < planetList.size(); i++)   //for each planet in the list
    {
      planetList.get(i).drawplanet();            //draw the planet
      planetList.get(i).moveplanet();            //movement animation
      if (planetList.get(i).hitTest(l))          //check if alien collected the planet
      {
        reward_sound.play();                   //if so, play the reward sound
        planetList.remove(i);                  //remove that planet
        s.count ++;                            //incrementing the user score
        if (s.count%10==0) {                    //if user collected 10 planets, increment his level
          level ++;
          for (int j=0; j<level; j++)         //adding additional meteor for each level
            meteorList.add(new meteor(random(0, 1800), -500, random(-1, 1), random(1, 2)));
        }
        //adding planet to the list for the next iteration
        planetList.add(new planet(random(0, 1800), random(-500, -200), random(-1, 1), random(1, 2)));
        planetList.get(planetList.size()-1).level = level; //assigning planet level to game level
      }
      if (planetList.get(i).y>1000) {  //if planet position passed screen    
        planetList.remove(i);
        planetList.add(new planet(random(0, 1800), random(-500, -200), random(-1, 1), random(1, 2)));
        planetList.get(planetList.size()-1).level = level;
      }
    }
    l.drawalien();   //drawing alien
    l.moving();       //moving alien
    s.scoreUpdate();    //updating score
//    textAlign(CENTER);
    fill(255);

    text("LEVEL:"+level, 1800, 40);
    text("Click P to pause/resume", 250, 40);

    //print scoring and game over text on screen
    
    
    
     /////////////////////////////////GAMEOVER SCREEN/////////////////////////////////
  } else if (state==2) {
    sound5.stop();
    background(255);   //drawing white background

    textAlign(CENTER);
    fill(0);
    textSize(50);
    text("GAME OVER!", 570, 200);   //texts in gameover
    text("YOUR SCORE: "+s.count, 570, 300);
    textSize(30);
    text("Click Enter to restart!", 570, 400);
    if (keyCode==ENTER) {          //reseting variables if we press ENTER to restart the game
      state = 1;
      planetList.clear();
      meteorList.clear();
      initialize();
    } else {

      translate(width/2, height/2); /* translate all the drawing to the middle of the screen */
      angle=angle+0.0009; /* update the value in the variable 'angle'. This means that we add 1 to 'angle' every frame */
      
      for (int i = 0; i < 70; i++) { /* this for loop organises the drawing. It will do the drawing 70 times (between 0 and 69)  */
        rotate(angle); /* rotate the coordinate system a bit */
        stroke(13*i, 0, 13*i, 60);//extra;decent blue : stroke(10*i,12*i,13*i); 
        strokeWeight(5);

        line(i, i, i*5, i*5);
      }
    }
  }
}


public void initialize() {   //initializing variables
  s = new Score();
  s.count = 0;
  l = new alien();
  level  = 1;

  sound5.loop();
  sound5.amp(.2);
  
  planetList = new ArrayList<planet>();
  for (int i=0; i < planetCount; i++)
  {
    planetList.add(new planet(random(0, 1800), random(-50, 0), random(-2, 2), random(1, 3)));   //x range,y,dirx,diry
  }
  meteorList.add(new meteor(random(0, 1800), -500, random(-5, 5), random(1, 3)));
}


 /////////////////////////////////PAUSE FUNCTION/////////////////////////////////
public void keyPressed() { 

  if ( key == 'p' ) {    //if we press p , change state of pause variable

    paused = !paused;

    if (paused) {    //if true, pause the game using noLoop
      fill(0, 70);
      rect(0, 0, 4000, 2000);
      textSize(40);
      fill(255);
      text("Paused", 980, 420);
      text("Click (P) to resume", 980, 500);
      noLoop();
    } else {      //if false, continue the game using loop();
      loop();
    }
  }
}
