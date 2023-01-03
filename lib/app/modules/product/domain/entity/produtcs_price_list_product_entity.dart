import 'package:dartz/dartz.dart';

class ProductsPriceListProductsEntity {
  final int tbPriceListId;
  final String namePriceList;
  final List<Tuple3<int, String, double>> products;

  ProductsPriceListProductsEntity({
    required this.tbPriceListId,
    required this.namePriceList,
    required this.products,
  });
}
