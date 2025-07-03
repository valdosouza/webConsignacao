import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cep.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_citys.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cnpj.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_states.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
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
  final GetCep cep;
  final GetCnpj cnpj;
  final GetStates getStates;
  final GetCities getCity;
  InstitutionModel institution = InstitutionModel.empty();
  List<StateModel> states = [];
  List<CityModel> cities = [];

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

  void getInstitution() {
    on<InstitutionGetEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response = await get.call(const ParamsGet());

      response.fold((l) => emit(const InstitutionGetErrorState("")), (r) {
        institution = r;
        emit(InstitutionLoadedState());
      });
    });
  }

  void saveInstitution() {
    on<InstitutionSaveEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response =
          await save.call(ParamsPostInstitution(model: event.model));

      response.fold((l) => emit(const InstitutionGetErrorState("")),
          (r) => emit(InstitutionPostSuccessState()));
    });
  }

  void putInstitution() {
    on<InstitutionPutEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response = await put.call(ParamsPut(model: event.model));

      response.fold((l) => emit(const InstitutionPutErrorState("")),
          (r) => emit(InstitutionPutSuccessState()));
    });
  }

  void searchCEP() {
    on<InstitutionCepEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response = await cnpj.call(ParamsCnpj(cnpj: event.cep));

      response.fold((l) => emit(const InstitutionCepErrorState("")), (r) {
        institution.zipCode = r.zipCode.replaceAll("-", "").replaceAll(".", "");
        institution.zipCode = r.zipCode.replaceAll("-", "");
        institution.street = r.street;
        institution.complement = r.complement;
        institution.neighborhood = r.neighborhood;
        institution.stateName = r.stateName;
        institution.tbStateId = r.tbStateId;
        institution.cityName = r.cityName;
        institution.tbCityId = r.tbCityId;
        emit(InstitutionLoadedState());
      });
    });
  }

  void searchCNPJ() {
    on<InstitutionCnpjEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response = await cnpj.call(ParamsCnpj(cnpj: event.cnpj));

      response.fold((l) => emit(const InstitutionCnpjErrorState("")), (r) {
        institution.zipCode = r.zipCode.replaceAll("-", "").replaceAll(".", "");
        institution.nickTrade = r.nickTtrade;
        institution.cnpj = r.cnpj;
        institution.nameCompany = r.nameCompany;
        institution.nmbr = r.nmbr;
        institution.street = r.street;
        institution.complement = r.complement;
        institution.neighborhood = r.neighborhood;
        institution.cityName = r.cityName;
        institution.tbCityId = r.tbCityId;
        institution.stateName = r.stateName;
        institution.tbStateId = r.tbStateId;
        emit(InstitutionLoadedState());
      });
    });
  }

  void getState() {
    on<InstitutionGetStatesEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response = await getStates.call(ParamsGetStates());

      response.fold((l) => emit(const InstitutionGetStatesErrorState("")), (r) {
        states = r;
        emit(InstitutionGetStatesSuccessState(states: r));
      });
    });
  }

  void getCitys() {
    on<InstitutionGetCitiesEvent>((event, emit) async {
      emit(InstitutionLoadingState());

      final response =
          await getCity.call(ParamsGetCity(tbStateId: event.tbStateId));

      response.fold((l) => emit(const InstitutionGetCityErrorState("")), (r) {
        cities = r;
        emit(InstitutionGetCitySuccessState(cities: r));
      });
    });
  }

  void searchEventStates() {
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

  void searchEventCitys() {
    on<SearchCityEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var citiestSearched = cities.where((element) {
          String name = element.name;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (citiestSearched.isEmpty) {}
        emit(InstitutionGetCitySuccessState(cities: citiestSearched));
      } else {
        emit(InstitutionGetCitySuccessState(cities: cities));
      }
    });
  }
}
