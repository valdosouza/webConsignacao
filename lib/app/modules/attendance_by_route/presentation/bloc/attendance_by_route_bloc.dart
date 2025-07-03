import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_sequence.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_set_turn_back.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/sales_route_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_state.dart';
import 'package:intl/intl.dart';

class AttendanceByRouteBloc
    extends Bloc<AttendanceByRouteEvent, AttendanceByRouteState> {
  final SalesRouteGetlist getlistSalesRoute;
  final CustomerGetlist getlistCustomer;
  final CustomerSequence sequence;
  final CustomerSetTurnBack customerSetTurnBack;
  //int idSequenceCustomer = -1;
  int tbCustomerIdPickedForOrder = -1;
  int tbSalesRouteIdSelected = 0;
  String salesRouteSelected = "";
  int tbRegionIdSelected = 0;
  String regionSelected = "";

  String dtRecordSelected = CustomDate.formatDateOut(CustomDate.newDate());
  String kindSelected = "Atender";
  List<SalesRouteListModel> saleroutlist = [];
  List<CustomerListByRouteModel> customerlist = [];

  AttendanceByRouteBloc({
    required this.getlistSalesRoute,
    required this.getlistCustomer,
    required this.sequence,
    required this.customerSetTurnBack,
  }) : super(SalesRouteListLoadingState()) {
    getListRouteSales();
    getListCustomer();
    orderMode();
    ordererMode();
    cancelOrderMode();
    setTurnBack();
    //searchRouteSales();
  }

  void getListRouteSales() {
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

  void getListCustomer() {
    on<CustomerGetListEvent>((event, emit) async {
      emit(CustomerListLoadingState());
      var dtConsulta = DateTime.parse(event.params.dtRecord);
      var dtResultado = DateTime.now();
      String diaDaSemana = DateFormat('EEEE').format(dtConsulta);
      switch (diaDaSemana) {
        case 'segunda-feira':
          switch (event.params.tbSalesRouteId) {
            case 2:
              dtResultado = dtConsulta.add(const Duration(days: 1));
              break;
            case 3:
              dtResultado = dtConsulta.add(const Duration(days: 2));
              break;
            case 4:
              dtResultado = dtConsulta.add(const Duration(days: 3));
              break;
            case 5:
              dtResultado = dtConsulta.add(const Duration(days: 4));
              break;
          }
          break;
        case 'terça-feira':
          switch (event.params.tbSalesRouteId) {
            case 1:
              dtResultado = dtConsulta.subtract(const Duration(days: 1));
              break;
            case 3:
              dtResultado = dtConsulta.add(const Duration(days: 1));
              break;
            case 4:
              dtResultado = dtConsulta.add(const Duration(days: 2));
              break;
            case 5:
              dtResultado = dtConsulta.add(const Duration(days: 3));
              break;
          }
          break;
        case 'quarta-feira':
          switch (event.params.tbSalesRouteId) {
            case 1:
              dtResultado = dtConsulta.subtract(const Duration(days: 2));
              break;
            case 2:
              dtResultado = dtConsulta.subtract(const Duration(days: 1));
              break;
            case 4:
              dtResultado = dtConsulta.add(const Duration(days: 1));
              break;
            case 5:
              dtResultado = dtConsulta.add(const Duration(days: 2));
              break;
          }
          break;
        case 'quinta-feira':
          switch (event.params.tbSalesRouteId) {
            case 1:
              dtResultado = dtConsulta.subtract(const Duration(days: 3));
              break;
            case 2:
              dtResultado = dtConsulta.subtract(const Duration(days: 2));
              break;
            case 3:
              dtResultado = dtConsulta.subtract(const Duration(days: 1));
              break;
            case 5:
              dtResultado = dtConsulta.add(const Duration(days: 1));
              break;
          }
          break;
        case 'sexta-feira':
          switch (event.params.tbSalesRouteId) {
            case 1:
              dtResultado = dtConsulta.subtract(const Duration(days: 4));
              break;
            case 2:
              dtResultado = dtConsulta.subtract(const Duration(days: 3));
              break;
            case 3:
              dtResultado = dtConsulta.subtract(const Duration(days: 2));
              break;
            case 4:
              dtResultado = dtConsulta.subtract(const Duration(days: 1));
              break;
          }
          break;
      }

      String dataString = DateFormat('yyyy-MM-dd').format(dtResultado);
      event.params.dtRecord = CustomDate.formatDateOut(dataString);
      var response = await getlistCustomer.call(event.params);

      var result = response
          .fold((l) => CustomerListErrorState(error: l.toString()), (r) {
        customerlist = r;
        return CustomerListLoadedState();
      });

      emit(result);
    });
  }

  void searchRouteSales() {
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

  void orderMode() {
    on<CustomerOrderModeEvent>((event, emit) async {
      tbCustomerIdPickedForOrder = event.tbCustomerId;
      emit(CustomerListOrderState());
    });
  }

  void ordererMode() {
    on<CustomerOrderedModeEvent>((event, emit) async {
      emit(CustomerListLoadingState());
      tbCustomerIdPickedForOrder = -1;

      var response = await sequence.call(event.params);
      response.fold((l) {
        emit(CustomerListOrderErrorState());
      }, (r) {
        add(CustomerGetListEvent(
            params: ParamsGetListCustomerByRoute(
          tbSalesRouteId: tbSalesRouteIdSelected,
          tbRegionId: tbRegionIdSelected,
          dtRecord: dtRecordSelected,
          kind: kindSelected,
        )));
      });
    });
  }

  void cancelOrderMode() {
    on<CustomerCancelOrderModeEvent>((event, emit) async {
      tbCustomerIdPickedForOrder = -1;
      emit(CustomerListLoadedState());
    });
  }

  void setTurnBack() {
    on<CustomerSetTurnBackEvent>((event, emit) async {
      emit(SalesRouteListLoadingState());
      await customerSetTurnBack.call(event.params);
      var elemento = customerlist
          .firstWhere((customer) => customer.id == event.params.tbCustomerId);
      customerlist.remove(elemento);
      emit(CustomerListLoadedState());
    });
  }
}
