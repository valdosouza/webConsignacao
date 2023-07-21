import 'package:appweb/app/modules/price_list_register/data/model/price_list_model.dart';

abstract class OrderAttendanceRegisterState {
  List<PriceListModel> pricelist;

  OrderAttendanceRegisterState({
    required this.pricelist,
  });
}

class OrderAttendanceRegisterLoadingState extends OrderAttendanceRegisterState {
  OrderAttendanceRegisterLoadingState() : super(pricelist: []);
}

/*------------------------POST - OrderAttendance-----------------------------*/
class OrderAttendanceRegisterPostSuccessState
    extends OrderAttendanceRegisterState {
  OrderAttendanceRegisterPostSuccessState() : super(pricelist: []);
}

class OrderAttendanceRegisterPostErrorState
    extends OrderAttendanceRegisterState {
  final String error;

  OrderAttendanceRegisterPostErrorState({required this.error})
      : super(pricelist: []);
}

/*------------------------PUT - OrderAttendance-----------------------------*/
class OrderAttendanceRegisterPutSuccessState
    extends OrderAttendanceRegisterState {
  OrderAttendanceRegisterPutSuccessState() : super(pricelist: []);
}

class OrderAttendanceRegisterPutErrorState
    extends OrderAttendanceRegisterState {
  final String error;

  OrderAttendanceRegisterPutErrorState({required this.error})
      : super(pricelist: []);
}

/*------------------------Getlist - PriceList----------------------------------*/
class OrderAttendanceRegisterGetPriceListSuccessState
    extends OrderAttendanceRegisterState {
  OrderAttendanceRegisterGetPriceListSuccessState({required super.pricelist});
}

class OrderAttendanceRegisterGetPriceListErrorState
    extends OrderAttendanceRegisterState {
  final String error;

  OrderAttendanceRegisterGetPriceListErrorState({required this.error})
      : super(pricelist: []);
}
