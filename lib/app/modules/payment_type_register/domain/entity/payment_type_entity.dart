import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PaymentTypeEntity extends Equatable {
  int id;
  int tbInstitutionId;
  String description;
  String active;

  PaymentTypeEntity(
      {required this.id,
      required this.tbInstitutionId,
      required this.description,
      required this.active});

  @override
  List<Object?> get props => [id, tbInstitutionId, description, active];
}
