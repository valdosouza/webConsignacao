import 'package:appweb/app/modules/line_business_register/data/models/line_business_model.dart';

abstract class LineBusinessDataSource {
   Future<List<LineBusinessModel>> getlist({required String idInstitution});
  Future<String> postLineBusiness(
      {required LineBusinessModel lineBusinessModel});
  Future<String> deleteLineBusiness({required int lineBusinessId});
  Future<String> putLineBusiness({required LineBusinessModel lineBusinessModel});
}

class LineBusinessDataSourceImpl extends LineBusinessDataSource{
  @override
  Future<String> deleteLineBusiness({required int lineBusinessId}) async {
    // TODO: implement deleteLineBusiness
    throw UnimplementedError();
  }

  @override
  Future<List<LineBusinessModel>> getlist({required String idInstitution}) async {
    // TODO: implement getlist
    throw UnimplementedError();
  }

  @override
  Future<String> postLineBusiness({required LineBusinessModel lineBusinessModel}) async {
    // TODO: implement postLineBusiness
    throw UnimplementedError();
  }

  @override
  Future<String> putLineBusiness({required LineBusinessModel lineBusinessModel}) async {
    // TODO: implement putLineBusiness
    throw UnimplementedError();
  }

}