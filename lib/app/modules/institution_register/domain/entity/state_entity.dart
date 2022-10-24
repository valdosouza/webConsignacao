import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class StateEntity extends Equatable {
  int id;
  int tbCountryId;
  String abbreviation;
  String name;

  StateEntity({
    this.id = 0,
    this.tbCountryId = 0,
    this.abbreviation = "",
    this.name = "",
  });

  @override
  List<Object?> get props => [id];
}
