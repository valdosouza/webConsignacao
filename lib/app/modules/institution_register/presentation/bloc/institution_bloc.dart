import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/institution_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/usecases/institution_get_cep.dart';
import 'package:appweb/app/modules/institution_register/domain/usecases/institution_get_usecase.dart';
import 'package:appweb/app/modules/institution_register/domain/usecases/institution_put_usecase.dart';
import 'package:appweb/app/modules/institution_register/domain/usecases/institution_register_usecase.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_event.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_state.dart';
import 'package:bloc/bloc.dart';

class InstitutionBloc extends Bloc<InstitutionEvent, InstitutionState> {
  final InstitutionRegisterSave save;
  final InstitutionRegisterGet get;
  final InstitutionPut put;
  final InstitutionGetCep cep;
  InstitutionEntity entity = InstitutionEntity();

  InstitutionBloc({
    required this.save,
    required this.get,
    required this.put,
    required this.cep,
  }) : super(InstitutionInitialState()) {
    //Busca instituicao [id está mockado]
    on<InstitutionGetEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response = await get.call(const ParamsGet(id: 1));

      response.fold((l) => emit(const InstitutionGetErrorState("")), (r) {
        entity = r;
        entity.addressKind = "PRINCIPAL";
        entity.phoneKind = "CELULAR";
        entity.phoneNumber = "11984950306";
        emit(InstitutionLoadedState());
      });
    });

    //Salva uma nova instituicao
    on<InstitutionSaveEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response =
          await save.call(Params(model: InstitutionModel.fromEntity(entity)));

      response.fold((l) => emit(const InstitutionGetErrorState("")),
          (r) => emit(InstitutionPostSuccessState()));
    });

    //Atualiza dados da instituicao
    on<InstitutionPutEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response =
          await put.call(ParamsPut(model: InstitutionModel.fromEntity(entity)));

      response.fold((l) => emit(const InstitutionPutErrorState("")),
          (r) => emit(InstitutionPutSuccessState()));
    });

    //Busca CEP
    on<InstitutionCepEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response = await cep.call(ParamsCep(cep: event.cep));

      response.fold((l) => emit(const InstitutionCepErrorState("")), (r) {
        entity.zipCode = r.cep.replaceAll("-", "");
        entity.street = r.logradouro;
        entity.complement = r.complemento;
        entity.neighborhood = r.bairro;
        entity.latitude = r.localidade;
        entity.tbCityId = int.parse(r.ddd);
        entity.region = r.uf;
        emit(InstitutionLoadedState());
      });
    });
  }
}
