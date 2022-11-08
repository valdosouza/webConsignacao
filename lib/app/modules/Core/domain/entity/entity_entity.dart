class EntityEntity {
  int id;
  String nameCompany;
  String nickTrade;
  int tbLineBusinessId;
  String nameLineBussiness;
  String aniversary;
  String note;

  EntityEntity({
    this.id = 0,
    this.nameCompany = "",
    this.nickTrade = "",
    this.tbLineBusinessId = 0,
    this.nameLineBussiness = "",
    this.aniversary = "",
    this.note = "",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_company'] = nameCompany;
    data['nick_trade'] = nickTrade;
    data['tb_linebuiness_id'] = tbLineBusinessId;
    data['name_linebusiness'] = nameLineBussiness;
    data['aniversary'] = aniversary;
    data['note'] = note;
    return data;
  }
}
