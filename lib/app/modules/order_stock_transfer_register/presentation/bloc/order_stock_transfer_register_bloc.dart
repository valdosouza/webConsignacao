import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_get.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_get_list.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/enum/order_stock_transfer_search_enum.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_stock_transfer_register_event.dart';
part 'order_stock_transfer_register_state.dart';

class OrderStockTransferRegisterBloc extends Bloc<
    OrderStockTransferRegisterEvent, OrderStockTransferRegisterState> {
  final OrderStockTransferRegisterGetList getlistOrderStock;
  final OrderStockTransferRegisterGet getOrderStock;
  OrderStockTransferRegisterSearch typeSearch =
      OrderStockTransferRegisterSearch.date;

  List<OrderStockTransferRegisterOrderModel> ordersStock = [];

  OrderStockTransferRegisterBloc({
    required this.getlistOrderStock,
    required this.getOrderStock,
  }) : super(OrderStockTransferRegisterLoadingState()) {
    getList();
    get();
    // goToOrderStockTransferRegisterPage();
    search();
  }

  void search() {
    on<OrderStockTransferSearchEvent>((event, emit) async {
      late List<OrderStockTransferRegisterOrderModel> orderSearched;

      switch (typeSearch) {
        case OrderStockTransferRegisterSearch.date:
          orderSearched = ordersStock.where((element) {
            String dtRecord = OrderStockTransferRegisterOrderModel.formatDate(
                element.order.dtRecord.toString(), 'dd/MM/yyyy');
            return dtRecord
                .toLowerCase()
                .trim()
                .contains(event.search.toLowerCase().trim());
          }).toList();
          break;
        case OrderStockTransferRegisterSearch.entity:
          orderSearched = ordersStock.where((element) {
            String nameEntity = element.order.nameEntity;
            return nameEntity
                .toLowerCase()
                .trim()
                .contains(event.search.toLowerCase().trim());
          }).toList();
          break;
        case OrderStockTransferRegisterSearch.stock:
          orderSearched = ordersStock.where((element) {
            String nameStockListOri = element.order.nameStockListOri;
            return nameStockListOri
                .toLowerCase()
                .trim()
                .contains(event.search.toLowerCase().trim());
          }).toList();
          break;
        default:
      }
      emit(OrderStockTransferRegisterLoadedState(list: orderSearched));
      print('${event.search} ${orderSearched.length}');
    });
  }

  void getList() {
    on<OrderStockTransferRegisterGetListEvent>(
      (event, emit) async {
        emit(OrderStockTransferRegisterLoadingState());

        var response = await getlistOrderStock
            .call(ParamsGetlistOrderStockTransferRegister(id: 1));

        response.fold((l) => emit(OrderStockTransferRegisterErrorState()), (r) {
          ordersStock = r;
          emit(OrderStockTransferRegisterLoadedState(list: r));
        });
      },
    );
  }

  void get() {
    on<OrderStockTransferRegisterGetEvent>(
      (event, emit) async {
        emit(OrderStockTransferRegisterLoadingState());

        var response = await getOrderStock.call(
          ParamsGetOrderStockTransferRegister(
            id: event.newIndex,
            intitutionId: 1,
          ),
        );

        response.fold((l) => emit(OrderStockTransferRegisterErrorState()), (r) {
          emit(
            OrderStockTransferAddOrEditOrderState(order: r),
          );
        });
      },
    );
  }

  // void goToOrderStockTransferRegisterPage() {
  //   on<OrderStockTransferRegisterSelectFromIndex>(
  //     (event, emit) {
  //       emit(OrderStockTransferRegisterLoadingState());
  //       emit(
  //         OrderStockTransferAddOrEditOrderState(

  //         ),
  //       );
  //     },
  //   );
  // }
}
