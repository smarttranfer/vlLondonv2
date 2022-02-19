class ActionJS {
  static String splitString(String content) {
    if (content.length > 15) {
      return content.substring(0, 13) + "...";
    } else {
      return content + "         ";
    }
  }
}
