import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SalesEntity extends Equatable {
  int id;
  int institution;
  String description;
  String active;

  SalesEntity({
    required this.id,
    required this.institution,
    required this.description,
    required this.active,
  });
  @override
  List<Object?> get props => [id, institution, description, active];
}
