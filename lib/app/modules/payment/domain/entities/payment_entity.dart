import 'package:equatable/equatable.dart';

class PaymentEntity extends Equatable {
  final int id;
  final int idInstitution;
  final String description;
  final bool active;

  const PaymentEntity(
      {required this.id,
      required this.idInstitution,
      required this.description,
      required this.active});

  @override
  // TODO: implement props
  List<Object?> get props => [id, idInstitution, description, active];
}
