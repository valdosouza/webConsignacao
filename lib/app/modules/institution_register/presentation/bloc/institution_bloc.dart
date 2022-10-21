import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/institution_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/usecases/institution_get_cep_usecase.dart';
import 'package:appweb/app/modules/institution_register/domain/usecases/institution_get_cnpj_usecase.dart';
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
  final InstitutionGetCnpj cnpj;
  InstitutionEntity entity = InstitutionEntity();

  InstitutionBloc({
    required this.save,
    required this.get,
    required this.put,
    required this.cep,
    required this.cnpj,
  }) : super(InstitutionInitialState()) {
    //Busca instituicao [id está mockado]
    getInstitution();

    //Salva uma nova instituicao
    saveInstitution();

    //Atualiza dados da instituicao
    putInstitution();

    //Busca CEP
    searchCEP();

    //Busca CNPJ
    searchCNPJ();
  }

  getInstitution() {
    on<InstitutionGetEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response = await get.call(const ParamsGet(id: 1));

      response.fold((l) => emit(const InstitutionGetErrorState("")), (r) {
        entity = r;
        emit(InstitutionLoadedState());
      });
    });
  }

  saveInstitution() {
    on<InstitutionSaveEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response =
          await save.call(Params(model: InstitutionModel.fromEntity(entity)));

      response.fold((l) => emit(const InstitutionGetErrorState("")),
          (r) => emit(InstitutionPostSuccessState()));
    });
  }

  putInstitution() {
    on<InstitutionPutEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response =
          await put.call(ParamsPut(model: InstitutionModel.fromEntity(entity)));

      response.fold((l) => emit(const InstitutionPutErrorState("")),
          (r) => emit(InstitutionPutSuccessState()));
    });
  }

  searchCEP() {
    on<InstitutionCnpjEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response = await cnpj.call(ParamsCnpj(cnpj: event.cnpj));

      response.fold((l) => emit(const InstitutionCnpjErrorState("")), (r) {
        entity.zipCode = r.cep.replaceAll("-", "").replaceAll(".", "");
        entity.nickTrade = r.fantasia;
        entity.cnpj = r.cnpj;
        entity.nameCompany = r.nome;
        entity.nmbr = r.numero;
        entity.street = r.logradouro;
        entity.complement = r.complemento;
        entity.neighborhood = r.bairro;
        entity.latitude = r.municipio;
        entity.region = r.uf;
        emit(InstitutionLoadedState());
      });
    });
  }

  searchCNPJ() {
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
