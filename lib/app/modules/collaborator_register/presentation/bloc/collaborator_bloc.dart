import 'package:appweb/app/modules/collaborator/presentation/bloc/collaborator_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/city_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/state_model.dart';
import 'package:appweb/app/modules/collaborator_register/domain/entity/collaborator_entity.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_cep_usecase.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_citys.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_line_business.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_states.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_get_usecase.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_register_usecase.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_event.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_state.dart';
import 'package:appweb/app/modules/line_business_register/data/model/line_business_model.dart';
import 'package:bloc/bloc.dart';

class CollaboratorRegisterBloc
    extends Bloc<CollaboratorEvent, CollaboratorState> {
  final CollaboratorRegisterSave save;
  final CollaboratorRegisterGet get;
  final CollaboratorGetCep cep;
  final CollaboratorGetStates getStates;
  final CollaboratorGetCity getCity;
  final CollaboratorGetLineBusiness getLineBusiness;
  CollaboratorEntity entity = CollaboratorModel();
  List<StateModel> states = [];
  List<CityModel> citys = [];
  List<LineBusinessModel> lineBusiness = [];

  CollaboratorRegisterBloc(
      {required this.save,
      required this.get,
      required this.cep,
      required this.getStates,
      required this.getCity,
      required this.getLineBusiness})
      : super(CollaboratorInitialState()) {
    //Busca instituicao [id está mockado]
    getCollaborator();

    //Salva uma nova instituicao
    saveCollaborator();

    //Busca CEP
    searchCEP();

    //Busca Estados
    getState();

    //Busca Cidades
    getCitys();

    //Volta para tela após escolha de cidade/estado/cargo
    on<CollaboratorReturnEvent>((event, emit) =>
        emit(CollaboratorReturnedState(returnTo: event.screenIndex)));

    //Procura Estado
    searchEventStates();

    //Procura Estado
    searchEventCitys();

    //Busca todos os cargos
    getAllLineBusiness();

    //Procura cargo
    searchEventLineBusiness();

    //Tela em estado de carregamento
    loading();
  }

  getCollaborator() {
    on<CollaboratorGetEvent>((event, emit) async {
      emit(CollaboratorLoadingState());

      final response = await get.call(ParamsGet(id: event.collaboratorId));

      response.fold((l) => emit(const CollaboratorGetErrorState("")), (r) {
        String lineBusiness = entity.entity!.nameLineBussiness;
        entity = r;
        entity.entity!.nameLineBussiness = lineBusiness;
        emit(CollaboratorGetSuccesseState());
      });
    });
  }

  saveCollaborator() {
    on<CollaboratorSaveEvent>((event, emit) async {
      emit(CollaboratorLoadingState());
      CollaboratorModel model = CollaboratorModel.fromEntity(entity);
      model.entity!.id = model.id;
      model.person!.id = model.id;
      model.address!.id = model.id;
      model.phone!.id = model.id;
      final response =
          await save.call(Params(model: model));

      response.fold((l) => emit(const CollaboratorPostErrorState("")),
          (r) => emit(CollaboratorPostSuccessState()));
    });
  }

  searchCEP() {
    on<CollaboratorCepEvent>((event, emit) async {
      emit(CollaboratorLoadingState());

      final response = await cep.call(ParamsCep(cep: event.cep));

      response.fold((l) => emit(const CollaboratorCepErrorState("")), (r) {
        entity.address!.zipCode =
            r.zipCode.replaceAll("-", "").replaceAll(".", "");
        entity.address!.street = r.street;
        entity.address!.complement = r.complement;
        entity.address!.neighborhood = r.neighborhood;
        entity.address!.stateName = r.stateName;
        entity.address!.cityName = r.cityName;
        emit(CollaboratorLoadedState());
      });
    });
  }

  getState() {
    on<CollaboratorGetStatesEvent>((event, emit) async {
      emit(CollaboratorLoadingState());

      final response = await getStates.call(ParamsGetStates());

      response.fold((l) => emit(const CollaboratorGetStatesErrorState("")),
          (r) {
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

  getAllLineBusiness() {
    on<CollaboratorGetLineBusinessEvent>((event, emit) async {
      emit(CollaboratorLoadingState());

      final response = await getLineBusiness
          .call(ParamLineBusiness(institution: event.institution));

      response.fold(
          (l) => emit(const CollaboratorGetLineBusinessErrorState(
              "Erro ao buscar Cargos")), (r) {
        lineBusiness = r;
        emit(CollaboratorGetLineBusinessSuccessState(lineBusiness: r));
      });
    });
  }

  searchEventLineBusiness() {
    on<SearchLineBusinessEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var lineBusinesstSearched = lineBusiness.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (lineBusinesstSearched.isEmpty) {}
        emit(CollaboratorGetLineBusinessSuccessState(lineBusiness: lineBusinesstSearched));
      } else {
        emit(CollaboratorGetLineBusinessSuccessState(lineBusiness: lineBusiness));
      }
    });
  }

  loading() {
    on<CollaboratorLoadingEvent>((event, emit) async {
      emit(CollaboratorLoadingState());
    });
  }
}
