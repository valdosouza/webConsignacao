import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cep.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_citys.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cnpj.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_sales_route.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_states.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_get.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_post.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_register_get_list.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/get_region_by_salesman.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_state.dart';
import 'package:bloc/bloc.dart';

class CustomerRegisterBloc
    extends Bloc<CustomerRegisterEvent, CustomerRegisterState> {
  final CustomerRegisterGetlist getlist;
  final GetCep getCep;
  final GetCities getCity;
  final GetCnpj getCnpj;
  final GetStates getStates;
  final CustomerRegisterGet getCustomer;
  final CustomerRegisterPost postCustomer;
  final GetRegionBySalesman getRegionBySalesman;
  final GetSalesRoute getSalesRoute;

  List<CustomerListModel> customers = [];
  CustomerMainModel customer = CustomerMainModel.empty();
  List<StateModel> states = [];
  List<CityModel> cities = [];
  List<RegionRegisterModel> regions = [];
  List<SalesRouteListModel> salesRoute = [];
  int tabIndex = 0;
  CustomerRegisterBloc({
    required this.getlist,
    required this.getCep,
    required this.getCity,
    required this.getCnpj,
    required this.getStates,
    required this.getCustomer,
    required this.postCustomer,
    required this.getRegionBySalesman,
    required this.getSalesRoute,
  }) : super(CustomerRegisterLoadingState()) {
    getList();

    searchCustomer();

    goToCustomerDesktopPage();

    newCustomerMobilePage();

    getCustomerMobilePage();

    searchCEP();

    searchCNPJ();

    getState();

    getCitys();

    searchEventStates();

    searchEventCitys();

    postCustomerByMobile();

    postCustomerByDesktop();

    getRegionAction();

    searchRegion();

    getSalesRouteAction();

    searchSalesRoute();

    on<CustomerRegisterReturnEvent>((event, emit) => emit(
        CustomerRegisterInfoPageState(
            model: customer, customers: customers, tabIndex: event.index)));
  }

  getList() {
    on<CustomerRegisterGetListEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      var response = await getlist.call(ParamsGetListCustomer());

      var result = response
          .fold((l) => CustomerRegisterErrorState(customers: customers), (r) {
        customers = r;
        return CustomerRegisterLoadedState(customers: r);
      });

      emit(result);
    });
  }

  Future<String?> _validadePostCustomer() async {
    tabIndex = 0;
    String? error = "";
    if (customer.kindFiscal == "J") {
      if ((customer.company?.cnpj == "") || (customer.company?.cnpj == null)) {
        return "Campo CNPJ é Obrigatório";
      }
      error = Validators.validateCNPJ(customer.company?.cnpj);
      if (error != "") {
        return "Campo CNPJ é inválido";
      }
    } else {
      if ((customer.person?.cpf == "") || (customer.person?.cpf == null)) {
        return "Campo CPF é Obrigatório";
      }
      error = Validators.validateCPF(customer.person?.cpf);
      if (error != "") {
        return "Campo CPF é inválido";
      }
    }
    if (customer.entity.nameCompany.isEmpty) {
      return "Campo Nome/Razão é Obrigatório";
    }
    if (customer.entity.nickTrade.isEmpty) {
      return "Campo Apelido/Nome Fantasia";
    }
    tabIndex = 1;
    if (customer.address.zipCode.length < 8) {
      return "Campo Cep não é valido ";
    }
    if (customer.address.street.length < 3) {
      return "Campo logradouro não é valido ";
    }
    if (customer.address.nmbr.isEmpty) {
      return "Campo número não é valido ";
    }
    if (customer.address.neighborhood.isEmpty) {
      return "Campo bairro não é valido ";
    }
    if (customer.address.neighborhood.isEmpty) {
      return "Campo bairro não é valido ";
    }
    tabIndex = 3;
    if (customer.customer.tbSalesRouteId == 0) {
      return "Campo Rota não é valido ";
    }
    return "";
  }

  postCustomerByMobile() async {
    on<CustomerRegisterPostByMobileEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());
      String? errorValidate = await _validadePostCustomer();
      if (errorValidate!.isNotEmpty) {
        emit(
            CustomerRegisterPostErrorState(customers, errorValidate, tabIndex));
      } else {
        var response =
            await postCustomer.call(ParamsPostCustomer(customer: event.model));

        response.fold((l) {
          emit(CustomerRegisterPostErrorState(
              customers, l.toString(), tabIndex));
        }, (r) {
          if (r.error == "") {
            if (event.model.entity.id != 0) {
              int index = customers.indexWhere((element) => element.id == r.id);
              if (index != -1) {
                customers[index] = r;
              }
              emit(CustomerRegisterPutByMobileSuccessState(
                  customer: r, customers: customers));
            } else {
              customers.add(r);
              emit(CustomerRegisterPostByMobileSuccessState(
                  customer: r, customers: customers));
            }
          } else {
            emit(CustomerRegisterPostErrorState(customers, r.error, tabIndex));
          }
        });
      }
    });
  }

  postCustomerByDesktop() {
    on<CustomerRegisterPostByDesktopEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      var response =
          await postCustomer.call(ParamsPostCustomer(customer: event.model));

      response.fold(
          (l) => emit(CustomerRegisterPostErrorState(
              customers, l.toString(), tabIndex)), (r) {
        if (r.error == "") {
          if (event.model.entity.id != 0) {
            customers[customers.indexWhere((element) => element.id == r.id)] =
                r;
          } else {
            customers.add(r);
          }
          emit(CustomerRegisterPostByDesktopSuccessState(customers));
        } else {
          emit(CustomerRegisterPostErrorState(customers, r.error, tabIndex));
        }
      });
    });
  }

  searchCustomer() {
    on<CustomerRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var customersSearchedName = customers.where((element) {
          String name = element.nickTrade;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        var customersSearchedCnpj = customers.where((element) {
          String email = element.docNumber;
          return email
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        var customersSearchedCpf = customers.where((element) {
          String email = element.docNumber;
          return email
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (customersSearchedName.isNotEmpty) {
          emit(CustomerRegisterLoadedState(customers: customersSearchedName));
        } else if (customersSearchedCnpj.isNotEmpty) {
          emit(CustomerRegisterLoadedState(customers: customersSearchedCnpj));
        } else {
          emit(CustomerRegisterLoadedState(customers: customersSearchedCpf));
        }
      } else {
        emit(CustomerRegisterLoadedState(customers: customers));
      }
    });
  }

  goToCustomerDesktopPage() {
    on<CustomerRegisterDesktopEvent>((event, emit) async {
      if (event.id != null) {
        emit(CustomerRegisterLoadingState());

        final response =
            await getCustomer.call(ParamsGetCustomer(id: event.id!));

        response.fold(
            (l) => emit(CustomerRegisterGetErrorState(customers: customers)),
            (r) {
          customer = r;
          emit(CustomerRegisterInfoPageState(
              customers: customers, model: r, tabIndex: 0));
        });
      } else {
        emit(CustomerRegisterInfoPageState(
            customers: customers, model: customer, tabIndex: 0));
      }
    });
  }

  getCustomerMobilePage() {
    on<CustomerRegisterMobileEditEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      final response =
          await getCustomer.call(ParamsGetCustomer(id: event.tbCustomerId));

      response.fold(
          (l) => emit(CustomerRegisterGetErrorState(customers: customers)),
          (r) {
        customer = r;
        emit(CustomerRegisterInfoPageState(
            customers: customers, model: r, tabIndex: 0));
      });
    });
  }

  newCustomerMobilePage() {
    on<CustomerRegisterMobileNewEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());
      customer = CustomerMainModel.empty();
      emit(CustomerRegisterInfoPageState(
          customers: customers, model: customer, tabIndex: 0));
    });
  }

  searchCNPJ() {
    on<CustomerRegisterCnpjEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      final response = await getCnpj.call(ParamsCnpj(cnpj: event.cnpj));

      response.fold((l) {
        emit(CustomerRegisterCnpjErrorState(customers, ""));
        emit(CustomerRegisterInfoPageState(
            customers: customers, model: customer, tabIndex: 0));
      }, (r) {
        customer.address.zipCode =
            r.zipCode.replaceAll("-", "").replaceAll(".", "");
        if (r.nickTtrade.isNotEmpty) {
          customer.entity.nickTrade = r.nickTtrade;
        } else {
          customer.entity.nickTrade = r.nameCompany;
        }
        customer.company?.cnpj = r.cnpj;
        customer.entity.nameCompany = r.nameCompany;
        customer.address.nmbr = r.nmbr;
        customer.address.street = r.street;
        customer.address.complement = r.complement;
        customer.address.neighborhood = r.neighborhood;
        customer.address.cityName = r.cityName;
        customer.address.tbCityId = r.tbCityId;
        customer.address.stateName = r.stateName;
        customer.address.tbStateId = r.tbStateId;
        customer.address.kind = "Comercial";
        customer.address.tbCountryId = 1058;
        emit(CustomerRegisterInfoPageState(
            customers: customers, model: customer, tabIndex: 0));
      });
    });
  }

  searchCEP() {
    on<CustomerRegisterCepEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      final response = await getCep.call(ParamsCep(cep: event.cep));

      response.fold((l) {
        emit(CustomerRegisterCepErrorState(customers, ""));
        emit(CustomerRegisterInfoPageState(
            customers: customers, model: customer, tabIndex: 1));
      }, (r) {
        customer.address.zipCode = r.zipCode.replaceAll("-", "");
        customer.address.street = r.street;
        customer.address.complement = r.complement;
        customer.address.neighborhood = r.neighborhood;
        customer.address.stateName = r.stateName;
        customer.address.tbStateId = r.tbStateId;
        customer.address.cityName = r.cityName;
        customer.address.tbCityId = r.tbCityId;
        customer.address.kind = "Comercial";
        customer.address.tbCountryId = 1058;
        emit(CustomerRegisterInfoPageState(
            customers: customers, model: customer, tabIndex: 1));
      });
    });
  }

  getState() {
    on<CustomerRegisterGetStatesEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      final response = await getStates.call(ParamsGetStates());

      response.fold(
          (l) => emit(CustomerRegisterGetStatesErrorState(customers, "")), (r) {
        states = r;
        emit(CustomerRegisterGetStatesSuccessState(
            states: r, customers: customers));
      });
    });
  }

  getCitys() {
    on<CustomerRegisterGetCitysEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      final response =
          await getCity.call(ParamsGetCity(tbStateId: event.tbStateId));

      response.fold(
          (l) => emit(CustomerRegisterGetCityErrorState(customers, "")), (r) {
        cities = r;
        emit(CustomerRegisterGetCitySuccessState(
            cities: r, customers: customers));
      });
    });
  }

  searchEventStates() {
    on<CustomerRegisterSearchStateEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var statestSearched = states.where((element) {
          String name = element.name;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (statestSearched.isEmpty) {}
        emit(CustomerRegisterGetStatesSuccessState(
          states: statestSearched,
          customers: customers,
        ));
      } else {
        emit(CustomerRegisterGetStatesSuccessState(
            states: states, customers: customers));
      }
    });
  }

  searchEventCitys() {
    on<CustomerRegisterSearchCityEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var citiestSearched = cities.where((element) {
          String name = element.name;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (citiestSearched.isEmpty) {}
        emit(CustomerRegisterGetCitySuccessState(
            cities: citiestSearched, customers: customers));
      } else {
        emit(CustomerRegisterGetCitySuccessState(
            cities: cities, customers: customers));
      }
    });
  }

  getRegionAction() {
    on<CustomerRegisterGetRegionEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      var response = await getRegionBySalesman.call(ParamsRegionListGet());

      response.fold((l) => emit(CustomerRegisterGetRegionErrorState(customers)),
          (r) {
        regions = r;
        emit(CustomerRegisterGetRegionSuccessState(customers, r));
      });
    });
  }

  searchRegion() {
    on<CustomerRegisterSearchRegionEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var regionSearched = regions.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (regionSearched.isEmpty) {}
        emit(CustomerRegisterGetRegionSuccessState(customers, regionSearched));
      } else {
        emit(CustomerRegisterGetRegionSuccessState(customers, regions));
      }
    });
  }

  getSalesRouteAction() {
    on<CustomerRegisterGetSalesRouteEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      var response = await getSalesRoute.call(ParamsSalesRouteListGet());

      response.fold(
          (l) => emit(CustomerRegisterGetSalesRouteErrorState(customers)), (r) {
        salesRoute = r;
        emit(CustomerRegisterGetSalesRouteSuccessState(customers, r));
      });
    });
  }

  searchSalesRoute() {
    on<CustomerRegisterSearchSalesRouteEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var salesRouteSearched = salesRoute.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (salesRouteSearched.isEmpty) {}
        emit(CustomerRegisterGetSalesRouteSuccessState(
            customers, salesRouteSearched));
      } else {
        emit(CustomerRegisterGetSalesRouteSuccessState(customers, salesRoute));
      }
    });
  }
}
