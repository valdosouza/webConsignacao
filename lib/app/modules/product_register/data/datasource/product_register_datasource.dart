import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_main_model.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRegisterDataSource {
  Future<List<ProductRegisterModel>> getlist();
  Future<ProductRegisterMainModel> get({required int productId});
  Future<ProductRegisterMainModel> post(
      {required ProductRegisterMainModel model});
  Future<ProductRegisterMainModel> put(
      {required ProductRegisterMainModel model});
  Future<String> delete({required int id});
}

class ProductRegisterDataSourceImpl extends ProductRegisterDataSource {
  final client = http.Client();
  List<ProductRegisterModel> products = [];
  var tbInstitutionId = 1;
  @override
  Future<List<ProductRegisterModel>> getlist() async {
    try {
      final uri = Uri.parse('${baseApiUrl}product/getlist/$tbInstitutionId');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        products = (data as List).map((json) {
          return ProductRegisterModel.fromJson(json);
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
  Future<ProductRegisterMainModel> post(
      {required ProductRegisterMainModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}product');

      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = ProductRegisterMainModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ProductRegisterMainModel> put(
      {required ProductRegisterMainModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}product');

      final response = await client.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = ProductRegisterMainModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> delete({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}product/$id');

      final response = await client.delete(uri);

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
  Future<ProductRegisterMainModel> get({required int productId}) async {
    try {
      final uri =
          Uri.parse('${baseApiUrl}product/get/$tbInstitutionId/$productId');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = ProductRegisterMainModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
