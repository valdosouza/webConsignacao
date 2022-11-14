import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class OrderProductionEntity extends Equatable {
  int id;
  int tbInstitutionId;
  int tbUserId;
  String dtRecord;
  int number;
  String status;
  int tbMerchandiseId;
  String nameMerchandise;
  String qttyForecast;
  int tbStockListIdDes;
  String nameStockListDes;
  String note;

  OrderProductionEntity({
    required this.id,
    required this.tbInstitutionId,
    required this.tbUserId,
    required this.dtRecord,
    required this.number,
    required this.status,
    required this.tbMerchandiseId,
    required this.nameMerchandise,
    required this.qttyForecast,
    required this.tbStockListIdDes,
    required this.nameStockListDes,
    required this.note,
  });

  @override
  List<Object?> get props => [id];
}
