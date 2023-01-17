class Game {
  float B1Alpha = 100, B2Alpha = 250, B3Alpha = 100; //0 -> 255
  
  void StartMenu () {
    fill(127, 207, 214, B1Alpha);
    rect(width/2, height/2 - 45, 200, 50, 5);
    fill(255, B2Alpha);
    text("Play", (width /2) - (textWidth("Play") / 2), (height/2) - 35);

    fill(127, 207, 214, B3Alpha);
    rect(width/2, height/2 + 55, 200, 50, 5);
    fill(255, B2Alpha);
    text("Quit", (width /2) - (textWidth("Quit") / 2), (height/2) + 65);
    textSize(20);
    fill(0,100);
    rect(600,100,900,120);
    fill(255);
    text("Tutorial: You start collecting planets and your level increases when you get 10 planets", 170, 70);
    text("Don't forget to avoid asteroids!! it could hurt you.", (250) , 100);
    text("Controls: Use left(<--) and right(-->) arrows to move, (P) to pause. Have fun!", (170) , 130);

    if (Menu) {
      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height/2 - 70 && mouseY < height/2 - 20) {
        if (mousePressed) {         
          Menu = false;
        }
        if (B1Alpha < 150) {
          B1Alpha += 5;
        }
      } else if (B1Alpha > 100) {
        B1Alpha -= 5;
      }


      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height/2 + 30 && mouseY < height/2 + 80) {
        if (mousePressed) {
          exit();
        }
        if (B3Alpha < 150) {
          B3Alpha += 5;
        }
      } else if (B3Alpha > 100) {
        B3Alpha -= 5;
      }
    }
    if (!Menu) {
      if (B1Alpha > 0) {
        B1Alpha -= 10;
      }
      
      if (B2Alpha > 0) {
        B2Alpha -= 25;
      }

      if (B3Alpha > 0) {
        B3Alpha -= 10;
      }
    }
    if (B1Alpha == 0 && B2Alpha == 0 && B3Alpha == 0) {
      state = 1;
    }
  }
}
