import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/apply_default_sequence.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/get_customer.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/set_default_sequence.dart';
import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';

abstract class DataSource extends Gateway {
  DataSource({required super.httpClient});

  Future<List<RegionModel>> getRegion();
  Future<List<SalesRouteRegisterModel>> getRoute();
  Future<List<CustomerListByRouteModel>> getCustomer(
      {required ParamsGetCustomer params});
  Future<void> setDefaultSequence({required ParamsDefaultSequence params});

  Future<void> applyDefaultSequence(
      {required ParamsApplyDefaultSequence params});
}

class DataSourceImpl extends DataSource {
  DataSourceImpl({required super.httpClient});

  @override
  Future<List<RegionModel>> getRegion() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return await request(
      'region/getlist/$tbInstitutionId',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List).map((e) => RegionModel.fromJson(e)).toList();
        return model;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<List<SalesRouteRegisterModel>> getRoute() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return await request(
      'salesroute/getlist/$tbInstitutionId',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List)
            .map((e) => SalesRouteRegisterModel.fromJson(e))
            .toList();
        return model;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<List<CustomerListByRouteModel>> getCustomer(
      {required ParamsGetCustomer params}) async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return await request(
      'customer/regionroute/getlist/$tbInstitutionId/${params.tbRegionId}/${params.tbSalesRouteId}',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List)
            .map((e) => CustomerListByRouteModel.fromJson(e))
            .toList();
        return model;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<void> setDefaultSequence(
      {required ParamsDefaultSequence params}) async {
    await getInstitutionId().then((value) {
      params.tbInstitutionId = value;
    });
    var bodyjson = jsonEncode(params.toJson());
    return await request(
      'salesroute/defaultsequence',
      method: HTTPMethod.post,
      data: bodyjson,
      (payload) {
        return;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<void> applyDefaultSequence(
      {required ParamsApplyDefaultSequence params}) async {
    await getInstitutionId().then((value) {
      params.tbInstitutionId = value;
    });
    var bodyjson = jsonEncode(params.toJson());
    return await request(
      'salesroute/applydefault',
      method: HTTPMethod.post,
      data: bodyjson,
      (payload) {
        return;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }
}
