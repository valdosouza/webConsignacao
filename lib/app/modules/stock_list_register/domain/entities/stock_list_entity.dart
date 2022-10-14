import 'package:equatable/equatable.dart';

class StockListEntity extends Equatable {
  final int id;
  final int institution;
  final String description;
  final String main;
  final String active;

  const StockListEntity(
      {required this.id,
      required this.institution,
      required this.description,
      required this.main,
      required this.active});

  @override
  List<Object?> get props => [id, institution, description, main, active];
}
