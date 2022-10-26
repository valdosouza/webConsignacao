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
    required this.id,
    required this.tbInstitutionId,
    required this.password,
    required this.kind,
    required this.tbDeviceId,
    required this.active,
    required this.email,
    required this.nick,
  });

  @override
  List<Object?> get props =>
      [id, tbInstitutionId, password, kind, tbDeviceId, active, email, nick];
}
