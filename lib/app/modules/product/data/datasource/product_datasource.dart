import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/product/data/model/products_price_list_products_model.dart';
import 'package:appweb/app/modules/product/domain/entity/produtcs_price_list_product_entity.dart';

import 'package:http/http.dart' as http;

abstract class ProductDataSource {
  Future<List<ProductsPriceListProductsEntity>> getPriceList({required int id});
}

class ProductDataSourceImpl extends ProductDataSource {
  final client = http.Client();

  @override
  Future<List<ProductsPriceListProductsEntity>> getPriceList(
      {required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}product/pricelist/getall/$id');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = (data as List).map((e) {
          return ProductsPriceListProductsModel.fromJson(e);
        }).toList();
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
