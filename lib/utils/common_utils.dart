class CommonUtils {
  static String capitalizeString(String string) {
    return string[0].toUpperCase() + string.substring(1);
  }

  static String getFormattedDate(
    DateTime dateTime, {
    bool pretty = true,
    bool twoLine = false,
  }) {
    DateTime now = DateTime.now();
    if (pretty) {
      if (dateTime.year == now.year) {
        if (dateTime.month == now.month) {
          if (dateTime.day == now.day - 1) {
            return "Yesterday";
          }
          if (dateTime.day == now.day) {
            return "Today";
          }
          if (dateTime.day == now.day + 1) {
            return "Tomorrow";
          }
        }
      }
    }

    return "${dateTime.day.toString().length == 1 ? "0" : ""}${dateTime.day}${prettyNumberAppender(number: dateTime.day)} ${getMonthNameFromIndex(dateTime.month)},${twoLine ? "\n" : ""} ${dateTime.year}";
  }

  static String getMonthNameFromIndex(int index) {
    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];

    return months[index - 1];
  }

  static String prettyNumberAppender({
    required int number,
  }) {
    String postfix = "";
    switch (number) {
      case 1:
        postfix = "st";
        break;
      case 2:
        postfix = "nd";
        break;
      case 3:
        postfix = "rd";
        break;
      case 4:
        postfix = "th";
        break;
      case 5:
        postfix = "th";
        break;
      case 6:
        postfix = "th";
        break;
      case 7:
        postfix = "th";
        break;
      case 8:
        postfix = "th";
        break;
      case 9:
        postfix = "th";
        break;
      case 10:
        postfix = "th";
        break;
      case 11:
        postfix = "th";
        break;
      case 12:
        postfix = "th";
        break;
      case 13:
        postfix = "th";
        break;
      case 14:
        postfix = "th";
        break;
      case 15:
        postfix = "th";
        break;
      case 16:
        postfix = "th";
        break;
      case 17:
        postfix = "th";
        break;
      case 18:
        postfix = "th";
        break;
      case 19:
        postfix = "th";
        break;
      case 20:
        postfix = "th";
        break;
      case 21:
        postfix = "st";
        break;
      case 22:
        postfix = "nd";
        break;
      case 23:
        postfix = "rd";
        break;
      case 24:
        postfix = "th";
        break;
      case 25:
        postfix = "th";
        break;
      case 26:
        postfix = "th";
        break;
      case 27:
        postfix = "th";
        break;
      case 28:
        postfix = "th";
        break;
      case 29:
        postfix = "th";
        break;
      case 30:
        postfix = "th";
        break;
      case 31:
        postfix = "st";
        break;
    }
    return postfix;
  }
  
}
