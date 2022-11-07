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

  List<ProductRegisterModel> products = [];

  ProductRegisterBloc({
    required this.getlist,
    required this.post,
    required this.put,
    required this.delete,
    required this.get,
  }) : super(ProductRegisterLoadingState()) {
    getList();

    searchProducts();

    goToInfoPage();

    addFunction();

    editFunction();
  }

  getList() {
    on<ProductRegisterGetListEvent>((event, emit) async {
      emit(ProductRegisterLoadingState());

      var response = await getlist.call(ParamsProductRegisterGetlist(id: 1));

      var result =
          response.fold((l) => ProductRegisterErrorState(list: products), (r) {
        products = r;
        return ProductRegisterLoadedState(list: r);
      });

      emit(result);
    });
  }

  searchProducts() {
    on<ProductRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var productsearched = products.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        emit(ProductRegisterLoadedState(list: productsearched));
      } else {
        emit(ProductRegisterLoadedState(list: products));
      }
    });
  }

  goToInfoPage() {
    on<ProductRegisterInfoEvent>((event, emit) async {
      emit(ProductRegisterLoadingState());

      var response = await get.call(ParamsProductRegisterGet(
          intitutionId: 1,
          productId: event.model != null ? event.model!.id : 0));

      var result = response.fold(
          (l) => ProductRegisterGetErrorState(list: products),
          (r) => ProductRegisterInfoPageState(list: products, model: r));

      emit(result);
    });
  }

  addFunction() {
    on<ProductRegisterPostEvent>((event, emit) async {
      emit(ProductRegisterLoadingState());
      var response =
          await post.call(ParamsProductRegisterPost(model: event.model));

      var result = response.fold(
        (l) => ProductRegisterPostErrorState(list: products),
        (r) {
          products.add(ProductRegisterModel(
            id: r.product.id,
            tbInstitutionId: r.product.tbInstitutionId,
            description: r.product.description,
            active: r.product.active,
          ));
          return ProductRegisterPostSuccessState(list: products);
        },
      );
      emit(result);
    });
  }

  editFunction() {
    on<ProductRegisterPutEvent>((event, emit) async {
      emit(ProductRegisterLoadingState());
      var response =
          await put.call(ParamsProductRegisterPut(model: event.model));

      var result = response.fold(
        (l) => ProductRegisterPutErrorState(list: products),
        (r) {
          products
              .removeWhere((element) => element.id == event.model.product.id);
          products.add(ProductRegisterModel(
            id: event.model.product.id,
            tbInstitutionId: event.model.product.tbInstitutionId,
            description: event.model.product.description,
            active: event.model.product.active,
          ));
          return ProductRegisterPutSuccessState(list: products);
        },
      );
      emit(result);
    });
  }
}
