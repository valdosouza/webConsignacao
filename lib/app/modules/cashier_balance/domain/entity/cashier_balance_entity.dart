import 'package:dartz/dartz.dart';

class CashierBalanceEntity {
  String date;
  List<Tuple2<String, double>> items;

  CashierBalanceEntity({required this.date, required this.items});
}
