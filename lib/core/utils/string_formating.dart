abstract class StringFormatting {
  static String phoneFormatting(String phone) {
    final countryCode = phone.substring(1, 3);
    final ddd = phone.substring(2, 4);
    final firstHalf = phone.substring(4, 9);
    final secondHalf = phone.substring(10);

    return "+$countryCode ($ddd) $firstHalf-$secondHalf";
  }

  static String dateFormattingFromDatetimeString(String dateString) {
    final date = DateTime.tryParse(dateString);
    return "${((date?.day ?? 0) < 10) ? "0${date?.day}" : date?.day}/${date?.month}/${date?.year}";
  }
}
