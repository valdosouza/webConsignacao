import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usecase/order_attendance_post.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usecase/order_attendance_put.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_event.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_state.dart';
import 'package:appweb/app/modules/price_list_register/data/model/price_list_model.dart';
import 'package:appweb/app/modules/price_list_register/domain/usecase/price_list_register_get_list.dart';
import 'package:bloc/bloc.dart';

class OrderAttendanceRegisterBloc
    extends Bloc<OrderAttendanceRegisterEvent, OrderAttendanceRegisterState> {
  final PriceListRegisterGetlist getPriceList;
  final OrderAttendancePost postOrderAttendance;
  final OrderAttendancePut putOrderAttendance;

  OrderAttendanceModel orderAttendance = OrderAttendanceModel.isEmpty();
  List<PriceListModel> pricelist = [];

  OrderAttendanceRegisterBloc({
    required this.getPriceList,
    required this.postOrderAttendance,
    required this.putOrderAttendance,
  }) : super(OrderAttendanceRegisterLoadingState()) {
    attendanceGetPriceList();
    attendancePost();
    attendancePut();
  }

  attendanceGetPriceList() {
    on<OrderAttendanceGetPriceListEvent>((event, emit) async {
      var response = await getPriceList.call(ParamsPriceListGet());

      var result = response.fold(
          (l) => OrderAttendanceRegisterGetPriceListErrorState(
              error: l.toString()), (r) {
        pricelist = r;
        return OrderAttendanceRegisterGetPriceListSuccessState(pricelist: r);
      });

      emit(result);
    });
  }

  attendancePost() {
    on<OrderAttendanceRegisterPostEvent>((event, emit) async {
      emit(OrderAttendanceRegisterLoadingState());
      final response = await postOrderAttendance.call(orderAttendance);

      final result = response.fold((l) {
        return OrderAttendanceRegisterPostErrorState(error: "");
      }, (r) {
        //este dois items não sao enviados para o post e retornam vazios
        String routeRetorn = orderAttendance.routeRetorn;
        int tbSalesRouteId = orderAttendance.tbSalesRouteId;
        orderAttendance = r;
        //Depois do post precisamos setar estes campos novamentes
        orderAttendance.routeRetorn = routeRetorn;
        orderAttendance.tbSalesRouteId = tbSalesRouteId;
        return OrderAttendanceRegisterPostSuccessState(
            orderAttendance: orderAttendance);
      });
      var dtCashier = await LocalStorageService.instance
          .get(key: LocalStorageKey.dtCashier);
      if ((dtCashier == null) || (dtCashier == "")) {
        dtCashier = CustomDate.newDate();
      }
      var dtAttendace = CustomDate.formatDateIn(orderAttendance.dtRecord);
      final dtResut = dtCashier.compareTo(dtAttendace);
      if (dtResut != 0) {
        LocalStorageService.instance
            .saveItem(key: LocalStorageKey.dtCashier, value: dtAttendace);
      }
      emit(result);
    });
  }

  attendancePut() {
    on<OrderAttendanceRegisterPutEvent>((event, emit) async {
      emit(OrderAttendanceRegisterLoadingState());
      final response = await putOrderAttendance.call(orderAttendance);

      response.fold((l) {
        emit(OrderAttendanceRegisterPutErrorState(error: l.toString()));
      }, (r) {
        //este dois items não sao enviados para o put e retornam vazios
        String routeRetorn = orderAttendance.routeRetorn;
        int tbSalesRouteId = orderAttendance.tbSalesRouteId;
        orderAttendance = r;
        //Depois do post precisamos setar estes campos novamentes
        orderAttendance.routeRetorn = routeRetorn;
        orderAttendance.tbSalesRouteId = tbSalesRouteId;
        emit(
          OrderAttendanceRegisterPutSuccessState(
              orderAttendance: orderAttendance),
        );
      });
    });
  }
}
