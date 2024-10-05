int findThreshold(int floors) {
  int egg1 = 0;
  int step = 1;

  // پیدا کردن نقطه شروع برای پرتاب تخم‌مرغ اول
  while ((step * (step + 1)) / 2 < floors) {
    step++;
  }

  int dropPoint = step;

  while (egg1 + dropPoint <= floors) {
    egg1 += dropPoint;
    dropPoint--;
  }

  // حالا تخم‌مرغ دوم برای طبقات زیرین شروع به جستجو می‌کند
  for (int egg2 = egg1 - dropPoint; egg2 < egg1; egg2++) {
    if (isBroken(egg2)) {
      return egg2 - 1; // آستانه طبقه‌ی شکست
    }
  }

  return egg1; // اگر هیچ تخم‌مرغی نشکست
}

bool isBroken(int floor) {
  int breakingPoint = 0; // فرض می‌کنیم طبقه 150 آستانه شکست است
  return floor >= breakingPoint;
}

void main() {
  int threshold = findThreshold(200);
  print('آستانه شکست تخم‌مرغ در طبقه: $threshold');
}
