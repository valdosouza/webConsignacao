import 'package:equatable/equatable.dart';

class PaymentTypeEntity extends Equatable {
  final int id;
  final int idInstitution;
  final String description;
  final bool active;

  const PaymentTypeEntity(
      {required this.id,
      required this.idInstitution,
      required this.description,
      required this.active});

  @override
  List<Object?> get props => [id, idInstitution, description, active];
}
