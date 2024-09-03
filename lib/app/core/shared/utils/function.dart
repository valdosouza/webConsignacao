import 'package:intl/intl.dart';

String floatToStrF(double value) {
  //final formatter = NumberFormat('#,##0.00', 'pt_BR');
  final formatter = NumberFormat('#,##0.00', 'en_US');
  return formatter.format(value);
}

String intToStr(int value) {
  return value.toString();
}

String autoDecimalPoint(value) {
  double valor = 0;
  String valorStr = "";
  valorStr = value.replaceAll('.', '');
  valorStr = valorStr.replaceAll(',', '');
  valor = double.parse(valorStr);
  if (valor > 0) {
    valor = valor / 100;
    return floatToStrF(valor);
  }
  return "";
}
