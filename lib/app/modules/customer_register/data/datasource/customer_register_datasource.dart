import 'package:appweb/app/modules/customer_register/data/model/consumer_main_model.dart';
import 'package:http/http.dart' as http;

abstract class CustomerRegisterDataSource {
  Future<List<CustomerMainModel>> getlist({required int id});
}

class CustomerRegisterDataSourceImpl extends CustomerRegisterDataSource {
  final client = http.Client();
  List<CustomerMainModel> items = [];

  @override
  Future<List<CustomerMainModel>> getlist({required int id}) async {
    List<CustomerMainModel> listMock =
        List.generate(6, (index) => CustomerMainModel.mock());

    await Future.delayed(const Duration(seconds: 2));

    return listMock;
    // try {
    // final uri = Uri.parse('${baseApiUrl}user/getlist/$id');

    // final response = await client.get(uri);

    //   if (response.statusCode == 200) {
    //     final data = json.decode(response.body);

    //     items = (data as List).map((json) {
    //       return UserRegisterModel.fromJson(json);
    //     }).toList();
    //     return items;
    //   } else {
    //     throw ServerException();
    //   }
    // } catch (e) {
    //   throw ServerException();
    // }
  }
}
