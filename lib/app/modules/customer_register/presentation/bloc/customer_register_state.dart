import 'package:appweb/app/modules/customer_register/data/model/consumer_main_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/city_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/state_model.dart';

abstract class CustomerRegisterState {
  List<CustomerMainModel> customers;

  CustomerRegisterState({
    required this.customers,
  });
}

class CustomerRegisterReturnedState extends CustomerRegisterState {
  CustomerRegisterReturnedState({required List<CustomerMainModel> customers})
      : super(customers: customers);
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

class CustomerRegisterInfoPageState extends CustomerRegisterState {
  final CustomerMainModel model;
  final int tabIndex;
  CustomerRegisterInfoPageState({
    required List<CustomerMainModel> customers,
    required this.model,
    required this.tabIndex,
  }) : super(customers: customers);
}

class CustomerRegisterCepErrorState extends CustomerRegisterState {
  final String error;

  CustomerRegisterCepErrorState(List<CustomerMainModel> customers, this.error)
      : super(customers: customers);
}

class CustomerRegisterCnpjErrorState extends CustomerRegisterState {
  final String error;

  CustomerRegisterCnpjErrorState(List<CustomerMainModel> customers, this.error)
      : super(customers: customers);
}

class CustomerRegisterGetStatesSuccessState extends CustomerRegisterState {
  final List<StateModel> states;

  CustomerRegisterGetStatesSuccessState(
      {required List<CustomerMainModel> customers, required this.states})
      : super(customers: customers);
}

class CustomerRegisterGetStatesErrorState extends CustomerRegisterState {
  final String error;

  CustomerRegisterGetStatesErrorState(
      List<CustomerMainModel> customers, this.error)
      : super(customers: customers);
}

class CustomerRegisterGetCitySuccessState extends CustomerRegisterState {
  final List<CityModel> citys;

  CustomerRegisterGetCitySuccessState(
      {required List<CustomerMainModel> customers, required this.citys})
      : super(customers: customers);
}

class CustomerRegisterGetCityErrorState extends CustomerRegisterState {
  final String error;

  CustomerRegisterGetCityErrorState(
      List<CustomerMainModel> customers, this.error)
      : super(customers: customers);
}
