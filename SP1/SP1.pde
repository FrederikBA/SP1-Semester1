import java.util.Random;

Game game = new Game(25, 25, 3, 1);
PFont font;

public void settings() {
  size(1001, 1001);
}

void setup()
{
  frameRate(10);
  font = createFont("Arial", 16, true);
  textFont(font, 16);
}

void keyReleased()
{
  game.onKeyReleasedPlayer(key);
  game.onKeyReleasedPlayer2();
}

void keyPressed()
{
  game.onKeyPressedPlayer(key);
  game.onKeyPressedPlayer2();
}

void draw()
{
  game.update();
  background(0);
  
  drawBoard();
  if (game.playerLife == 0 || game.player2Life == 0) {
    textFont(font, 40);
    if (game.player2Life == 0 && game.playerLife > 0) {
      text("PLAYER 1 WON", 350, height/2);
    }
    if (game.playerLife == 0 && game.player2Life > 0) {
      text("PLAYER 2 WON", 350, height/2);
    }
  }
}

void drawBoard() {

  int[][] board = game.getBoard();
  if (game.gameEnd == false) {
    for (int y = 0; y < game.getHeight(); y++)
    {
      for (int x = 0; x < game.getWidth(); x++)
      {
        if (board[x][y] == 0)
        {
          fill(0, 0, 0);
        } else if (board[x][y] == 1)
        {
          fill(0, 0, 255);
        } else if (board[x][y] == 2)
        {
          fill(255, 0, 0);
        } else if (board[x][y] == 3)
        {
          fill(0, 255, 0);
        } else if (board[x][y] == 4)
        {
          fill(140, 0, 211);
        }
        stroke(100, 100, 100);
        rect(x*40, y*40, 40, 40);
      }
    }
    fill(255);
    text("Player 1 Life: "+game.getPlayerLife(), 25, 25);
    text("Player 2 Life: "+game.getPlayer2Life(), 850, 25);
  }
}
