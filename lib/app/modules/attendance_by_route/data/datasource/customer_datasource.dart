import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_sequence.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_set_turn_back.dart';
import 'package:flutter/foundation.dart';

abstract class CustomerDataSource extends Gateway {
  CustomerDataSource({required super.httpClient});
  Future<List<CustomerListByRouteModel>> getList(
      {required ParamsGetListCustomerByRoute params});
  Future<void> sequence({required ParamsSequenceCustomer params});
  Future<String> setTurnBack({required ParamsSetTurnBack params});
}

class CustomerDataSourceImpl extends CustomerDataSource {
  List<CustomerListByRouteModel> items = [];

  CustomerDataSourceImpl({required super.httpClient});
  @override
  Future<List<CustomerListByRouteModel>> getList(
      {required ParamsGetListCustomerByRoute params}) async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      String tbSalesRouteId = params.tbSalesRouteId.toString();
      String tbRegionId = params.tbRegionId.toString();
      String kind = params.kind;
      String dtRecord = CustomDate.formatDateOut(params.dtRecord);
      final uri = Uri.parse(
          '${baseApiUrl}customer/salesroute/getlist/$tbInstitutionId/$tbSalesRouteId/$tbRegionId/$kind/$dtRecord');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        items = (data as List).map((json) {
          return CustomerListByRouteModel.fromJson(json);
        }).toList();

        return items;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> sequence({required ParamsSequenceCustomer params}) async {
    try {
      await getInstitutionId().then((value) {
        (kIsWeb)
            ? params.tbInstitutionId = value
            : params.tbInstitutionId = int.parse(value);
      });

      var bodyjson = jsonEncode(params.toJson());
      return await request(
        'salesroute/sequence',
        method: HTTPMethod.post,
        data: bodyjson,
        (payload) {
          return;
        },
        onError: (error) {
          return Future.error(ServerException());
        },
      );
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> setTurnBack({required ParamsSetTurnBack params}) async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });
      params.tbInstitutionId = int.parse(tbInstitutionId);
      final uri = Uri.parse('${baseApiUrl}salesroute/setTurnBack/');
      var bodyjson = jsonEncode(params.toJson());
      final response = await httpClient.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyjson,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
