class Keys
{
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  private boolean UPDown = false;
  private boolean LEFTDown = false;
  private boolean DOWNDown = false;
  private boolean RIGHTDown = false;

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
  public boolean UPDown()
  {
    return UPDown;
  }

  public boolean LEFTDown()
  {
    return LEFTDown;
  }

  public boolean DOWNDown()
  {
    return DOWNDown;
  }

  public boolean RIGHTDown()
  {
    return RIGHTDown;
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

  void onKeyPressedPlayer2(char ch) {
    if (ch == CODED) {
      if (keyCode == UP)
      {
        UPDown = true;
      } else if (keyCode == LEFT)
      {
        LEFTDown = true;
      } else if (keyCode == DOWN)
      {
        DOWNDown = true;
      } else if (keyCode == RIGHT)
      {
        RIGHTDown = true;
      }
    }
  }

  void onKeyReleasedPlayer2(char ch) {
if (ch == CODED) {
      if (keyCode == UP)
      {
        UPDown = false;
      } else if (keyCode == LEFT)
      {
        LEFTDown = false;
      } else if (keyCode == DOWN)
      {
        DOWNDown = false;
      } else if (keyCode == RIGHT)
      {
        RIGHTDown = false;
      }
    }
  }
}
