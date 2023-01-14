import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/data/model/collaborator_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cep.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_citys.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cnpj.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_states.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_register_get.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_register_get_list.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_register_post.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_event.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_state.dart';
import 'package:appweb/app/modules/line_business_register/data/model/linebusiness_model.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/linebusiness_register_getlist.dart';
import 'package:bloc/bloc.dart';

class CollaboratorRegisterBloc
    extends Bloc<CollaboratorRegisterEvent, CollaboratorRegisterState> {
  final CollaboratorRegisterGetlist getlist;
  final GetCep getCep;
  final GetCities getCity;
  final GetCnpj getCnpj;
  final GetStates getStates;
  final CollaboratorRegisterGet getCollaborator;
  final CollaboratorRegisterPost postCollaborator;
  final LinebusinessRegisterGetlist getLinebusines;

  List<CollaboratorListModel> modelList = [];
  CollaboratorMainModel collaborator = CollaboratorMainModel.empty();
  List<StateModel> states = [];
  List<CityModel> cities = [];
  List<LinebusinessModel> linebusiness = [];

  CollaboratorRegisterBloc({
    required this.getlist,
    required this.getCep,
    required this.getCity,
    required this.getCnpj,
    required this.getStates,
    required this.getCollaborator,
    required this.postCollaborator,
    required this.getLinebusines,
  }) : super(CollaboratorRegisterLoadingState()) {
    getList();

    searchCustomer();

    goToCollaboratorInfoPage();

    searchCEP();

    searchCNPJ();

    getState();

    getCitys();

    searchEventStates();

    searchEventCitys();

    postCollaboratorAction();

    getLinebusinessAction();

    on<CollaboratorRegisterReturnEvent>((event, emit) => emit(
        CollaboratorRegisterInfoPageState(
            model: collaborator, modelList: modelList, tabIndex: event.index)));
  }

  getList() {
    on<CollaboratorRegisterGetListEvent>((event, emit) async {
      emit(CollaboratorRegisterLoadingState());

      var response = await getlist.call(ParamsGetListCollaborator());

      var result = response.fold(
          (l) => CollaboratorRegisterErrorState(modelList: modelList), (r) {
        modelList = r;
        return CollaboratorRegisterLoadedState(modelList: r);
      });

      emit(result);
    });
  }

  postCollaboratorAction() {
    on<CollaboratorRegisterPostEvent>((event, emit) async {
      emit(CollaboratorRegisterLoadingState());

      var response = await postCollaborator
          .call(ParamsPostCollaborator(model: event.model));

      response.fold(
          (l) => event.model.collaborator.id != 0
              ? emit(CollaboratorRegisterPostEditErrorState(modelList, ""))
              : emit(CollaboratorRegisterPostAddErrorState(modelList, "")),
          (r) {
        if (event.model.collaborator.id != 0) {
          modelList[modelList.indexWhere((element) => element.id == r.id)] = r;
        } else {
          modelList.add(CollaboratorListModel(
            id: r.id,
            docKind: r.docKind,
            docNumber: r.docNumber,
            nameCompany: r.nameCompany,
            nickTrade: r.nickTrade,
            tbLineBusinessId: r.tbLineBusinessId,
            nameLineBusiness: r.nameLineBusiness,
          ));
        }
        emit(CollaboratorRegisterPostEditSuccessState(modelList));
      });
    });
  }

  searchCustomer() {
    on<CollaboratorRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var collaboratorSearchedName = modelList.where((element) {
          String name = element.nameCompany;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        var collaboratorSearchedCnpj = modelList.where((element) {
          String email = element.docNumber;
          return email
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        var collaboratorSearchedCpf = modelList.where((element) {
          String email = element.docNumber;
          return email
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (collaboratorSearchedName.isNotEmpty) {
          emit(CollaboratorRegisterLoadedState(
              modelList: collaboratorSearchedName));
        } else if (collaboratorSearchedCnpj.isNotEmpty) {
          emit(CollaboratorRegisterLoadedState(
              modelList: collaboratorSearchedCnpj));
        } else {
          emit(CollaboratorRegisterLoadedState(
              modelList: collaboratorSearchedCpf));
        }
      } else {
        emit(CollaboratorRegisterLoadedState(modelList: modelList));
      }
    });
  }

  goToCollaboratorInfoPage() {
    on<CollaboratorRegisterInfoEvent>((event, emit) async {
      if (event.id != null) {
        emit(CollaboratorRegisterLoadingState());

        final response =
            await getCollaborator.call(ParamsGetCollaborator(id: event.id!));

        response.fold(
            (l) =>
                emit(CollaboratorRegisterGetErrorState(modelList: modelList)),
            (r) {
          collaborator = r;
          emit(CollaboratorRegisterInfoPageState(
              modelList: modelList, model: r, tabIndex: 0));
        });
      } else {
        emit(CollaboratorRegisterInfoPageState(
            modelList: modelList, model: collaborator, tabIndex: 0));
      }
    });
  }

  searchCNPJ() {
    on<CollaboratorRegisterCnpjEvent>((event, emit) async {
      emit(CollaboratorRegisterLoadingState());

      final response = await getCnpj.call(ParamsCnpj(cnpj: event.cnpj));

      response.fold(
          (l) => emit(CollaboratorRegisterCnpjErrorState(modelList, "")), (r) {
        collaborator.address.zipCode =
            r.zipCode.replaceAll("-", "").replaceAll(".", "");
        collaborator.entity.nickTrade = r.nickTtrade;
        collaborator.company?.cnpj = r.cnpj;
        collaborator.entity.nameCompany = r.nameCompany;
        collaborator.address.nmbr = r.nmbr;
        collaborator.address.street = r.street;
        collaborator.address.complement = r.complement;
        collaborator.address.neighborhood = r.neighborhood;
        collaborator.address.cityName = r.cityName;
        collaborator.address.tbCityId = r.tbCityId;
        collaborator.address.stateName = r.stateName;
        collaborator.address.tbStateId = r.tbStateId;
        emit(CollaboratorRegisterInfoPageState(
            modelList: modelList, model: collaborator, tabIndex: 0));
      });
    });
  }

  searchCEP() {
    on<CollaboratorRegisterCepEvent>((event, emit) async {
      emit(CollaboratorRegisterLoadingState());

      final response = await getCep.call(ParamsCep(cep: event.cep));

      response.fold(
          (l) => emit(CollaboratorRegisterCepErrorState(modelList, "")), (r) {
        collaborator.address.zipCode = r.zipCode.replaceAll("-", "");
        collaborator.address.street = r.street;
        collaborator.address.complement = r.complement;
        collaborator.address.neighborhood = r.neighborhood;
        collaborator.address.stateName = r.stateName;
        collaborator.address.tbStateId = r.tbStateId;
        collaborator.address.cityName = r.cityName;
        collaborator.address.tbCityId = r.tbCityId;
        emit(CollaboratorRegisterInfoPageState(
            modelList: modelList, model: collaborator, tabIndex: 1));
      });
    });
  }

  getState() {
    on<CollaboratorRegisterGetStatesEvent>((event, emit) async {
      emit(CollaboratorRegisterLoadingState());

      final response = await getStates.call(ParamsGetStates());

      response.fold(
          (l) => emit(CollaboratorRegisterGetStatesErrorState(modelList, "")),
          (r) {
        states = r;
        emit(CollaboratorRegisterGetStatesSuccessState(
            states: r, modelList: modelList));
      });
    });
  }

  getCitys() {
    on<CollaboratorRegisterGetCitysEvent>((event, emit) async {
      emit(CollaboratorRegisterLoadingState());

      final response =
          await getCity.call(ParamsGetCity(tbStateId: event.tbStateId));

      response.fold(
          (l) => emit(CollaboratorRegisterGetCityErrorState(modelList, "")),
          (r) {
        cities = r;
        emit(CollaboratorRegisterGetCitySuccessState(
            cities: r, modelList: modelList));
      });
    });
  }

  searchEventStates() {
    on<CollaboratorRegisterSearchStateEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var statestSearched = states.where((element) {
          String name = element.name;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (statestSearched.isEmpty) {}
        emit(CollaboratorRegisterGetStatesSuccessState(
          states: statestSearched,
          modelList: modelList,
        ));
      } else {
        emit(CollaboratorRegisterGetStatesSuccessState(
            states: states, modelList: modelList));
      }
    });
  }

  searchEventCitys() {
    on<CollaboratorRegisterSearchCityEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var citiestSearched = cities.where((element) {
          String name = element.name;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (citiestSearched.isEmpty) {}
        emit(CollaboratorRegisterGetCitySuccessState(
            cities: citiestSearched, modelList: modelList));
      } else {
        emit(CollaboratorRegisterGetCitySuccessState(
            cities: cities, modelList: modelList));
      }
    });
  }

  getLinebusinessAction() {
    on<CollaboratorRegisterGetLineBusinessEvent>((event, emit) async {
      emit(CollaboratorRegisterLoadingState());

      var response = await getLinebusines.call(ParamsLinebusinessRegisterGet());

      response.fold(
          (l) => emit(CollaboratorRegisterGetLinebusinessErrorState(
              modelList: modelList)), (r) {
        linebusiness = r;
        emit(CollaboratorRegisterGetLinebusinessSuccessState(
            modellist: modelList, linebusiness: r));
      });
    });
  }

  searchLinebusiness() {
    on<CollaboratorRegisterSearchLinebusinessEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var linebusinessSearched = linebusiness.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (linebusinessSearched.isEmpty) {}
        emit(CollaboratorRegisterGetLinebusinessSuccessState(
            modellist: modelList, linebusiness: linebusinessSearched));
      } else {
        emit(CollaboratorRegisterGetLinebusinessSuccessState(
            modellist: modelList, linebusiness: linebusiness));
      }
    });
  }
}
