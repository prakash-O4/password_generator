import 'dart:math';

class Logic {
  var _upperLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  var _lowerLetters = "abcdefghijklmnopqrstuvwxyz";
  var _numbers = "0123456789";
  var _symbols = "!@#\$%^&*()_+=";
  getNumbers() {
    var random = Random().nextInt(_numbers.length);
    return _numbers[random.floor()];
  }

  getLowerCase() {
    var random = Random().nextInt(_lowerLetters.length);
    return _lowerLetters[random.floor()];
  }

  getUpperCase() {
    var random = Random().nextInt(_upperLetters.length);
    return _upperLetters[random.floor()];
  }

  getSymbols() {
    var random = Random().nextInt(_symbols.length);
    return _symbols[random.floor()];
  }

  generatePassword(int value, bool? number, bool? symbols, bool? lowerCase,
      bool? upperCase) {
    String password = "";
    for (var i = 0; i < value; i++) {
      var a = generateOnePass(number, symbols, lowerCase, upperCase);
      if (a == false) {
        return "Kunai ta select gar mg";
      } else {
        password += a.toString();
      }
    }
    return password;
  }

  generateOnePass(
      bool? number, bool? symbols, bool? lowerCase, bool? upperCase) {
    var onePass = [];
    if (number == true) {
      onePass.add(getNumbers());
    }
    if (upperCase == true) {
      onePass.add(getUpperCase());
    }
    if (lowerCase == true) {
      onePass.add(getLowerCase());
    }
    if (symbols == true) {
      onePass.add(getSymbols());
    }
    if (onePass.isNotEmpty) {
      var random = Random().nextInt(onePass.length);
      return onePass[random.floor()];
    } else {
      return false;
    }
  }
}

enum BoolEnum {
  UpperCase,
  LowerCase,
  Symbol,
  Number,
}
