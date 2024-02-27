import 'package:intl/intl.dart';

String floatToStrF(double value) {
  final formatter = NumberFormat('#,##0.00', 'pt_BR');
  return formatter.format(value);
}
