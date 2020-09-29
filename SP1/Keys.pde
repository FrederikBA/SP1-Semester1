class Keys
{
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  private boolean arrowDown = false;
  private boolean arrowUp = false;
  private boolean arrowRight = false;
  private boolean arrowLeft = false;

  public Keys() {
  }

  public boolean wDown()
  {
    return wDown;
  }

  public boolean aDown()
  {
    return aDown;
  }

  public boolean sDown()
  {
    return sDown;
  }

  public boolean dDown()
  {
    return dDown;
  }

  public boolean arrowDown()
  {
    return arrowDown;
  }

  public boolean arrowUp()
  {
    return arrowUp;
  }

  public boolean arrowLeft()
  {
    return arrowLeft;
  }

  public boolean arrowRight()
  {
    return arrowRight;
  }

  void onKeyPressedPlayer(char k) {
    if (k=='a' || k=='A') {
      aDown=true;
    }
    if (k=='s' || k=='S') {
      sDown=true;
    }
    if (k=='w' || k=='W') {
      wDown=true;
    }
    if (k=='d' || k=='D') {
      dDown=true;
    }
  }

  void onKeyReleasedPlayer(char k) {
    if (k=='a' || k=='A') {
      aDown=false;
    }
    if (k=='s' || k=='S') {
      sDown=false;
    }
    if (k=='w' || k=='W') {
      wDown=false;
    }
    if (k=='d' || k=='D') {
      dDown=false;
    }
  }

  void onKeyPressedPlayer2() {
    if (key == CODED) {
      if (keyCode == LEFT) {
        arrowLeft = true;
      }
      if (keyCode == RIGHT) {
        arrowRight = true;
      }
      if (keyCode == UP) {
        arrowUp = true;
      }
      if (keyCode == DOWN) {
        arrowDown = true;
      }
    }
  }

  void onKeyReleasedPlayer2() {
    if (key == CODED) {
      if (keyCode == LEFT) {
        arrowLeft = false;
      }
      if (keyCode == RIGHT) {
        arrowRight = false;
      }
      if (keyCode == UP) {
        arrowUp = false;
      }
      if (keyCode == DOWN) {
        arrowDown = false;
      }
    }
  }
}
