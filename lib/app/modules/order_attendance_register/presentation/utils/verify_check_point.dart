import 'package:appweb/app/modules/order_attendance_register/data/datasource/order_consignment_check_point_datasource.dart';
import 'package:appweb/app/modules/order_attendance_register/data/repository/order_consignment_check_point_repository.dart';

class VerifyCheckPoint {
  static Future<bool> verifyCheckPoint({required int id}) async {
    OrderConsignmentCheckPointRepositoryImpl
        orderConsignmentCheckPointRepository =
        OrderConsignmentCheckPointRepositoryImpl(
            dataSource: OrderConsignmentCheckPointDataSourceImpl());

    var orderConsignmentCheckPointModel =
        await orderConsignmentCheckPointRepository.getConsignment(1);

    if (orderConsignmentCheckPointModel.length() > 0) {
      orderConsignmentCheckPointModel.map((orderConsignment) {
        for (var element in orderConsignment.items) {
          if (element.bonus > 0 || element.qtyConsigned > 0) {
            return true;
          }
        }
      });
    }

    return false;
  }
}
