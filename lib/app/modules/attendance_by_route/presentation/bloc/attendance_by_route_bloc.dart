import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_sequence.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/sales_route_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_state.dart';

class AttendanceByRouteBloc
    extends Bloc<AttendanceByRouteEvent, AttendanceByRouteState> {
  final SalesRouteGetlist getlistSalesRoute;
  final CustomerGetlist getlistCustomer;
  final CustomerSequence sequence;
  //int idSequenceCustomer = -1;
  int tbCustomerIdPickedForOrder = -1;
  int tbSalesRouteIdSelected = 0;
  String salesRouteSelected = "";
  List<SalesRouteListModel> saleroutlist = [];
  List<CustomerListByRouteModel> customerlist = [];

  AttendanceByRouteBloc(
      {required this.getlistSalesRoute,
      required this.getlistCustomer,
      required this.sequence})
      : super(SalesRouteListLoadingState()) {
    getListRouteSales();
    getListCustomer();
    orderMode();
    ordererMode();
    cancelOrderMode();
    //searchRouteSales();
  }

  getListRouteSales() {
    on<SalesRouteGetListEvent>((event, emit) async {
      emit(SalesRouteListLoadingState());

      var response = await getlistSalesRoute.call(ParamsSalesRouteGet());

      var result = response
          .fold((l) => SalesRouteListErrorState(error: l.toString()), (r) {
        saleroutlist = r;
        return SalesRouteListLoadedState();
      });

      emit(result);
    });
  }

  getListCustomer() {
    on<CustomerGetListEvent>((event, emit) async {
      emit(CustomerListLoadingState());

      var response = await getlistCustomer
          .call(ParamsGetListCustomer(tbSalesRouteId: tbSalesRouteIdSelected));

      var result = response
          .fold((l) => CustomerListErrorState(error: l.toString()), (r) {
        customerlist = r;
        return CustomerListLoadedState();
      });

      emit(result);
    });
  }

  searchRouteSales() {
    on<SalesRouteSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        saleroutlist.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        emit(SalesRouteListLoadedState());
      } else {
        emit(SalesRouteListLoadedState());
      }
    });
  }

  orderMode() {
    on<CustomerOrderModeEvent>((event, emit) async {
      tbCustomerIdPickedForOrder = event.tbCustomerId;
      emit(CustomerListOrderState());
    });
  }

  ordererMode() {
    on<CustomerOrderedModeEvent>((event, emit) async {
      tbCustomerIdPickedForOrder = -1;

      var response = await sequence.call(ParamsSequenceCustomer(
          tbCustomerId: event.tbCustomerId,
          tbSalesRouteId: event.tbSalesRouteId,
          sequence: event.sequence));
      response.fold((l) {
        emit(CustomerListOrderErrorState());
      }, (r) {
        add(CustomerGetListEvent());
      });
    });
  }

  cancelOrderMode() {
    on<CustomerCancelOrderModeEvent>((event, emit) async {
      tbCustomerIdPickedForOrder = -1;
      emit(CustomerListLoadedState());
    });
  }
}
