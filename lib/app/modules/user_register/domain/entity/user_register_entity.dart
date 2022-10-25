class UserRegisterEntity {
  int? id;
  String? password;
  String? kind;
  int? institution;
  int? tbDeviceId;
  String? active;
  String? email;
  String? nick;

  UserRegisterEntity({
    this.id,
    this.password,
    this.kind,
    this.tbDeviceId,
    this.active,
    this.institution,
    this.email,
    this.nick,
  });
}
