import 'dart:core';
/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */
extension EmailValidator on String {
  bool isEmailValid() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}
