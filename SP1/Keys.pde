class Keys
{
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  private boolean iDown = false;
  private boolean jDown = false;
  private boolean kDown = false;
  private boolean lDown = false;

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
  public boolean iDown()
  {
    return iDown;
  }

  public boolean jDown()
  {
    return jDown;
  }

  public boolean kDown()
  {
    return kDown;
  }

  public boolean lDown()
  {
    return lDown;
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

  void onKeyPressedPlayer2(char k) {
    if (k=='j' || k=='J') {
      jDown=true;
    }
    if (k=='k' || k=='K') {
      kDown=true;
    }
    if (k=='i' || k=='I') {
      iDown=true;
    }
    if (k=='l' || k=='L') {
      lDown=true;
    }
  }

  void onKeyReleasedPlayer2(char k) {
    if (k=='j' || k=='J') {
      jDown=false;
    }
    if (k=='k' || k=='K') {
      kDown=false;
    }
    if (k=='i' || k=='I') {
      iDown=false;
    }
    if (k=='l' || k=='L') {
      lDown=false;
    }
  }
}
