/* 
TODO list:

1. change the queue array to linked list in snake class
2. introduce the encapsulation for the classes
3. how to handle nested variable calls?
.. the work on functional part is over, now to code style and optimisation

Snake game. Should I say more?
*/

// class instances
Game game;
GameoverScreen gameover;

void setup() {
  size(480, 480);
  game = new Game();
  gameover = new GameoverScreen();
  frameRate(60);
}

void draw() {
  if (game.isRunning){
    game.frame();
  } else {
    gameoverFrame();
  }
}


// change all to getters
void gameoverFrame() {
  if (game.score.scoreValue > game.score.highscoreValue) {
    game.score.highscoreValue = game.score.scoreValue;
  }
  gameover.setScore(game.score.scoreValue);
  gameover.setHighscore(game.score.highscoreValue);
  gameover.frame();
  if (!gameover.getGameoverState()) {
    game = new Game();
    game.score.highscoreValue = gameover.getHighscore();
    gameover = new GameoverScreen();
  }
}

// change all to getters
void keyPressed() {
    if (key == 'w') {
      game.snake.addKeyToStorage('w');
    }
    if (key == 's') {
      game.snake.addKeyToStorage('s');
    }
    if (key == 'a') {
      game.snake.addKeyToStorage('a');
    }
    if (key == 'd') {
      game.snake.addKeyToStorage('d');
    }
  }
