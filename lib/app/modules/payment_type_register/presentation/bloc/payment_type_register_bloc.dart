import 'package:appweb/app/core/shared/enum.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecase/payment_type_register_getlist.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecase/payment_type_register_delete.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecase/payment_type_register_post.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecase/payment_type_register_put.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_register_event.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentTypeRegisterBloc
    extends Bloc<PaymentTypeRegisterEvent, PaymentTypeRegisterState> {
  final PaymentTypeRegisterGetlist getlist;
  final PaymentTypeRegisterPost post;
  final PaymentTypeRegisterPut put;
  final PaymentTypeRegisterDelete delete;

  List<PaymentTypeModel> modelList = [];
  PaymentTypeModel model = PaymentTypeModel.empty();
  OptionYesNo? optionYesNo = OptionYesNo.S;

  PaymentTypeRegisterBloc({
    required this.getlist,
    required this.post,
    required this.put,
    required this.delete,
  }) : super(PaymentTypeRegisterLoadingState()) {
    getList();

    search();

    paymentTypeAdd();

    paymentTypeEdit();

    postFunction();

    putFunction();
  }

  getList() {
    on<PaymentTypeRegisterGetListEvent>((event, emit) async {
      emit(PaymentTypeRegisterLoadingState());

      var response = await getlist.call(ParamsPaymentTypeGet());

      var result = response
          .fold((l) => PaymentTypeRegisterErrorState(list: modelList), (r) {
        modelList = r;
        return PaymentTypeRegisterLoadedState(list: r);
      });

      emit(result);
    });
  }

  search() {
    on<PaymentTypeRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var searched = modelList.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        emit(PaymentTypeRegisterLoadedState(list: searched));
      } else {
        emit(PaymentTypeRegisterLoadedState(list: modelList));
      }
    });
  }

  paymentTypeAdd() {
    on<PaymentTypeRegisterAddEvent>((event, emit) async {
      model = PaymentTypeModel.empty();
      optionYesNo = OptionYesNo.S;
      emit(PaymentTypeRegisterInfoPageState(list: modelList));
    });
  }

  paymentTypeEdit() {
    on<PaymentTypeRegisterEditEvent>((event, emit) async {
      (model.active == "S")
          ? optionYesNo = OptionYesNo.S
          : optionYesNo = OptionYesNo.N;
      emit(PaymentTypeRegisterInfoPageState(list: modelList));
    });
  }

  postFunction() {
    on<PaymentTypeRegisterPostEvent>((event, emit) async {
      emit(PaymentTypeRegisterLoadingState());
      var response = await post.call(ParamsPaymentTypePost(model: model));

      var result = response.fold(
        (l) => PaymentTypeRegisterAddErrorState(list: modelList),
        (r) {
          modelList.add(r);
          return PaymentTypeRegisterAddSuccessState(list: modelList);
        },
      );
      emit(result);
    });
  }

  putFunction() {
    on<PaymentTypeRegisterPutEvent>((event, emit) async {
      emit(PaymentTypeRegisterLoadingState());
      var response = await put.call(ParamsPaymentTypePut(model: model));

      var result = response.fold(
        (l) => PaymentTypeRegisterEditErrorState(list: modelList),
        (r) {
          return PaymentTypeRegisterEditSuccessState(list: modelList);
        },
      );
      emit(result);
    });
  }
}
