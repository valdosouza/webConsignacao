import 'package:equatable/equatable.dart';

class SalesEntity extends Equatable {
  final int id;
  final int institution;
  final String description;
  final String active;

  const SalesEntity({
    required this.id,
    required this.institution,
    required this.description,
    required this.active,
  });
  @override
  List<Object?> get props => [id, institution, description, active];
}
