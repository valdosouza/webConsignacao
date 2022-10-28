import 'package:appweb/app/modules/customer_register/data/model/consumer_main_model.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_register_get_list.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_state.dart';
import 'package:bloc/bloc.dart';

class CustomerRegisterBloc
    extends Bloc<CustomerRegisterEvent, CustomerRegisterState> {
  final CustomerRegisterGetlist getlist;

  List<CustomerMainModel> customers = [];

  CustomerRegisterBloc({
    required this.getlist,
  }) : super(CustomerRegisterLoadingState()) {
    getList();

    searchCostumer();

    goToCustomerInfoPage();
  }

  getList() {
    on<CustomerRegisterGetListEvent>((event, emit) async {
      emit(CustomerRegisterLoadingState());

      var response = await getlist.call(ParamsGetCustomer(id: 1));

      var result = response
          .fold((l) => CustomerRegisterErrorState(customers: customers), (r) {
        customers = r;
        return CustomerRegisterLoadedState(customers: r);
      });

      emit(result);
    });
  }

  searchCostumer() {
    on<CustomerRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var customersSearchedName = customers.where((element) {
          String name = element.entity.nameCompany;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        var customersSearchedCnpj = customers.where((element) {
          String email = element.company.cnpj;
          return email
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        var customersSearchedCpf = customers.where((element) {
          String email = element.person.cpf;
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
      emit(CustomerRegisterInfoPageState(
          customers: customers, model: event.model));
    });
  }
}
