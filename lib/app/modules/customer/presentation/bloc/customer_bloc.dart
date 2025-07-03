import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/customer/domain/usecase/region_get_list.dart';
import 'package:appweb/app/modules/customer/presentation/bloc/customer_event.dart';
import 'package:appweb/app/modules/customer/presentation/bloc/customer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final RegionGetlist regionGetlist;

  List<RegionModel> regionList = [];

  CustomerBloc({
    required this.regionGetlist,
  }) : super(CustomerLoadingState()) {
    getRegionList();
  }

  void getRegionList() {
    on<CustomerGetRegionListEvent>((event, emit) async {
      emit(CustomerLoadingState());

      var response = await regionGetlist.call(ParamsRegionGetList());

      var result = response.fold(
          (l) => CustomerGetRegionListErrorState(error: l.toString()), (r) {
        regionList = r;
        return CustomerGetRegionListLoadedState();
      });

      emit(result);
    });
  }
}
