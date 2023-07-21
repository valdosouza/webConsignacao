import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/product/data/model/products_price_list_products_model.dart';
import 'package:appweb/app/modules/product/domain/entity/produtcs_price_list_product_entity.dart';

abstract class ProductDataSource extends Gateway {
  ProductDataSource({required super.httpClient});

  Future<List<ProductsPriceListEntity>> getPriceList();
}

class ProductDataSourceImpl extends ProductDataSource {
  ProductDataSourceImpl({required super.httpClient});

  @override
  Future<List<ProductsPriceListEntity>> getPriceList() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return request(
      'product/pricelist/getall/$tbInstitutionId',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List).map((e) {
          return ProductsPriceListModel.fromJson(e);
        }).toList();
        return model;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }
}
