import 'package:appweb/app/modules/institution_register/data/model/city_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/state_model.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/institution_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/usecase/institution_get_cep.dart';
import 'package:appweb/app/modules/institution_register/domain/usecase/institution_get_citys.dart';
import 'package:appweb/app/modules/institution_register/domain/usecase/institution_get_cnpj.dart';
import 'package:appweb/app/modules/institution_register/domain/usecase/institution_get_states.dart';
import 'package:appweb/app/modules/institution_register/domain/usecase/institution_register_get.dart';
import 'package:appweb/app/modules/institution_register/domain/usecase/institution_register_put.dart';
import 'package:appweb/app/modules/institution_register/domain/usecase/institution_register_post.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_event.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_state.dart';
import 'package:bloc/bloc.dart';

class InstitutionBloc extends Bloc<InstitutionEvent, InstitutionState> {
  final InstitutionRegisterSave save;
  final InstitutionRegisterGet get;
  final InstitutionPut put;
  final InstitutionGetCep cep;
  final InstitutionGetCnpj cnpj;
  final InstitutionGetStates getStates;
  final InstitutionGetCity getCity;
  InstitutionEntity entity = InstitutionEntity();
  List<StateModel> states = [];
  List<CityModel> citys = [];

  InstitutionBloc({
    required this.save,
    required this.get,
    required this.put,
    required this.cep,
    required this.cnpj,
    required this.getStates,
    required this.getCity,
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

    //Busca Estados
    getState();

    //Busca Cidades
    getCitys();

    //Volta para tela após escolha de cidade/estado
    on<InstitutionReturnEvent>(
        (event, emit) => emit(InstitutionReturnedState()));

    //Procura Estado
    searchEventStates();

    //Procura Estado
    searchEventCitys();
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

  getState() {
    on<InstitutionGetStatesEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response = await getStates.call(ParamsGetStates());

      response.fold((l) => emit(const InstitutionGetStatesErrorState("")), (r) {
        states = r;
        emit(InstitutionGetStatesSuccessState(states: r));
      });
    });
  }

  getCitys() {
    on<InstitutionGetCitysEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response = await getCity.call(ParamsGetCity(id: event.id));

      response.fold((l) => emit(const InstitutionGetCityErrorState("")), (r) {
        citys = r;
        emit(InstitutionGetCitySuccessState(citys: r));
      });
    });
  }

  searchEventStates() {
    on<SearchStateEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var statestSearched = states.where((element) {
          String name = element.name;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (statestSearched.isEmpty) {}
        emit(InstitutionGetStatesSuccessState(states: statestSearched));
      } else {
        emit(InstitutionGetStatesSuccessState(states: states));
      }
    });
  }

  searchEventCitys() {
    on<SearchCityEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var citystSearched = citys.where((element) {
          String name = element.name;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (citystSearched.isEmpty) {}
        emit(InstitutionGetCitySuccessState(citys: citystSearched));
      } else {
        emit(InstitutionGetCitySuccessState(citys: citys));
      }
    });
  }
}
