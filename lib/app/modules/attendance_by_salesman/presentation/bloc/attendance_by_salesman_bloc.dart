import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/attendance_by_salesman/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_salesman/presentation/bloc/attendance_by_salesman_event.dart';
import 'package:appweb/app/modules/attendance_by_salesman/presentation/bloc/attendance_by_salesman_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceBySalesmanBloc
    extends Bloc<AttendanceBySalesmanEvent, AttendanceBySalesmanState> {
  final CustomerGetlist getlistCustomer;

  List<CustomerListModel> customerlist = [];

  AttendanceBySalesmanBloc({
    required this.getlistCustomer,
  }) : super(CustomerListLoadingState()) {
    getListCustomer();
  }

  getListCustomer() {
    on<CustomerGetListEvent>((event, emit) async {
      emit(CustomerListLoadingState());

      var response = await getlistCustomer.call(ParamsGetListCustomer());

      var result = response
          .fold((l) => CustomerListErrorState(customerList: customerlist), (r) {
        customerlist = r;
        return CustomerListLoadedState(customerList: r);
      });

      emit(result);
    });
  }
}
