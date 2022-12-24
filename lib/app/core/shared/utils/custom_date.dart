import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class CustomDate {
  static formatDate(String date, String typeFormat) {
    try {
      initializeDateFormatting('pt_BR,', null);
      DateTime time = DateTime.parse(date);
      return (DateFormat(typeFormat).format(time));
    } catch (e) {
      return "";
    }
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

  static convertDate(String date) {
    return date.split("/").reversed.join("-");
  }
}
