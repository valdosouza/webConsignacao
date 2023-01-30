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
          (l) => OrderAttendanceRegisterGetPriceListErrorState(error: ""), (r) {
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

      response.fold((l) {
        emit(OrderAttendanceRegisterPostErrorState(error: ""));
      }, (r) {
        orderAttendance = r;
        emit(
          OrderAttendanceRegisterPostSuccessState(
              orderAttendance: orderAttendance),
        );
      });
    });
  }

  attendancePut() {
    on<OrderAttendanceRegisterPutEvent>((event, emit) async {
      emit(OrderAttendanceRegisterLoadingState());
      final response = await putOrderAttendance.call(orderAttendance);

      response.fold((l) {
        emit(OrderAttendanceRegisterPutErrorState(error: ""));
      }, (r) {
        orderAttendance = r;
        emit(
          OrderAttendanceRegisterPutSuccessState(
              orderAttendance: orderAttendance),
        );
      });
    });
  }
}
