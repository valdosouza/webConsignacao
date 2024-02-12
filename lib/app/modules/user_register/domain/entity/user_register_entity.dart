import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserRegisterEntity extends Equatable {
  int id;
  int tbInstitutionId;
  String password;
  String kind;
  int tbDeviceId;
  String active;
  String email;
  String nick;
  String kindDevice;
  UserRegisterEntity({
    required this.id,
    required this.password,
    this.kind = "sistema",
    required this.tbDeviceId,
    required this.active,
    required this.tbInstitutionId,
    required this.email,
    required this.nick,
    required this.kindDevice,
  });

  @override
  List<Object?> get props =>
      [id, tbInstitutionId, password, kind, tbDeviceId, active, email, nick];
}
