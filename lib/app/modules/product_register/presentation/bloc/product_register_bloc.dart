import 'package:appweb/app/core/shared/enum.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_main_model.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_model.dart';
import 'package:appweb/app/modules/product_register/domain/usecase/product_register_delete.dart';
import 'package:appweb/app/modules/product_register/domain/usecase/product_register_get.dart';
import 'package:appweb/app/modules/product_register/domain/usecase/product_register_get_list.dart';
import 'package:appweb/app/modules/product_register/domain/usecase/product_register_post.dart';
import 'package:appweb/app/modules/product_register/domain/usecase/product_register_put.dart';
import 'package:appweb/app/modules/product_register/presentation/bloc/product_register_event.dart';
import 'package:appweb/app/modules/product_register/presentation/bloc/product_register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductRegisterBloc
    extends Bloc<ProductRegisterEvent, ProductRegisterState> {
  final ProductRegisterGetlist getlist;
  final ProductRegisterPost post;
  final ProductRegisterPut put;
  final ProductRegisterDelete delete;
  final ProductRegisterGet get;

  List<ProductRegisterModel> modelList = [];
  ProductRegisterMainModel model = ProductRegisterMainModel.empty();
  OptionYesNo? optionYesNo = OptionYesNo.S;

  ProductRegisterBloc({
    required this.getlist,
    required this.post,
    required this.put,
    required this.delete,
    required this.get,
  }) : super(ProductRegisterLoadingState()) {
    getList();

    searchProducts();

    productAdd();

    productEdit();

    postFunction();

    putFunction();
  }

  void getList() {
    on<ProductRegisterGetListEvent>((event, emit) async {
      emit(ProductRegisterLoadingState());

      var response = await getlist.call(ParamsProductRegisterGetlist());

      var result =
          response.fold((l) => ProductRegisterErrorState(list: modelList), (r) {
        modelList = r;
        return ProductRegisterLoadedState(list: r);
      });

      emit(result);
    });
  }

  void searchProducts() {
    on<ProductRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var modelListearched = modelList.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        emit(ProductRegisterLoadedState(list: modelListearched));
      } else {
        emit(ProductRegisterLoadedState(list: modelList));
      }
    });
  }

  void productAdd() {
    on<ProductRegisterAddEvent>((event, emit) async {
      emit(ProductRegisterLoadingState());

      var response = await get.call(ParamsProductRegisterGet(productId: 0));

      var result = response.fold((l) {
        return ProductRegisterGetErrorState(list: modelList);
      }, (r) {
        model = r;
        model.product.active = "S";
        optionYesNo = OptionYesNo.S;
        return ProductRegisterInfoPageState(list: modelList);
      });
      emit(result);
    });
  }

  void productEdit() {
    on<ProductRegisterEditEvent>((event, emit) async {
      emit(ProductRegisterLoadingState());
      var response =
          await get.call(ParamsProductRegisterGet(productId: model.product.id));

      var result = response.fold((l) {
        return ProductRegisterGetErrorState(list: modelList);
      }, (r) {
        model = r;
        (model.product.active == "S")
            ? optionYesNo = OptionYesNo.S
            : optionYesNo = OptionYesNo.N;
        return ProductRegisterInfoPageState(list: modelList);
      });
      emit(result);
    });
  }

  void postFunction() {
    on<ProductRegisterPostEvent>((event, emit) async {
      emit(ProductRegisterLoadingState());
      var response = await post.call(ParamsProductRegisterPost(model: model));

      var result = response.fold(
        (l) => ProductRegisterPostErrorState(list: modelList),
        (r) {
          modelList.add(ProductRegisterModel(
            id: r.product.id,
            tbInstitutionId: r.product.tbInstitutionId,
            description: r.product.description,
            active: r.product.active,
          ));
          return ProductRegisterPostSuccessState(list: modelList);
        },
      );
      emit(result);
    });
  }

  void putFunction() {
    on<ProductRegisterPutEvent>((event, emit) async {
      emit(ProductRegisterLoadingState());
      var response = await put.call(ParamsProductRegisterPut(model: model));

      var result = response.fold(
        (l) => ProductRegisterPutErrorState(list: modelList),
        (r) {
          modelList.removeWhere((element) => element.id == model.product.id);
          modelList.add(ProductRegisterModel(
            id: model.product.id,
            tbInstitutionId: model.product.tbInstitutionId,
            description: model.product.description,
            active: model.product.active,
          ));
          return ProductRegisterPutSuccessState(list: modelList);
        },
      );
      emit(result);
    });
  }
}
