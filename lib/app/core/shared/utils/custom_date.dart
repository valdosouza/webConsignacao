import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class CustomDate {
  static formatDateOut(String date) {
    if (date != "") {
      try {
        //12/01/2023
        var result =
            "${date.substring(6, 10)}-${date.substring(3, 5)}-${date.substring(0, 2)}";

        return result;
      } catch (e) {
        return "";
      }
    }
    return "";
  }

  static formatDateIn(String date) {
    if (date != "") {
      try {
        //2023-01-12
        var result =
            "${date.substring(8, 10)}/${date.substring(5, 7)}/${date.substring(0, 4)}";

        return result;
      } catch (e) {
        return "";
      }
    }
    return "";
  }

  static newDate() {
    try {
      initializeDateFormatting('pt_BR,', null);
      DateTime time = DateTime.now();
      return (DateFormat("dd/MM/yyyy").format(time));
    } catch (e) {
      return "";
    }
  }

  static yesterday() {
    try {
      initializeDateFormatting('pt_BR,', null);

      DateTime time = DateTime.now().subtract(const Duration(days: 1));
      return (DateFormat("dd/MM/yyyy").format(time));
    } catch (e) {
      return "";
    }
  }
}
