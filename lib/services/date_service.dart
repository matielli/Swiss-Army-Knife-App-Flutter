class DateService {
  static Duration differenceBetweenDates(DateTime start, DateTime end) {
    return end.difference(start);
  }

  static DateTime convertTimeZone(DateTime date, int offsetHours) {
    return date.add(Duration(hours: offsetHours));
  }
}
