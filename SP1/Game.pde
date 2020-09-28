import java.util.Random;

class Game
{
  private Random rnd;
  private int width;
  private int height;
  private int[][] board;
  private Keys keys;
  private int playerLife;
  private int player2Life;
  private Dot player;
  private Dot player2;
  private Dot[] enemies;
  private Dot[] enemies2;
  private Dot[] food;
  private Dot[] food2;
  private boolean gameend;
  private int maxLife = 100;

  Game(int width, int height, int numberOfEnemies, int numberOfFood)
  {
    gameend = false;
    if (numberOfEnemies < 0)
    {
      throw new IllegalArgumentException("Number of enemies must be positive");
    } 
    this.rnd = new Random();
    this.board = new int[width][height];
    this.width = width;
    this.height = height;
    keys = new Keys();
    player = new Dot(4, 0, width-1, height-1);
    player2 = new Dot(20, 0, width-1, height-1);
    enemies = new Dot[numberOfEnemies];
    enemies2 = new Dot[numberOfEnemies];
    food = new Dot[numberOfFood];
    food2 = new Dot[numberOfFood];

    for (int i = 0; i < numberOfEnemies; ++i)
    {
      enemies[i] = new Dot(width-13, height-3, width-1, height-1);
    }
    for (int i = 0; i < numberOfEnemies; ++i)
    {
      enemies2[i] = new Dot(width-13, height-3, width-1, height-1);
    }
    for (int i = 0; i < numberOfFood; ++i)
    {
      food[i] = new Dot(0, 12, width/2, height/2);
    }
    for (int i = 0; i < numberOfFood; ++i)
    {
      food2[i] = new Dot(24, 12, width/2, height/2);
    }

    this.playerLife = 100;
    this.player2Life = 100;
  }

  public int getWidth()
  {
    return width;
  }

  public int getHeight()
  {
    return height;
  }

  public int getPlayerLife()
  {
    return playerLife;
  }

  public int getPlayer2Life()
  {
    return player2Life;
  }

  public void onKeyPressedPlayer(char ch)
  {
    keys.onKeyPressedPlayer(ch);
  }

  public void onKeyReleasedPlayer(char ch)
  {
    keys.onKeyReleasedPlayer(ch);
  }

  public void onKeyPressedPlayer2()
  {
    keys.onKeyPressedPlayer2();
  }

  public void onKeyReleasedPlayer2()
  {
    keys.onKeyReleasedPlayer2();
  }

  public void update()
  {
    if (gameend != true) {
      updatePlayer();
      updatePlayer2();
      updateEnemies();
      updateEnemies2();
      updateFood();
      updateFood2();
      checkEnemyCollisionsForPlayer();
      checkEnemyCollisionsForPlayer2();
      checkFoodCollisionForPlayer();
      checkFoodCollisionForPlayer2();
      checkPlayer1Life();
      checkPlayer2Life();
      repositionFood();
      clearBoard();
      populateBoard();
    } else {
      background(255);
    }
  }

  public int[][] getBoard()
  {
    //ToDo: Defensive copy?
    return board;
  }

  private void clearBoard()
  {
    for (int y = 0; y < height; ++y)
    {
      for (int x = 0; x < width; ++x)
      {
        board[x][y]=0;
      }
    }
  }

  private void updatePlayer()
  {
    //Update player
    if (keys.wDown())
    {
      player.moveUp();
    }
    if (keys.aDown())
    {
      player.moveLeft();
    }
    if (keys.sDown())
    {
      player.moveDown();
    }
    if (keys.dDown())
    {
      player.moveRight();
    }
  }

  private void updatePlayer2()
  {
    //Update player
    if (keys.arrowUp())
    {
      player2.moveUp();
    }
    if (keys.arrowLeft())
    {
      player2.moveLeft();
    }
    if (keys.arrowDown())
    {
      player2.moveDown();
    }
    if (keys.arrowRight())
    {
      player2.moveRight();
    }
  }

