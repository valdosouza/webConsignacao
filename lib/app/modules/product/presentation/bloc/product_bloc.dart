import 'package:appweb/app/modules/product/data/model/products_price_list_products_model.dart';
import 'package:appweb/app/modules/product/domain/entity/produtcs_price_list_product_entity.dart';
import 'package:appweb/app/modules/product/domain/usecase/product_getlist_prices.dart';
import 'package:appweb/app/modules/product/presentation/bloc/product_event.dart';
import 'package:appweb/app/modules/product/presentation/bloc/product_state.dart';
import 'package:bloc/bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final PricesListGet getPriceList;

  List<ProductsPriceListProductsEntity> prices = [];
  ProductBloc({required this.getPriceList}) : super(ProductLoadingState()) {
    getPriceListMobile();

    searchPriceListMobile();
  }

  getPriceListMobile() {
    on<ProductPriceListMobileEvent>((event, emit) async {
      emit(ProductLoadingState());

      var response = await getPriceList.call(ParamsPricesListGet(id: 1));

      var result =
          response.fold((l) => ProductPriceListMobileErrorState(list: []), (r) {
        prices = r;
        return ProductPriceListMobileSuccessState(list: prices);
      });

      emit(result);
    });
  }

  searchPriceListMobile() {
    on<ProductSearchPriceListMobileEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        String search = event.search.toLowerCase().trim();
        var pricesSearch = prices.map((e) {
          var result = e.products.where((element) {
            return element.value2.toLowerCase().trim().contains(search);
          }).toList();
          return ProductsPriceListProductsModel(
            tbPriceListId: e.tbPriceListId,
            namePriceList: e.namePriceList,
            products: result,
          );
        }).toList();
        emit(ProductPriceListMobileSuccessState(list: pricesSearch));
      } else {
        emit(ProductPriceListMobileSuccessState(list: prices));
      }
    });
  }
}
