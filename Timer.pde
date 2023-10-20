class Timer
{
  int timer = 60;
  int previousMillis = 0;
  int interval = 1000;
  boolean isRunning = true;

  int getTime() {
    if (isRunning) {
      int currentMillis = millis();
      if (currentMillis - previousMillis >= interval && gameOver == false) {
        timer--;
        previousMillis = currentMillis;
        if (timer == 0) {
          stopTimer();
        }
      }
    }

    return timer;
  }

  void stopTimer() {
    isRunning = false;
  }
}
