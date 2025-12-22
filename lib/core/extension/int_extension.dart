
extension IntExtension on int {
  bool isDayBetween(
    int from,
    int to,
  ) {
    List<int> days = [1, 2, 3, 4, 5, 6, 7];
    // log('Days $days');
    List<int> sub = from > to ? days.sublist(days.indexOf(from)) : [];
    // log('Days $sub');
    days.removeWhere((element) => sub.contains(element));
    // log('Days $days');
    days.insertAll(0, sub);
    // log('Days $days');
    int start = days.indexOf(from);
    int end = days.indexOf(to);
    List<int> activeDays = days.sublist(start, end + 1);
    // log('Days $activeDays');

    return activeDays.contains(this);
  }


  // String getRatingText() {
  //   switch (this) {
  //     case 10:
  //     case 9:
  //       return isEnglish() ? 'Excellent' : 'ممتاز';
  //     case 8:
  //     case 7:
  //       return isEnglish() ? 'Very Good' : 'جيد جداً';
  //     case 6:
  //     case 5:
  //       return isEnglish() ? 'Good' : 'مقبول';
  //     case 4:
  //     case 3:
  //       return isEnglish() ? 'Bad' : 'ضعيف';
  //     case 2:
  //     case 1:
  //     case (this<1)&&this>0:
  //       return isEnglish() ? 'Very Bad' : 'سيء جداً';
  //     case 0:
  //       return isEnglish() ? 'Not Yet Rated' : 'لا تقييم';
  //     default:
  //       return isEnglish() ? 'Unknown Rate' : 'تقييم غير معروف';
  //   }
  // }
}
