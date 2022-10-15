import 'dart:async';

import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:appweb/app/modules/stock_list_register/domain/usescases/stock_list_getlist.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/stock_list_cubit/stock_list_state.dart';

class StockListCubit extends Cubit<StockListState> {
  final StockListGetlist _stocklist;

  StockListCubit(this._stocklist) : super([] as StockListState);

  Future<List<StockListModel>> getlist(int institutionId) async {
    try {
      emit(StockListLoadingState());

      final result = await _stocklist(Params(institutionId: institutionId));

      final List<StockListModel> lista =
          (result as Right).value as List<StockListModel>;

      emit(StockListLoaded());
      return lista;
    } catch (e) {
      emit(const StockListErrorState('emit: Erro ao buscar lista'));
      throw Exception('throw: Erro ao buscar lista');
    }
  }
}
