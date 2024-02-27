import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/sales_average/data/model/sales_average_model.dart';
import 'package:appweb/app/modules/sales_average/domain/usecase/get_region.dart';
import 'package:appweb/app/modules/sales_average/domain/usecase/get_sales_average.dart';
import 'package:appweb/app/modules/sales_average/presentation/bloc/event.dart';
import 'package:appweb/app/modules/sales_average/presentation/bloc/state.dart';
import 'package:bloc/bloc.dart';

class SalesAverageBloc extends Bloc<SalesAverageEvent, SalesAverageState> {
  final GetSalesAverage getSalesAverage;
  final GetRegion getRegion;

  List<SalesAverageModel> salesAverageList = List.empty();
  List<RegionModel> regionList = List.empty();

  int page = 0;
  String nameRegion = "";
  int tbRegionId = 0;
  String dateInitial = CustomDate.newDate();
  String dateFinal = CustomDate.newDate();

  SalesAverageBloc({
    required this.getSalesAverage,
    required this.getRegion,
  }) : super(InitState()) {
    _getSalesAverage();
    _getRegion();
    _goBackToMainForm();
  }

  _getSalesAverage() {
    on<GetSalesAverageEvent>((event, emit) async {
      emit(LoadingState());

      var response = await getSalesAverage.call(event.params);

      var result = response.fold((l) {
        return ErrorState(msg: l.toString());
      }, (r) {
        salesAverageList = r;
        return SalesAverageLoadedState(list: salesAverageList);
      });

      emit(result);
    });
  }

  _getRegion() {
    on<GetRegionListEvent>((event, emit) async {
      emit(LoadingState());

      var response = await getRegion.call(ParamsGetRegion());

      var result = response.fold((l) {
        return ErrorState(msg: l.toString());
      }, (r) {
        regionList = r;
        return RegionLoadedState(list: regionList);
      });

      emit(result);
    });
  }

  _goBackToMainForm() {
    on<MainFormEvent>((event, emit) async {
      emit(LoadingState());

      emit(MainFormLoadedState());
    });
  }
}
