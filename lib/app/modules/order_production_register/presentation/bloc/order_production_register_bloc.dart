import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/salesman_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/product_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_delete.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_get_list.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_post.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_put.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/product_get_list.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_event.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_state.dart';
import 'package:bloc/bloc.dart';

class OrderProductionRegisterBloc
    extends Bloc<OrderProductionRegisterEvent, OrderProductionRegisterState> {
  final OrderProductionRegisterGetlist getlistOrderProduction;
  final OrderProductionRegisterPost postOrderProduction;
  final OrderProductionRegisterPut putOrderProduction;
  final OrderProductionRegisterDelete deleteOrderProduction;
  final ProductGetlist productGetlist;
  final StockListGetlist stockListGetlist;

  List<OrderProductionRegisterModel> orderProductions = [];
  OrderProductionRegisterModel orderProduction = OrderProductionRegisterModel();
  List<ProductModel> products = [];
  List<StockListModel> stocks = [];

  OrderProductionRegisterBloc({
    required this.getlistOrderProduction,
    required this.postOrderProduction,
    required this.putOrderProduction,
    required this.deleteOrderProduction,
    required this.productGetlist,
    required this.stockListGetlist,
  }) : super(OrderProductionRegisterLoadingState()) {
    getList();

    // searchCustomer();

    // goToCustomerDesktopPage();

    // goToCustomerMobilePage();

    // searchEventStates();

    // searchEventCitys();

    postOrderProductionAction();

    putOrderProductionAction();

    deleteOrderProductionAction();

    // searchSalesmans();

    // on<CustomerRegisterReturnEvent>((event, emit) => emit(
    //     CustomerRegisterInfoPageState(
    //         model: customer, customers: customers, tabIndex: event.index)));
  }

  getList() {
    on<OrderProductionRegisterGetListEvent>((event, emit) async {
      emit(OrderProductionRegisterLoadingState());

      var response = await getlistOrderProduction
          .call(ParamsGetlistOrderProductionRegister(id: 1));

      response.fold(
          (l) =>
              emit(OrderProductionRegisterErrorState(list: orderProductions)),
          (r) {
        orderProductions = r;
        emit(OrderProductionRegisterLoadedState(list: r));
      });
    });
  }

  postOrderProductionAction() {
    on<OrderProductionRegisterPostEvent>((event, emit) async {
      emit(OrderProductionRegisterLoadingState());

      var response = await postOrderProduction
          .call(ParamsPostOrderProductionRegister(model: event.model));

      response.fold(
          (l) => event.model.id != 0
              ? emit(
                  OrderProductionRegisterPostErrorState(list: orderProductions))
              : emit(
                  OrderProductionRegisterPutErrorState(list: orderProductions)),
          (r) {
        orderProductions.add(r);
        emit(OrderProductionRegisterPostSuccessState(list: orderProductions));
      });
    });
  }

  putOrderProductionAction() {
    on<OrderProductionRegisterPutEvent>((event, emit) async {
      emit(OrderProductionRegisterLoadingState());

      var response = await putOrderProduction
          .call(ParamsPutOrderProductionRegister(model: event.model));

      response.fold(
          (l) => event.model.id != 0
              ? emit(
                  OrderProductionRegisterPutErrorState(list: orderProductions))
              : emit(
                  OrderProductionRegisterPutErrorState(list: orderProductions)),
          (r) {
        orderProductions.removeWhere((element) => element.id == r.id);
        orderProductions.add(r);
        emit(OrderProductionRegisterPutSuccessState(list: orderProductions));
      });
    });
  }

  deleteOrderProductionAction() {
    on<OrderProductionRegisterDeleteEvent>((event, emit) async {
      emit(OrderProductionRegisterLoadingState());

      var response = await deleteOrderProduction
          .call(ParamsDeleteOrderProductionRegister(id: event.model.id));

      response.fold(
          (l) => emit(
              OrderProductionRegisterDeleteErrorState(list: orderProductions)),
          (r) {
        orderProductions.removeWhere((element) => element.id == event.model.id);
        emit(OrderProductionRegisterDeleteSuccessState(list: orderProductions));
      });
    });
  }

  // searchCustomer() {
  //   on<CustomerRegisterSearchEvent>((event, emit) async {
  //     if (event.search.isNotEmpty) {
  //       var customersSearchedName = customers.where((element) {
  //         String name = element.nameCompany;
  //         return name
  //             .toLowerCase()
  //             .trim()
  //             .contains(event.search.toLowerCase().trim());
  //       }).toList();
  //       var customersSearchedCnpj = customers.where((element) {
  //         String email = element.documento;
  //         return email
  //             .toLowerCase()
  //             .trim()
  //             .contains(event.search.toLowerCase().trim());
  //       }).toList();
  //       var customersSearchedCpf = customers.where((element) {
  //         String email = element.documento;
  //         return email
  //             .toLowerCase()
  //             .trim()
  //             .contains(event.search.toLowerCase().trim());
  //       }).toList();
  //       if (customersSearchedName.isNotEmpty) {
  //         emit(CustomerRegisterLoadedState(customers: customersSearchedName));
  //       } else if (customersSearchedCnpj.isNotEmpty) {
  //         emit(CustomerRegisterLoadedState(customers: customersSearchedCnpj));
  //       } else {
  //         emit(CustomerRegisterLoadedState(customers: customersSearchedCpf));
  //       }
  //     } else {
  //       emit(CustomerRegisterLoadedState(customers: customers));
  //     }
  //   });
  // }

  // goToCustomerDesktopPage() {
  //   on<CustomerRegisterDesktopEvent>((event, emit) async {
  //     if (event.id != null) {
  //       emit(CustomerRegisterLoadingState());

  //       final response =
  //           await getCustomer.call(ParamsGetCustomer(id: event.id!));

  //       response.fold(
  //           (l) => emit(CustomerRegisterGetErrorState(customers: customers)),
  //           (r) {
  //         customer = r;
  //         emit(CustomerRegisterInfoPageState(
  //             customers: customers, model: r, tabIndex: 0));
  //       });
  //     } else {
  //       emit(CustomerRegisterInfoPageState(
  //           customers: customers, model: customer, tabIndex: 0));
  //     }
  //   });
  // }

  // goToCustomerMobilePage() {
  //   on<CustomerRegisterMobileEvent>((event, emit) async {
  //     if (event.id != null) {
  //       emit(CustomerRegisterLoadingState());

  //       final response =
  //           await getCustomer.call(ParamsGetCustomer(id: event.id!));

  //       response.fold(
  //           (l) => emit(CustomerRegisterGetErrorState(customers: customers)),
  //           (r) {
  //         customer = r;
  //         emit(CustomerRegisterInfoPageState(
  //             customers: customers, model: r, tabIndex: 0));
  //       });
  //     } else {
  //       emit(CustomerRegisterInfoPageState(
  //           customers: customers, model: customer, tabIndex: 0));
  //     }
  //   });
  // }

  // searchCNPJ() {
  //   on<CustomerRegisterCnpjEvent>((event, emit) async {
  //     emit(CustomerRegisterLoadingState());

  //     final response = await getCnpj.call(ParamsCnpj(cnpj: event.cnpj));

  //     response.fold((l) => emit(CustomerRegisterCnpjErrorState(customers, "")),
  //         (r) {
  //       customer.address.zipCode =
  //           r.cep.replaceAll("-", "").replaceAll(".", "");
  //       customer.entity.nickTrade = r.fantasia;
  //       customer.company?.cnpj = r.cnpj;
  //       customer.entity.nameCompany = r.nome;
  //       customer.address.nmbr = r.numero;
  //       customer.address.street = r.logradouro;
  //       customer.address.complement = r.complemento;
  //       customer.address.neighborhood = r.bairro;
  //       customer.address.latitude = r.municipio;
  //       customer.address.region = r.uf;
  //       emit(CustomerRegisterInfoPageState(
  //           customers: customers, model: customer, tabIndex: 1));
  //     });
  //   });
  // }

  // searchCEP() {
  //   on<CustomerRegisterCepEvent>((event, emit) async {
  //     emit(CustomerRegisterLoadingState());

  //     final response = await getCep.call(ParamsCep(cep: event.cep));

  //     response.fold((l) => emit(CustomerRegisterCepErrorState(customers, "")),
  //         (r) {
  //       customer.address.zipCode = r.zipCode.replaceAll("-", "");
  //       customer.address.street = r.street;
  //       customer.address.complement = r.complement;
  //       customer.address.neighborhood = r.neighborhood;
  //       customer.address.stateName = r.stateName;
  //       customer.address.cityName = r.cityName;
  //       emit(CustomerRegisterInfoPageState(
  //           customers: customers, model: customer, tabIndex: 1));
  //     });
  //   });
  // }

  // getState() {
  //   on<CustomerRegisterGetStatesEvent>((event, emit) async {
  //     emit(CustomerRegisterLoadingState());

  //     final response = await getStates.call(ParamsGetStates());

  //     response.fold(
  //         (l) => emit(CustomerRegisterGetStatesErrorState(customers, "")), (r) {
  //       states = r;
  //       emit(CustomerRegisterGetStatesSuccessState(
  //           states: r, customers: customers));
  //     });
  //   });
  // }

  // getCitys() {
  //   on<CustomerRegisterGetCitysEvent>((event, emit) async {
  //     emit(CustomerRegisterLoadingState());

  //     final response =
  //         await getCity.call(ParamsGetCity(tbStateId: event.tbStateId));

  //     response.fold(
  //         (l) => emit(CustomerRegisterGetCityErrorState(customers, "")), (r) {
  //       cities = r;
  //       emit(CustomerRegisterGetCitySuccessState(
  //           cities: r, customers: customers));
  //     });
  //   });
  // }

  // searchEventStates() {
  //   on<CustomerRegisterSearchStateEvent>((event, emit) async {
  //     if (event.search.isNotEmpty) {
  //       var statestSearched = states.where((element) {
  //         String name = element.name;
  //         return name
  //             .toLowerCase()
  //             .trim()
  //             .contains(event.search.toLowerCase().trim());
  //       }).toList();
  //       if (statestSearched.isEmpty) {}
  //       emit(CustomerRegisterGetStatesSuccessState(
  //         states: statestSearched,
  //         customers: customers,
  //       ));
  //     } else {
  //       emit(CustomerRegisterGetStatesSuccessState(
  //           states: states, customers: customers));
  //     }
  //   });
  // }

  // searchEventCitys() {
  //   on<CustomerRegisterSearchCityEvent>((event, emit) async {
  //     if (event.search.isNotEmpty) {
  //       var citiestSearched = cities.where((element) {
  //         String name = element.name;
  //         return name
  //             .toLowerCase()
  //             .trim()
  //             .contains(event.search.toLowerCase().trim());
  //       }).toList();
  //       if (citiestSearched.isEmpty) {}
  //       emit(CustomerRegisterGetCitySuccessState(
  //           cities: citiestSearched, customers: customers));
  //     } else {
  //       emit(CustomerRegisterGetCitySuccessState(
  //           cities: cities, customers: customers));
  //     }
  //   });
  // }

  // getSalesmansAction() {
  //   on<CustomerRegisterGetSalesmanEvent>((event, emit) async {
  //     emit(CustomerRegisterLoadingState());

  //     var response =
  //         await getSalesmans.call(ParamsSalesmanListGet(tbInstitutionId: 1));

  //     response.fold(
  //         (l) => emit(CustomerRegisterGetSalesmanErrorState(customers)), (r) {
  //       salesmans = r;
  //       emit(CustomerRegisterGetSalesmanSuccessState(customers, r));
  //     });
  //   });
  // }

  // searchSalesmans() {
  //   on<CustomerRegisterSearchSalesmanEvent>((event, emit) async {
  //     if (event.search.isNotEmpty) {
  //       var salesmanSearched = salesmans.where((element) {
  //         String name = element.nameCompany;
  //         return name
  //             .toLowerCase()
  //             .trim()
  //             .contains(event.search.toLowerCase().trim());
  //       }).toList();
  //       if (salesmanSearched.isEmpty) {}
  //       emit(CustomerRegisterGetSalesmanSuccessState(
  //           customers, salesmanSearched));
  //     } else {
  //       emit(CustomerRegisterGetSalesmanSuccessState(customers, salesmans));
  //     }
  //   });
  // }
}
