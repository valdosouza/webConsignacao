import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';

class ClosureEntity {
  String dtRecord;
  int tbInstitutionId;
  int tbUserId;
  List<ClosureItemsModel>? items;

  ClosureEntity({
    required this.dtRecord,
    required this.tbInstitutionId,
    required this.tbUserId,
    required this.items,
  });
}

class ClosureItemsEntity {
  String description;
  double tagValue;
  String kind;

  ClosureItemsEntity({
    required this.description,
    required this.tagValue,
    required this.kind,
  });
}
