import 'package:appweb/app/modules/order_attendance_register/data/datasource/order_consignment_check_point_datasource.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_consignment_check_point_items_model.dart';
import 'package:appweb/app/modules/order_attendance_register/data/repository/order_consignment_check_point_repository.dart';

class ProductListOrderAttendanceCheckPoint {
  static Future<List<OrderConsignmentCheckPointItemsModel>> products(
      {required int id}) async {
    List<OrderConsignmentCheckPointItemsModel> list = [];

    OrderConsignmentCheckPointRepositoryImpl
        orderConsignmentCheckPointRepository =
        OrderConsignmentCheckPointRepositoryImpl(
            dataSource: OrderConsignmentCheckPointDataSourceImpl());

    var checkPoint =
        await orderConsignmentCheckPointRepository.getConsignment(id);

    list.clear();
    checkPoint.map((orderSupplying) {
      for (var element in orderSupplying.items) {
        list.add(
          OrderConsignmentCheckPointItemsModel(
            tbProductId: element.tbProductId,
            nameProduct: element.nameProduct,
            bonus: element.bonus,
            qtyConsigned: element.qtyConsigned,
            leftover: element.leftover,
            qtySold: element.qtySold,
            unitValue: element.unitValue,
          ),
        );
      }
    });
    return list;
  }
}
