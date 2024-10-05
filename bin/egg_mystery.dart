int findThreshold(int floors) {
  int x = 0;
  while ((x * (x + 1)) / 2 < floors) {
    x++;
  }

  int currentFloor = 0;
  int step = x;

  while (step > 0 && currentFloor + step <= floors) {
    currentFloor += step;
    step--;
    if (isBroken(currentFloor)) {
      for (int i = currentFloor - step; i < currentFloor; i++) {
        if (isBroken(i)) {
          return i - 1;
        }
      }
    }
  }

  return currentFloor;
}

bool isBroken(int floor) {
  int breakingPoint = 150;
  return floor >= breakingPoint;
}

void main() {
  int threshold = findThreshold(200);
  print('آستانه شکست تخم‌مرغ در طبقه: $threshold');
}
