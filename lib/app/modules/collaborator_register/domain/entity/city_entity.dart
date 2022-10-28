import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CityEntity extends Equatable {
  int id;
  int tbStateId;
  String name;
  String ibge;

  CityEntity({
    this.id = 0,
    this.tbStateId = 0,
    this.ibge = "",
    this.name = "",
  });

  @override
  List<Object?> get props => [id];
}
