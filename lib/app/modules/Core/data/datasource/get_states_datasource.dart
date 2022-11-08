import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:http/http.dart' as http;

abstract class GetStatesDatasource {
  Future<List<StateModel>> getStates();
}

class GetStatesDatasourceImpl implements GetStatesDatasource {
  final client = http.Client();
  List<StateModel> states = [];

  @override
  Future<List<StateModel>> getStates() async {
    try {
      final uri = Uri.parse('${baseApiUrl}state/getlist/');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        var obj = jsonDecode(response.body);
        states = (obj as List).map((json) {
          return StateModel.fromJson(json);
        }).toList();
        return states;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
