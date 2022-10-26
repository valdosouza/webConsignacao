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
  UserRegisterEntity({
    this.id,
    this.password,
    this.kind = "sistema",
    this.tbDeviceId,
    this.active,
    this.institution,
    this.email,
    this.nick,
  });

  @override
  List<Object?> get props =>
      [id, tbInstitutionId, password, kind, tbDeviceId, active, email, nick];
}
