import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';

abstract class AttendanceByCustomerState {}

/*----------------------------------------------------------------------------*/
class CustomerListState extends AttendanceByCustomerState {
  List<CustomerListModel> customerList;
  CustomerListState({
    required this.customerList,
  });
}

class CustomerListLoadingState extends CustomerListState {
  CustomerListLoadingState() : super(customerList: []);
}

class CustomerListLoadedState extends CustomerListState {
  CustomerListLoadedState({required super.customerList});
}

class CustomerListErrorState extends CustomerListState {
  CustomerListErrorState({required super.customerList});
}
