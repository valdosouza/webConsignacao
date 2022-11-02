class EntityEntity {
  int id;
  String nameCompany;
  String nickTrade;
  int tbLineBuinessId;
  String aniversary;
  String note;

  EntityEntity({
    this.id = 0,
    this.nameCompany = "",
    this.nickTrade = "",
    this.tbLineBuinessId = 0,
    this.aniversary = "",
    this.note = "",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_company'] = nameCompany;
    data['nick_trade'] = nickTrade;
    data['tb_line_buiness_id'] = 0;
    data['aniversary'] = aniversary;
    data['note'] = note;
    return data;
  }
}
