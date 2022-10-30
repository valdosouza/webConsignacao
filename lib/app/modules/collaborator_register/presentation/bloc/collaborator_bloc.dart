import 'package:appweb/app/modules/collaborator_register/data/model/city_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/state_model.dart';
import 'package:appweb/app/modules/collaborator_register/domain/entity/collaborator_entity.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_cep_usecase.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_citys.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_cnpj_usecase.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_line_business.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_states.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_usecase.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_put_usecase.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_register_usecase.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_event.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_state.dart';
import 'package:appweb/app/modules/line_business_register/data/model/line_business_model.dart';
import 'package:bloc/bloc.dart';

class CollaboratorBloc extends Bloc<CollaboratorEvent, CollaboratorState> {
  final CollaboratorRegisterSave save;
  final CollaboratorRegisterGet get;
  final CollaboratorPut put;
  final CollaboratorGetCep cep;
  final CollaboratorGetCnpj cnpj;
  final CollaboratorGetStates getStates;
  final CollaboratorGetCity getCity;
  final CollaboratorGetLineBusiness getLineBusiness;
  CollaboratorEntity entity = CollaboratorModel();
  List<StateModel> states = [];
  List<CityModel> citys = [];
  List<LineBusinessModel> lineBusiness = [];

  CollaboratorBloc({
    required this.save,
    required this.get,
    required this.put,
    required this.cep,
    required this.cnpj,
    required this.getStates,
    required this.getCity,
    required this.getLineBusiness
  }) : super(CollaboratorInitialState()) {
    //Busca instituicao [id está mockado]
    getCollaborator();

    //Salva uma nova instituicao
    saveCollaborator();

    //Atualiza dados da instituicao
    putCollaborator();

    //Busca CEP
    searchCEP();

    //Busca CNPJ
    searchCNPJ();

    //Busca Estados
    getState();

    //Busca Cidades
    getCitys();

    //Volta para tela após escolha de cidade/estado
    on<CollaboratorReturnEvent>(
        (event, emit) => emit(CollaboratorReturnedState()));

    //Procura Estado
    searchEventStates();

    //Procura Estado
    searchEventCitys();

    //Busca todos os cargos
    getAllLineBusiness();
  }

  getCollaborator() {
    on<CollaboratorGetEvent>((event, emit) async {
      emit(CollaboratorLoadingState());

      final response = await get.call(const ParamsGet(id: 1));

      response.fold((l) => emit(const CollaboratorGetErrorState("")), (r) {
        entity = r;
        emit(CollaboratorLoadedState());
      });
    });
  }

  saveCollaborator() {
    on<CollaboratorSaveEvent>((event, emit) async {
      emit(CollaboratorLoadingState());

      final response =
          await save.call(Params(model: CollaboratorModel.fromEntity(entity)));

      response.fold((l) => emit(const CollaboratorGetErrorState("")),
          (r) => emit(CollaboratorPostSuccessState()));
    });
  }

  putCollaborator() {
    on<CollaboratorPutEvent>((event, emit) async {
      emit(CollaboratorLoadingState());

      final response =
          await put.call(ParamsPut(model: CollaboratorModel.fromEntity(entity)));

      response.fold((l) => emit(const CollaboratorPutErrorState("")),
          (r) => emit(CollaboratorPutSuccessState()));
    });
  }

  searchCEP() {
    on<CollaboratorCnpjEvent>((event, emit) async {
      emit(CollaboratorLoadingState());

      final response = await cnpj.call(ParamsCnpj(cnpj: event.cnpj));

      response.fold((l) => emit(const CollaboratorCnpjErrorState("")), (r) {
        entity.address!.zipCode = r.address!.zipCode.replaceAll("-", "").replaceAll(".", "");
        entity.entity!.nickTrade = r.entity!.nickTrade;
        entity.company!.cnpj = r.company!.cnpj;
        entity.entity!.nameCompany = r.entity!.nameCompany;
        entity.address!.nmbr = r.address!.nmbr;
        entity.address!.street = r.address!.street;
        entity.address!.complement = r.address!.complement;
        entity.address!.neighborhood = r.address!.neighborhood;
        emit(CollaboratorLoadedState());
      });
    });
  }

  searchCNPJ() {
    on<CollaboratorCepEvent>((event, emit) async {
      emit(CollaboratorLoadingState());

      final response = await cep.call(ParamsCep(cep: event.cep));

      response.fold((l) => emit(const CollaboratorCepErrorState("")), (r) {
        entity.address!.zipCode = r.zipCode.replaceAll("-", "");
        entity.address!.street = r.street;
        entity.address!.complement = r.complement;
        entity.address!.neighborhood = r.neighborhood;
        entity.address!.latitude = r.latitude;
        entity.address!.tbCityId = r.tbCityId;
        entity.address!.region = r.region;
        emit(CollaboratorLoadedState());
      });
    });
  }

  getState() {
    on<CollaboratorGetStatesEvent>((event, emit) async {
      emit(CollaboratorLoadingState());

      final response = await getStates.call(ParamsGetStates());

      response.fold((l) => emit(const CollaboratorGetStatesErrorState("")), (r) {
        states = r;
        emit(CollaboratorGetStatesSuccessState(states: r));
      });
    });
  }

  getCitys() {
    on<CollaboratorGetCitysEvent>((event, emit) async {
      emit(CollaboratorLoadingState());

      final response = await getCity.call(ParamsGetCity(id: event.id));

      response.fold((l) => emit(const CollaboratorGetCityErrorState("")), (r) {
        citys = r;
        emit(CollaboratorGetCitySuccessState(citys: r));
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
        emit(CollaboratorGetStatesSuccessState(states: statestSearched));
      } else {
        emit(CollaboratorGetStatesSuccessState(states: states));
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
        emit(CollaboratorGetCitySuccessState(citys: citystSearched));
      } else {
        emit(CollaboratorGetCitySuccessState(citys: citys));
      }
    });
  }

  getAllLineBusiness(){
    on<CollaboratorGetLineBusinessEvent>((event, emit) async {
     emit(CollaboratorLoadingState());

      final response = await getLineBusiness.call(ParamLineBusiness(institution: event.institution));

      response.fold((l) => emit(const CollaboratorGetLineBusinessErrorState("Erro ao buscar Cargos")), (r) {
        lineBusiness = r;
        emit(CollaboratorGetLineBusinessSuccessState(lineBussines: r));
      });
    });
  }
}
