import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/salesman_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';

abstract class CustomerRegisterState {
  List<CustomerListModel> customers;

  CustomerRegisterState({
    required this.customers,
  });
}

class CustomerRegisterReturnedState extends CustomerRegisterState {
  CustomerRegisterReturnedState({required List<CustomerListModel> customers})
      : super(customers: customers);
}

class CustomerRegisterLoadingState extends CustomerRegisterState {
  CustomerRegisterLoadingState() : super(customers: []);
}

class CustomerRegisterLoadedState extends CustomerRegisterState {
  CustomerRegisterLoadedState({
    required List<CustomerListModel> customers,
  }) : super(customers: customers);
}

class CustomerRegisterErrorState extends CustomerRegisterState {
  CustomerRegisterErrorState({
    required List<CustomerListModel> customers,
  }) : super(customers: customers);
}

class CustomerRegisterGetErrorState extends CustomerRegisterState {
  CustomerRegisterGetErrorState({
    required List<CustomerListModel> customers,
  }) : super(customers: customers);
}

class CustomerRegisterInfoPageState extends CustomerRegisterState {
  final CustomerMainModel model;
  final int tabIndex;
  CustomerRegisterInfoPageState({
    required List<CustomerListModel> customers,
    required this.model,
    required this.tabIndex,
  }) : super(customers: customers);
}

class CustomerRegisterCepErrorState extends CustomerRegisterState {
  final String error;

  CustomerRegisterCepErrorState(List<CustomerListModel> customers, this.error)
      : super(customers: customers);
}

class CustomerRegisterCnpjErrorState extends CustomerRegisterState {
  final String error;

  CustomerRegisterCnpjErrorState(List<CustomerListModel> customers, this.error)
      : super(customers: customers);
}

class CustomerRegisterGetStatesSuccessState extends CustomerRegisterState {
  final List<StateModel> states;

  CustomerRegisterGetStatesSuccessState(
      {required List<CustomerListModel> customers, required this.states})
      : super(customers: customers);
}

class CustomerRegisterGetStatesErrorState extends CustomerRegisterState {
  final String error;

  CustomerRegisterGetStatesErrorState(
      List<CustomerListModel> customers, this.error)
      : super(customers: customers);
}

class CustomerRegisterGetCitySuccessState extends CustomerRegisterState {
  final List<CityModel> cities;

  CustomerRegisterGetCitySuccessState(
      {required List<CustomerListModel> customers, required this.cities})
      : super(customers: customers);
}

class CustomerRegisterGetCityErrorState extends CustomerRegisterState {
  final String error;

  CustomerRegisterGetCityErrorState(
      List<CustomerListModel> customers, this.error)
      : super(customers: customers);
}

class CustomerRegisterPostAddSuccessState extends CustomerRegisterState {
  CustomerRegisterPostAddSuccessState(List<CustomerListModel> customers)
      : super(customers: customers);
}

class CustomerRegisterPostEditSuccessState extends CustomerRegisterState {
  CustomerRegisterPostEditSuccessState(List<CustomerListModel> customers)
      : super(customers: customers);
}

class CustomerRegisterPostAddErrorState extends CustomerRegisterState {
  final String error;

  CustomerRegisterPostAddErrorState(
      List<CustomerListModel> customers, this.error)
      : super(customers: customers);
}

class CustomerRegisterPostEditErrorState extends CustomerRegisterState {
  final String error;

  CustomerRegisterPostEditErrorState(
      List<CustomerListModel> customers, this.error)
      : super(customers: customers);
}

class CustomerRegisterGetSalesmanSuccessState extends CustomerRegisterState {
  final List<SalesmanListModel> salesmans;

  CustomerRegisterGetSalesmanSuccessState(
      List<CustomerListModel> customers, this.salesmans)
      : super(customers: customers);
}

class CustomerRegisterGetSalesmanErrorState extends CustomerRegisterState {
  CustomerRegisterGetSalesmanErrorState(List<CustomerListModel> customers)
      : super(customers: customers);
}
