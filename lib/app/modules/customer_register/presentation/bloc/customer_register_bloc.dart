import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/salesman_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cep.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_citys.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cnpj.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_salesmans.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_states.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_get.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_post.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_register_get_list.dart';
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
  final GetSalesmans getSalesmans;

  List<CustomerListModel> customers = [];
  CustomerMainModel customer = CustomerMainModel.empty();
  List<StateModel> states = [];
  List<CityModel> cities = [];
  List<SalesmanListModel> salesmans = [];

  CustomerRegisterBloc({
    required this.getlist,
    required this.getCep,
    required this.getCity,
    required this.getCnpj,
    required this.getStates,
    required this.getCustomer,
    required this.postCustomer,
    required this.getSalesmans,
  }) : super(CustomerRegisterLoadingState()) {
    getList();

    searchCustomer();

    goToCustomerDesktopPage();

    goToCustomerMobilePage();

    searchCEP();

    searchCNPJ();

    getState();

    getCitys();

    searchEventStates();

    searchEventCitys();

    postCustomerAction();

    getSalesmansAction();

    searchSalesmans();

    on<CustomerRegisterReturnEvent>((event, emit) => emit(
        CustomerRegisterInfoPageState(
            model: customer, customers: customers, tabIndex: event.index)));
  }

  getList() {
    on<CustomerRegisterGetListEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      var response =
          await getlist.call(ParamsGetListCustomer(tbInstitutionId: 1));

      var result = response
          .fold((l) => CustomerRegisterErrorState(customers: customers), (r) {
        customers = r;
        return CustomerRegisterLoadedState(customers: r);
      });

      emit(result);
    });
  }

  postCustomerAction() {
    on<CustomerRegisterPostEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      var response =
          await postCustomer.call(ParamsPostCustomer(customer: event.model));

      response.fold(
          (l) => event.model.customer.id != 0
              ? emit(CustomerRegisterPostErrorState(customers, ""))
              : emit(CustomerRegisterPutErrorState(customers, "")), (r) {
        if (event.model.customer.id != 0) {
          emit(CustomerRegisterPostSuccessState(customers));
        } else {
          customers.add(CustomerListModel(
            id: r.customer.id,
            docKind: r.person != null ? "F" : "J",
            docNumber: r.person != null ? r.person!.cpf : r.company!.cnpj,
            nameCompany: r.entity.nameCompany,
            nickTrade: r.entity.nickTrade,
          ));
          emit(CustomerRegisterPostSuccessState(customers));
        }
      });
    });
  }

  searchCustomer() {
    on<CustomerRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var customersSearchedName = customers.where((element) {
          String name = element.nameCompany;
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

  goToCustomerMobilePage() {
    on<CustomerRegisterMobileEvent>((event, emit) async {
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

  searchCNPJ() {
    on<CustomerRegisterCnpjEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      final response = await getCnpj.call(ParamsCnpj(cnpj: event.cnpj));

      response.fold((l) => emit(CustomerRegisterCnpjErrorState(customers, "")),
          (r) {
        customer.address.zipCode =
            r.cep.replaceAll("-", "").replaceAll(".", "");
        customer.entity.nickTrade = r.fantasia;
        customer.company?.cnpj = r.cnpj;
        customer.entity.nameCompany = r.nome;
        customer.address.nmbr = r.numero;
        customer.address.street = r.logradouro;
        customer.address.complement = r.complemento;
        customer.address.neighborhood = r.bairro;
        customer.address.latitude = r.municipio;
        customer.address.region = r.uf;
        emit(CustomerRegisterInfoPageState(
            customers: customers, model: customer, tabIndex: 1));
      });
    });
  }

  searchCEP() {
    on<CustomerRegisterCepEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      final response = await getCep.call(ParamsCep(cep: event.cep));

      response.fold((l) => emit(CustomerRegisterCepErrorState(customers, "")),
          (r) {
        customer.address.zipCode = r.zipCode.replaceAll("-", "");
        customer.address.street = r.street;
        customer.address.complement = r.complement;
        customer.address.neighborhood = r.neighborhood;
        customer.address.stateName = r.stateName;
        customer.address.cityName = r.cityName;
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

  getSalesmansAction() {
    on<CustomerRegisterGetSalesmanEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      var response =
          await getSalesmans.call(ParamsSalesmanListGet(tbInstitutionId: 1));

      response.fold(
          (l) => emit(CustomerRegisterGetSalesmanErrorState(customers)), (r) {
        salesmans = r;
        emit(CustomerRegisterGetSalesmanSuccessState(customers, r));
      });
    });
  }

  searchSalesmans() {
    on<CustomerRegisterSearchSalesmanEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var salesmanSearched = salesmans.where((element) {
          String name = element.nameCompany;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (salesmanSearched.isEmpty) {}
        emit(CustomerRegisterGetSalesmanSuccessState(
            customers, salesmanSearched));
      } else {
        emit(CustomerRegisterGetSalesmanSuccessState(customers, salesmans));
      }
    });
  }
}
