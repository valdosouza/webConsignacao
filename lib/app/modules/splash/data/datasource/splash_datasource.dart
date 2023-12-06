import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';

abstract class SplashDataSource extends Gateway {
  SplashDataSource({required super.httpClient});

  Future<bool> getAuthorization();
}

class SplashDataSourceImpl extends SplashDataSource {
  List<RegionRegisterModel> list = [];

  SplashDataSourceImpl({required super.httpClient});
  @override
  Future<bool> getAuthorization() async {
    return await request(
      'auth/authorization',
      (payload) {
        final data = json.decode(payload);

        return (data['message'] == 'Valid Token');
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }
}
