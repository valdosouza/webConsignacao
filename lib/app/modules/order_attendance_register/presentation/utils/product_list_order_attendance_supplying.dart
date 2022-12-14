import 'package:appweb/app/modules/order_attendance_register/data/datasource/order_consignment_supplying_datasource.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_consignment_supplying_items_model.dart';
import 'package:appweb/app/modules/order_attendance_register/data/repository/order_consignment_supplying_repository.dart';
import 'package:appweb/app/modules/order_attendance_register/presentation/pages/product_list_model.dart';

class ProductListOrderAttendanceSupplying {
  static Future<List<OrderConsignmentSupplyingItemsModel>> products(
      {required int id}) async {
    List<OrderConsignmentSupplyingItemsModel> list = [];
    List<ProductListModel> listProduct = [];

    OrderConsignmentSupplyingRepositoryImpl
        orderConsignmentSupplyingRepository =
        OrderConsignmentSupplyingRepositoryImpl(
            dataSource: OrderConsignmentSupplyingDataSourceImpl());

    var supplying =
        await orderConsignmentSupplyingRepository.getConsignment(id);

    list.clear();
    listProduct.clear();
    supplying.map((orderSupplying) {
      for (var element in orderSupplying.items) {
        list.add(
          OrderConsignmentSupplyingItemsModel(
            tbProductId: element.tbProductId,
            nameProduct: element.nameProduct,
            bonus: element.bonus,
            leftover: element.leftover,
            devoluttion: element.devoluttion,
            newConsignment: element.newConsignment,
            qtyConsigned: element.qtyConsigned,
          ),
        );
      }
    });
    return list;
  }
}
