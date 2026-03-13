import 'package:intl/intl.dart';

int calcHour(dynamic epochDate) {
  DateTime localDate = DateTime.fromMillisecondsSinceEpoch(epochDate * 1000);
  var format = DateFormat('H');
  var hour = format.format(localDate);

  return int.parse(hour);
}

String convertTime(int theDate, int timezoneOffset) {
  final DateTime utc = DateTime.fromMillisecondsSinceEpoch(theDate * 1000, isUtc: true);
  final DateTime cityTime = utc.add(Duration(seconds: timezoneOffset));
  return DateFormat("h:mm a").format(cityTime);
}

String convertToTitleCase(String text) {
  if (text.length <= 1) {
    return text.toUpperCase();
  }

  // Split string into multiple words
  final List<String> words = text.split(' ');

  // Capitalize first letter of each words
  final capitalizedWords = words.map((word) {
    if (word.trim().isNotEmpty) {
      final String firstLetter = word.trim().substring(0, 1).toUpperCase();
      final String remainingLetters = word.trim().substring(1);

      return '$firstLetter$remainingLetters';
    }
    return '';
  });

  // Join/Merge all words back to one String
  return capitalizedWords.join(' ');
}
