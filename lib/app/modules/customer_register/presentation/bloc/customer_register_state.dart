import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';
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

class CustomerRegisterInfoPageState extends CustomerRegisterState {
  final CustomerMainModel model;
  final int tabIndex;
  CustomerRegisterInfoPageState({
    required List<CustomerListModel> customers,
    required this.model,
    required this.tabIndex,
  }) : super(customers: customers);
}

/*------------------------CEP - Customer----------------------------------*/
class CustomerRegisterCepErrorState extends CustomerRegisterState {
  final String error;

  CustomerRegisterCepErrorState(List<CustomerListModel> customers, this.error)
      : super(customers: customers);
}

/*------------------------CNPJ - Customer----------------------------------*/
class CustomerRegisterCnpjErrorState extends CustomerRegisterState {
  final String error;

  CustomerRegisterCnpjErrorState(List<CustomerListModel> customers, this.error)
      : super(customers: customers);
}

/*------------------------POST - Customer----------------------------------*/
class CustomerRegisterPostByDesktopSuccessState extends CustomerRegisterState {
  CustomerRegisterPostByDesktopSuccessState(List<CustomerListModel> customers)
      : super(customers: customers);
}

class CustomerRegisterPostByMobileSuccessState extends CustomerRegisterState {
  final CustomerListModel customer;
  CustomerRegisterPostByMobileSuccessState({
    required this.customer,
    required List<CustomerListModel> customers,
  }) : super(customers: customers);
}

class CustomerRegisterPutByMobileSuccessState extends CustomerRegisterState {
  final CustomerListModel customer;
  CustomerRegisterPutByMobileSuccessState({
    required this.customer,
    required List<CustomerListModel> customers,
  }) : super(customers: customers);
}

class CustomerRegisterPostErrorState extends CustomerRegisterState {
  final String error;
  final int tabIndex;

  CustomerRegisterPostErrorState(
      List<CustomerListModel> customers, this.error, this.tabIndex)
      : super(customers: customers);
}

/*------------------------Getlist - Customer----------------------------------*/
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

/*------------------------Getlist - State-------------------------------------*/
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

/*------------------------Getlist - City-------------------------------------*/
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

/*------------------------Getlist - Region----------------------------------*/
class CustomerRegisterGetRegionSuccessState extends CustomerRegisterState {
  final List<RegionRegisterModel> regions;

  CustomerRegisterGetRegionSuccessState(
      List<CustomerListModel> customers, this.regions)
      : super(customers: customers);
}

class CustomerRegisterGetRegionErrorState extends CustomerRegisterState {
  CustomerRegisterGetRegionErrorState(List<CustomerListModel> customers)
      : super(customers: customers);
}

/*------------------------Getlist - Sales Route-------------------------------*/
class CustomerRegisterGetSalesRouteSuccessState extends CustomerRegisterState {
  final List<SalesRouteListModel> salesroute;

  CustomerRegisterGetSalesRouteSuccessState(
      List<CustomerListModel> customers, this.salesroute)
      : super(customers: customers);
}

class CustomerRegisterGetSalesRouteErrorState extends CustomerRegisterState {
  CustomerRegisterGetSalesRouteErrorState(List<CustomerListModel> customers)
      : super(customers: customers);
}
