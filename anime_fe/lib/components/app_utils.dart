class AppUtils{
  AppUtils._();

  static bool isValidEmail(String text) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(text);
  }

  static bool isValidName(String text) {
    return RegExp(
        r'^([a-zA-Z ]+)$')
        .hasMatch(text);
  }
}