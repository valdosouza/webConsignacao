import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_get_list.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_event.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderProductionRegisterBloc
    extends Bloc<OrderProductionRegisterEvent, OrderProductionRegisterState> {
  final OrderProductionRegisterGetlist getlist;
  // final ProductRegisterPost post;
  // final ProductRegisterPut put;
  // final ProductRegisterDelete delete;
  // final ProductRegisterGet get;

  List<OrderProductionModel> orders = [];

  OrderProductionRegisterBloc({
    required this.getlist,
    // required this.post,
    // required this.put,
    // required this.delete,
    // required this.get,
  }) : super(OrderProductionRegisterLoadingState()) {
    getList();

    searchProducts();

    // goToInfoPage();

    // addFunction();

    // editFunction();
  }

  getList() {
    on<OrderProductionRegisterGetListEvent>((event, emit) async {
      emit(OrderProductionRegisterLoadingState());

      var response =
          await getlist.call(ParamsOrderProductionRegisterGetlist(id: 1));

      var result = response
          .fold((l) => OrderProductionRegisterErrorState(list: orders), (r) {
        orders = r;
        return OrderProductionRegisterLoadedState(list: r);
      });

      emit(result);
    });
  }

  searchProducts() {
    on<OrderProductionRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var productsearched = orders.where((element) {
          String name = element.nameMerchandise;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        emit(OrderProductionRegisterLoadedState(list: productsearched));
      } else {
        emit(OrderProductionRegisterLoadedState(list: orders));
      }
    });
  }

  // goToInfoPage() {
  //   on<ProductRegisterInfoEvent>((event, emit) async {
  //     emit(ProductRegisterLoadingState());

  //     var response = await get.call(ParamsProductRegisterGet(
  //         intitutionId: 1,
  //         productId: event.model != null ? event.model!.id : 0));

  //     var result = response.fold(
  //         (l) => ProductRegisterGetErrorState(list: products),
  //         (r) => ProductRegisterInfoPageState(list: products, model: r));

  //     emit(result);
  //   });
  // }

  // addFunction() {
  //   on<ProductRegisterPostEvent>((event, emit) async {
  //     emit(ProductRegisterLoadingState());
  //     var response =
  //         await post.call(ParamsProductRegisterPost(model: event.model));

  //     var result = response.fold(
  //       (l) => ProductRegisterPostErrorState(list: products),
  //       (r) {
  //         products.add(ProductRegisterModel(
  //           id: r.product.id,
  //           tbInstitutionId: r.product.tbInstitutionId,
  //           description: r.product.description,
  //           active: r.product.active,
  //         ));
  //         return ProductRegisterPostSuccessState(list: products);
  //       },
  //     );
  //     emit(result);
  //   });
  // }

  // editFunction() {
  //   on<ProductRegisterPutEvent>((event, emit) async {
  //     emit(ProductRegisterLoadingState());
  //     var response =
  //         await put.call(ParamsProductRegisterPut(model: event.model));

  //     var result = response.fold(
  //       (l) => ProductRegisterPutErrorState(list: products),
  //       (r) {
  //         products
  //             .removeWhere((element) => element.id == event.model.product.id);
  //         products.add(ProductRegisterModel(
  //           id: event.model.product.id,
  //           tbInstitutionId: event.model.product.tbInstitutionId,
  //           description: event.model.product.description,
  //           active: event.model.product.active,
  //         ));
  //         return ProductRegisterPutSuccessState(list: products);
  //       },
  //     );
  //     emit(result);
  //   });
  // }
}
