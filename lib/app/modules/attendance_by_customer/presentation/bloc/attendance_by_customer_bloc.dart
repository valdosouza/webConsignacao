import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/attendance_by_customer/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/bloc/attendance_by_customer_event.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/bloc/attendance_by_customer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceByCustomerBloc
    extends Bloc<AttendanceByCustomerEvent, AttendanceByCustomerState> {
  final CustomerGetlist getlistCustomer;

  List<CustomerListModel> customerlist = [];
  List<CustomerListModel> customerlistReserv = [];

  AttendanceByCustomerBloc({
    required this.getlistCustomer,
  }) : super(CustomerListLoadingState()) {
    getListCustomer();
    searchCustomer();
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

  searchCustomer() {
    on<CustomerSearchEvent>((event, emit) async {
      customerlist;
      if (event.search.isNotEmpty) {
        customerlistReserv = customerlist
            .where((x) =>
                x.nickTrade.toLowerCase().contains(event.search.toLowerCase()))
            .toList();
        emit(CustomerListLoadedState(customerList: customerlistReserv));
      } else {
        emit(CustomerListLoadedState(customerList: customerlist));
      }
    });
  }
}
