class Validators {
  static String? validateRequired(String? text) {
    if (text != null && text.isNotEmpty) {
      return null;
    }
    return "Campo obrigatório.";
  }

  static String? validateExactLength(String? text, int length) {
    if (text != null && text.length == length) {
      return null;
    }
    return "Este campo precisa de $length carácteres";
  }

  static String? validateCNPJ(String? text) {
    var validate = validateRequired(text);
    if (validate != null) {
      return validate;
    }

    const expectedLength = 14;
    var numbers = text?.replaceAll(RegExp(r'[\.\-\/]'), '');

    validate = validateExactLength(numbers, expectedLength);
    if (validate != null) {
      return validate;
    }

    var digits = RegExp(r'\d')
        .allMatches(numbers!)
        .map((it) => int.parse(numbers.substring(it.start, it.end)))
        .toList();

    if (digits.length == expectedLength && digits.toSet().length > 1) {
      var calcDv1 = 0;
      var j = 0;
      for (var i in Iterable<int>.generate(12, (i) => i < 4 ? 5 - i : 13 - i)) {
        calcDv1 += digits[j++] * i;
      }
      calcDv1 %= 11;
      var dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

      if (digits[12] == dv1) {
        var calcDv2 = 0;
        j = 0;
        for (var i
            in Iterable<int>.generate(13, (i) => i < 5 ? 6 - i : 14 - i)) {
          calcDv2 += digits[j++] * i;
        }
        calcDv2 %= 11;
        var dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

        if (digits[13] == dv2) {
          return null;
        }
      }
    }
    return "CNPJ inválido.";
  }

  static String? validateCPF(String text) {
    var validate = validateRequired(text);
    if (validate != null) {
      return validate;
    }

    const expectedLength = 11;
    var numbers = text.replaceAll(RegExp(r'[\.\-\/]'), '');

    validate = validateExactLength(numbers, expectedLength);
    if (validate != null) {
      return validate;
    }

    var digits = RegExp(r'\d')
        .allMatches(numbers)
        .map((it) => int.parse(numbers.substring(it.start, it.end)))
        .toList();
    bool justOneDigit = digits.every((element) => element == digits.first);
    if(justOneDigit) return "CPF inválido";

    int sumResultFirstDigit = 0;
    int sumResultLastDigit = 0;
    for (int i = 10, j = 0; i >= 2; i--, j++) {
      sumResultFirstDigit += digits[j] * i;
    }

    for (int i = 11, j = 0; i >= 2; i--, j++) {
      sumResultLastDigit += digits[j] * i;
    }

    if (!(((sumResultFirstDigit * 10) % 11) % 10 == digits[9] &&
        ((sumResultLastDigit * 10) % 11) % 10 == digits[10])) {
      return "CPF Inválido";
    }
    return null;
  }
}
