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

      var result = response.fold(
          (l) => SalesRouteListErrorState(salesRouteList: saleroutlist), (r) {
        saleroutlist = r;
        return SalesRouteListLoadedState(salesRouteList: r);
      });

      emit(result);
    });
  }

  getListCustomer() {
    on<CustomerGetListEvent>((event, emit) async {
      emit(CustomerListLoadingState());

      var response = await getlistCustomer
          .call(ParamsGetListCustomer(tbSalesRouteId: event.tbSalesRouteId!));

      var result = response
          .fold((l) => CustomerListErrorState(customerList: customerlist), (r) {
        customerlist = r;
        return CustomerListLoadedState(customerList: r);
      });

      emit(result);
    });
  }

  searchRouteSales() {
    on<SalesRouteSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var listearched = saleroutlist.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        emit(SalesRouteListLoadedState(salesRouteList: listearched));
      } else {
        emit(SalesRouteListLoadedState(salesRouteList: saleroutlist));
      }
    });
  }

  orderMode() {
    on<CustomerOrderModeEvent>((event, emit) async {
      tbCustomerIdPickedForOrder = event.tbCustomerId;
      emit(CustomerListOrderState(
        customerList: customerlist,
      ));
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
        emit(CustomerListOrderErrorState(customerList: customerlist));
      }, (r) {
        add(CustomerGetListEvent(tbSalesRouteId: event.tbSalesRouteId));
      });
    });
  }

  cancelOrderMode() {
    on<CustomerCancelOrderModeEvent>((event, emit) async {
      tbCustomerIdPickedForOrder = -1;
      emit(CustomerListLoadedState(customerList: customerlist));
    });
  }
}
