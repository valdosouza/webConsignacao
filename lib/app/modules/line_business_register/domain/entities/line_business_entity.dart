import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class LinebusinessEntity extends Equatable {
  int id;
  int institution;
  String description;
  String active;

  LinebusinessEntity(
      {required this.id,
      required this.institution,
      required this.description,
      required this.active});

  @override
  List<Object?> get props => [id, institution, description, active];
}