  private void updateEnemies()
  {
    for (int i = 0; i < enemies.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player.getX() - enemies[i].getX();
        int dy = player.getY() - enemies[i].getY();

        if (abs(dx) > abs(dy))
        {
          if (dx > 0)
          {
            //Player is to the right
            enemies[i].moveRight();
          } else
          {
            //Player is to the left
            enemies[i].moveLeft();
          }
        } else if (dy > 0)
        {
          //Player is down;
          enemies[i].moveDown();
        } else
        {//Player is up;
          enemies[i].moveUp();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          enemies[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          enemies[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          enemies[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          enemies[i].moveDown();
        }
      }
    }
  }

  private void updateEnemies2()
  {
    for (int i = 0; i < enemies2.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player2.getX() - enemies2[i].getX();
        int dy = player2.getY() - enemies2[i].getY();

        if (abs(dx) > abs(dy))
        {
          if (dx > 0)
          {
            //Player2 is to the right
            enemies2[i].moveRight();
          } else
          {
            //Player2 is to the left
            enemies2[i].moveLeft();
          }
        } else if (dy > 0)
        {
          //Player2 is down;
          enemies2[i].moveDown();
        } else
        {//Player2 is up;
          enemies2[i].moveUp();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          enemies2[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          enemies2[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          enemies2[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          enemies2[i].moveDown();
        }
      }
    }
  }

  private void updateFood()
  {
    for (int i = 0; i < food.length; ++i)
    {
      //Should we flee or move randomly?
      //2 out of 3 we will flee..
      if (rnd.nextInt(3) < 2)
      {
        //We flee
        int dx = player.getX() - food[i].getX();
        int dy = player.getY() - food[i].getY();
        if (abs(dx) > abs(dy))
        {
          if (dx > 0)
          {
            //Player is to the right
            food[i].moveLeft();
          } else
          {
            //Player is to the left
            food[i].moveRight();
          }
        } else if (dy > 0)
        {
          //Player is down;
          food[i].moveUp();
        } else
        {//Player is up;
          food[i].moveDown();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          food[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          food[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          food[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          food[i].moveDown();
        }
      }
    }
  }

  private void updateFood2()
  {
    for (int i = 0; i < food2.length; ++i)
    {
      //Should we flee or move randomly?
      //2 out of 3 we will flee..
      if (rnd.nextInt(3) < 2)
      {
        //We flee
        int dx = player2.getX() - food2[i].getX();
        int dy = player2.getY() - food2[i].getY();
        if (abs(dx) > abs(dy))
        {
          if (dx > 0)
          {
            //Player2 is to the right
            food2[i].moveLeft();
          } else
          {
            //Player2 is to the left
            food2[i].moveRight();
          }
        } else if (dy > 0)
        {
          //Player2 is down;
          food2[i].moveUp();
        } else
        {//Player2 is up;
          food2[i].moveDown();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          food2[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          food2[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          food2[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          food2[i].moveDown();
        }
      }
    }
  }

  private void populateBoard()
  {
    //Insert players
    board[player.getX()][player.getY()] = 1;
    board[player2.getX()][player2.getY()] = 4;

    //Insert enemies
    for (int i = 0; i < enemies.length; ++i)
    {
      board[enemies[i].getX()][enemies[i].getY()] = 2;
    }
    //Insert enemies2
    for (int i = 0; i < enemies2.length; ++i)
    {
      board[enemies2[i].getX()][enemies2[i].getY()] = 2;
    }
    //Insert food
    for (int i = 0; i< food.length; ++i)
    {
      board[food[i].getX()][food[i].getY()] = 3;
    }
    //Insert food2
    for (int i = 0; i< food2.length; ++i)
    {
      board[food2[i].getX()][food2[i].getY()] = 3;
    }
  }

  private void checkEnemyCollisionsForPlayer()
  {
    //Check enemy collisions for player 1.
    for (int i = 0; i < enemies.length; ++i)
    {
      if (enemies[i].getX() == player.getX() && enemies[i].getY() == player.getY())
      {
        if (playerLife > 0) --playerLife;
      }
    }
    
    //Check enemy2 collisions for player 1.
    for (int i = 0; i < enemies2.length; ++i)
    {
      if (enemies2[i].getX() == player.getX() && enemies2[i].getY() == player.getY())
      {
        //We have a collision
        if (playerLife > 0) --playerLife;
      }
    }
  }

  private void checkEnemyCollisionsForPlayer2()
  {
    //Check enemy collisions for player 2.
    for (int i = 0; i < enemies.length; ++i)
    {
      if (enemies[i].getX() == player2.getX() && enemies[i].getY() == player2.getY())
      {
        //We have a collision
        if (player2Life > 0) --player2Life;
      }
    }
    
    //Check enemy2 collisions for player 2.
    for (int i = 0; i < enemies2.length; ++i)
    {
      if (enemies2[i].getX() == player2.getX() && enemies2[i].getY() == player2.getY())
      {
        //We have a collision
        if (player2Life > 0) --player2Life;
      }
    }
  }


  private void checkFoodCollisionForPlayer() {
    //Check food collisions for player 1
    for (int i = 0; i < food.length; ++i) {

      if (playerLife < maxLife && food[i].getX() == player.getX() && food[i].getY() == player.getY()) {

        //We have a collision
        ++playerLife;
        
        changePosition(food[i]);
      }
    }
    //Check food2 collisions for player 1
    for (int i = 0; i < food2.length; ++i) {

      if (playerLife < maxLife && food2[i].getX() == player.getX() && food2[i].getY() == player.getY()) {

        //We have a collision
        ++playerLife;
        
        changePosition(food2[i]);
      }
    }
  }

  private void checkFoodCollisionForPlayer2() {
    //Check food collisions for player 2
    for (int i = 0; i < food.length; ++i) {

      if (player2Life < maxLife && food[i].getX() == player2.getX() && food[i].getY() == player2.getY()) {

        //We have a collision
        ++player2Life;
        
        changePosition(food[i]);
      }
    }
    //Check food2 collisions for player 2
    for (int i = 0; i < food2.length; ++i) {

      if (player2Life < maxLife && food2[i].getX() == player2.getX() && food2[i].getY() == player2.getY()) {

        //We have a collision
        ++player2Life; //<>//
        
        changePosition(food2[i]);
      }
    } //<>//
  }
  
  private void changePosition(Dot food) {
    boolean newPositionFound = false;
    
    while(!newPositionFound) {
       // Get position and check that new position
       int[] positions = getAndCheckPosition();
       
       if (positions != null) {
         food.x = positions[0];
         food.y = positions[1];
         
         // New positions found
         newPositionFound = true; 
       } 
    }
  }
  
  private int[] getAndCheckPosition() {
     int newX = (int) random(0, 24);
     int newY = (int) random(0, 24);
     int[] newPosition = new int[2];
      
     if ((newX != player.x && newY != player.y) && (newX != player2.x && newY != player2.y)) {
       newPosition[0] = newX;
       newPosition[1] = newY;
       return newPosition;
     }
     return null;
  }

  private void repositionFood() {
    //Check food collisions
    for (int i = 0; i < food.length; ++i) {

      if (playerLife < maxLife && food[i].getX() == player.getX() && food[i].getY() == player.getY()) {

        //We have a collision
      }
    }
  }

  private void checkPlayer1Life() {
    for (int i = 0; i < 1; ++i)

      //We have a collision
      if (playerLife <= 0) {
        gameend = true;
      }
  }
  private void checkPlayer2Life() {
    for (int i = 0; i < 1; ++i)

      //We have a collision
      if (player2Life <= 0) {
        gameend = true;
      }
  }
}
