import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/apply_default_sequence.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/get_customer.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/get_region.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/get_route.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/set_default_sequence.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/event.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/state.dart';
import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';
import 'package:bloc/bloc.dart';

class AttendanceOrderingBloc
    extends Bloc<AttendanceOrderingEvent, AttendanceOrderingState> {
  final GetRegion getRegion;
  final GetRoute getRoute;
  final GetCustomer getCustomer;
  final SetDefaultSequence setDefaultSequence;
  final ApplytDefaultSequence applytDefaultSequence;

  String nameRegion = "TATUQUARA";
  int tbRegionId = 2;
  String nameSalesRoute = "Segunda-Feira";
  int tbSalesRouteId = 1;
  int tbCustomerIdPickedForOrder = 0;
  List<RegionModel> regionList = List.empty();
  List<SalesRouteRegisterModel> routeList = List.empty();
  List<CustomerListByRouteModel> customerList = List.empty();

  AttendanceOrderingBloc({
    required this.getRegion,
    required this.getRoute,
    required this.getCustomer,
    required this.setDefaultSequence,
    required this.applytDefaultSequence,
  }) : super(InitState()) {
    _getRegion();
    _getRoute();
    _getCustomer();
    _defaultSequence();
    _applytDefaultSequence();
    _orderMode();
    _goBackToMainForm();
  }

  _getRegion() {
    on<GetRegionListEvent>((event, emit) async {
      emit(LoadingState());

      var response = await getRegion.call(ParamsGetRegion());

      var result = response.fold((l) {
        return ErrorState(msg: l.toString());
      }, (r) {
        regionList = r;
        return RegionLoadedState(list: regionList);
      });

      emit(result);
    });
  }

  _getRoute() {
    on<GetRouteListEvent>((event, emit) async {
      emit(LoadingState());

      var response = await getRoute.call(ParamsGetRoute());

      var result = response.fold((l) {
        return ErrorState(msg: l.toString());
      }, (r) {
        routeList = r;
        return RouteLoadedState();
      });

      emit(result);
    });
  }

  _getCustomer() {
    on<GetCustomerListEvent>((event, emit) async {
      emit(LoadingState());

      var response = await getCustomer.call(event.params);

      var result = response.fold((l) {
        return ErrorState(msg: l.toString());
      }, (r) {
        customerList = r;
        return CustomerLoadedState();
      });

      emit(result);
    });
  }

  _defaultSequence() {
    on<SetDefaultSequenceEvent>((event, emit) async {
      emit(LoadingState());
      String? errorValidate = await _validadeApplyDefaultSequence();
      if (errorValidate!.isNotEmpty) {
        emit(ErrorState(msg: errorValidate));
      } else {
        tbCustomerIdPickedForOrder = -1;

        var response = await setDefaultSequence.call(event.params);
        response.fold((l) {
          emit(ErrorState(msg: l.toString()));
        }, (r) {
          add(GetCustomerListEvent(
              params: ParamsGetCustomer(
            tbSalesRouteId: event.params.tbSalesRouteId,
            tbRegionId: event.params.tbRegionId,
          )));
        });
      }
    });
  }

  Future<String?> _validadeApplyDefaultSequence() async {
    if (tbRegionId == 0) {
      return "Campo Região é Obrigatório";
    }
    if (tbSalesRouteId == 0) {
      return "Campo Rota é Obrigatório";
    }
    return "";
  }

  _applytDefaultSequence() {
    on<ApplyDefaultSequenceEvent>((event, emit) async {
      emit(LoadingState());

      String? errorValidate = await _validadeApplyDefaultSequence();
      if (errorValidate!.isNotEmpty) {
        emit(ErrorState(msg: errorValidate));
      } else {
        tbCustomerIdPickedForOrder = -1;

        var response = await applytDefaultSequence.call(event.params);
        response.fold((l) {
          emit(ErrorState(msg: l.toString()));
        }, (r) {
          add(GetCustomerListEvent(
              params: ParamsGetCustomer(
            tbSalesRouteId: tbSalesRouteId,
            tbRegionId: tbRegionId,
          )));
        });
      }
    });
  }

  _orderMode() {
    on<OrderModeEvent>((event, emit) async {
      tbCustomerIdPickedForOrder = event.tbCustomerId;
      emit(CustomerLoadedState());
    });
  }

  _goBackToMainForm() {
    on<MainFormEvent>((event, emit) async {
      emit(LoadingState());

      emit(MainFormLoadedState());
    });
  }
}
