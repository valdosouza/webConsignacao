import 'package:appweb/app/modules/customer_register/data/model/consumer_main_model.dart';

abstract class CustomerRegisterState {
  List<CustomerMainModel> customers;

  CustomerRegisterState({
    required this.customers,
  });
}

class CustomerRegisterLoadingState extends CustomerRegisterState {
  CustomerRegisterLoadingState() : super(customers: []);
}

class CustomerRegisterLoadedState extends CustomerRegisterState {
  CustomerRegisterLoadedState({
    required List<CustomerMainModel> customers,
  }) : super(customers: customers);
}

class CustomerRegisterErrorState extends CustomerRegisterState {
  CustomerRegisterErrorState({
    required List<CustomerMainModel> customers,
  }) : super(customers: customers);
}
