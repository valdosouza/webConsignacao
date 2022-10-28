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
}
