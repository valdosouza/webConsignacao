import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PaymentTypeEntity extends Equatable {
  int id;
  int institution;
  String description;
  String active;

  PaymentTypeEntity(
      {required this.id,
      required this.institution,
      required this.description,
      required this.active});

  @override
  List<Object?> get props => [id, institution, description, active];
}
