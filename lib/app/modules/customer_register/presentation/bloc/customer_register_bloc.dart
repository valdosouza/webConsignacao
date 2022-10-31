import 'package:appweb/app/modules/customer_register/data/model/consumer_list_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/consumer_main_model.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_get.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_post.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_register_get_cep_usecase.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_register_get_citys.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_register_get_cnpj.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_register_get_list.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_register_get_states.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_state.dart';
import 'package:appweb/app/modules/institution_register/data/model/city_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/state_model.dart';
import 'package:bloc/bloc.dart';

class CustomerRegisterBloc
    extends Bloc<CustomerRegisterEvent, CustomerRegisterState> {
  final CustomerRegisterGetlist getlist;
  final CustomerRegisterGetCep getCep;
  final CustomerRegisterGetCity getCity;
  final CustomerRegisterGetCnpj getCnpj;
  final CustomerRegisterGetStates getStates;
  final CustomerRegisterGet getCustomer;
  final CustomerRegisterPost postCustomer;

  List<CustomerListModel> customers = [];
  CustomerMainModel customer = CustomerMainModel.empty();
  List<StateModel> states = [];
  List<CityModel> citys = [];

  CustomerRegisterBloc({
    required this.getlist,
    required this.getCep,
    required this.getCity,
    required this.getCnpj,
    required this.getStates,
    required this.getCustomer,
    required this.postCustomer,
  }) : super(CustomerRegisterLoadingState()) {
    getList();

    searchCostumer();

    goToCustomerInfoPage();

    searchCEP();

    searchCNPJ();

    getState();

    getCitys();

    searchEventStates();

    searchEventCitys();

    postCustomerAction();

    on<CustomerRegisterReturnEvent>((event, emit) => emit(
        CustomerRegisterInfoPageState(
            model: customer, customers: customers, tabIndex: 1)));
  }

  getList() {
    on<CustomerRegisterGetListEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      var response = await getlist.call(ParamsGetListCustomer(id: 1));

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
              ? emit(CustomerRegisterPostEditErrorState(customers, ""))
              : emit(CustomerRegisterPostAddErrorState(customers, "")), (r) {
        if (event.model.customer.id != 0) {
          emit(CustomerRegisterPostEditSuccessState(customers));
        } else {
          customers.add(CustomerListModel(
            id: r.customer.id,
            docType: r.person != null ? "F" : "J",
            documento: r.person != null ? r.person!.cpf : r.company!.cnpj,
            nameCompany: r.entity.nameCompany,
            nickTrade: r.entity.nickTrade,
          ));
          emit(CustomerRegisterPostAddSuccessState(customers));
        }
      });
    });
  }

  searchCostumer() {
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
          String email = element.documento;
          return email
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        var customersSearchedCpf = customers.where((element) {
          String email = element.documento;
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

  goToCustomerInfoPage() {
    on<CustomerRegisterInfoEvent>((event, emit) async {
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
            customers: customers, model: customer, tabIndex: 0));
      });
    });
  }

  searchCEP() {
    on<CustomerRegisterCepEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      final response = await getCep.call(ParamsCep(cep: event.cep));

      response.fold((l) => emit(CustomerRegisterCepErrorState(customers, "")),
          (r) {
        customer.address.zipCode = r.cep.replaceAll("-", "");
        customer.address.street = r.logradouro;
        customer.address.complement = r.complemento;
        customer.address.neighborhood = r.bairro;
        customer.address.stateName = r.uf;
        customer.address.cityName = r.localidade;
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

      final response = await getCity.call(ParamsGetCity(id: event.id));

      response.fold(
          (l) => emit(CustomerRegisterGetCityErrorState(customers, "")), (r) {
        citys = r;
        emit(CustomerRegisterGetCitySuccessState(
            citys: r, customers: customers));
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
        var citystSearched = citys.where((element) {
          String name = element.name;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (citystSearched.isEmpty) {}
        emit(CustomerRegisterGetCitySuccessState(
            citys: citystSearched, customers: customers));
      } else {
        emit(CustomerRegisterGetCitySuccessState(
            citys: citys, customers: customers));
      }
    });
  }
}
