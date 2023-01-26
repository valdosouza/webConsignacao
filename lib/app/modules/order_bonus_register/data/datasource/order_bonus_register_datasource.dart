import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:flutter/foundation.dart';

abstract class OrderBonusRegisterDataSource extends Gateway {
  OrderBonusRegisterDataSource({required super.httpClient});

  Future<List<OrderBonusRegisterModel>> getlist();
  Future<OrderBonusRegisterModel> get({required int orderBonusId});
  Future<OrderBonusRegisterModel> post(
      {required OrderBonusRegisterModel model});
  Future<OrderBonusRegisterModel> put({required OrderBonusRegisterModel model});
  Future<String> delete({required int id});
  Future<List<ProductListModel>> getListProducts();
  Future<List<StockListModel>> getListStock();
  Future<List<EntityListModel>> getListEtities();
  Future<String> closure({required OrderStatusModel model});
  Future<String> reopen({required OrderStatusModel model});
}

class OrderBonusRegisterDataSourceImpl extends OrderBonusRegisterDataSource {
  List<OrderBonusRegisterModel> orderBonus = [];
  List<ProductListModel> products = [];
  List<StockListModel> stock = [];
  List<EntityListModel> entity = [];

  OrderBonusRegisterDataSourceImpl({required super.httpClient});

  @override
  Future<List<OrderBonusRegisterModel>> getlist() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return request(
      'orderbonus/getlist/$tbInstitutionId',
      (payload) {
        final data = json.decode(payload);
        orderBonus = (data as List).map(
          (json) {
            return OrderBonusRegisterModel.fromListJson(json);
          },
        ).toList();
        return orderBonus;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<OrderBonusRegisterModel> post(
      {required OrderBonusRegisterModel model}) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });
    int tbUserId = 1;
    await getUserId().then((value) {
      (kIsWeb) ? tbUserId = value : tbUserId = int.parse(value);
    });
    model.tbInstitutionId = tbInstitutionId;
    model.tbUserId = tbUserId;
    model.tbSalesmanId = tbUserId;
    final body = jsonEncode(model.toJson());

    return request(
      'orderbonus',
      method: HTTPMethod.post,
      data: body,
      (payload) {
        final data = json.decode(payload);
        var model = OrderBonusRegisterModel.fromListJson(data);
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<OrderBonusRegisterModel> put(
      {required OrderBonusRegisterModel model}) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });
    int tbUserId = 1;
    await getUserId().then((value) {
      (kIsWeb) ? tbUserId = value : tbUserId = int.parse(value);
    });
    model.tbInstitutionId = tbInstitutionId;
    model.tbUserId = tbUserId;

    var bodyContent = jsonEncode(model.toJson());

    return request(
      'orderbonus',
      data: bodyContent,
      method: HTTPMethod.put,
      (payload) {
        final data = json.decode(payload);
        var model = OrderBonusRegisterModel.fromListJson(data);
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<String> delete({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}orderbonus/$id');

      final response = await httpClient.delete(uri);

      if (response.statusCode == 200) {
        return "";
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<OrderBonusRegisterModel> get({required int orderBonusId}) async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return request(
      'orderbonus/get/$tbInstitutionId/$orderBonusId',
      (payload) {
        final data = json.decode(payload);
        var model = OrderBonusRegisterModel.fromJson(data);
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<List<ProductListModel>> getListProducts() async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      final uri = Uri.parse('${baseApiUrl}product/getlist/$tbInstitutionId');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        products = (data as List).map((json) {
          return ProductListModel.fromJson(json);
        }).toList();

        return products;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<StockListModel>> getListStock() async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      final uri = Uri.parse('${baseApiUrl}stocklist/getlist/$tbInstitutionId');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        stock = (data as List).map((json) {
          return StockListModel.fromJson(json);
        }).toList();

        return stock;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<EntityListModel>> getListEtities() async {
    try {
      final uri = Uri.parse('${baseApiUrl}entity');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        entity = (data as List).map((json) {
          return EntityListModel.fromJson(json);
        }).toList();

        return entity;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> closure({required OrderStatusModel model}) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });
    model.tbInstitutionId = tbInstitutionId;
    final body = jsonEncode(model.toJson());
    return request(
      'orderbonus/closure',
      method: HTTPMethod.post,
      data: body,
      (payload) {
        final data = payload;
        //var model = OrderStatusModel.fromJson(data);
        return data;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<String> reopen({required OrderStatusModel model}) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });
    model.tbInstitutionId = tbInstitutionId;
    final body = jsonEncode(model.toJson());
    return request(
      'orderbonus/reopen',
      method: HTTPMethod.post,
      data: body,
      (payload) {
        final data = payload;
        //var model = OrderStatusModel.fromJson(data);
        return data;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
