import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SalesEntity extends Equatable {
  int id;
  int institution;
  String description;
  String active;

  SalesEntity(
    this.id,
    this.institution,
    this.description,
    this.active,
  );
  @override
  List<Object?> get props => [id, institution, description, active];
}
