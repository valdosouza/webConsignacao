import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_state.dart';
import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';
import 'package:appweb/app/modules/user_register/domain/usecase/user_register_add.dart';
import 'package:appweb/app/modules/user_register/domain/usecase/user_register_getlist.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_event.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_state.dart';
import 'package:bloc/bloc.dart';

class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  final UserRegisterGetlist getlist;
  final UserRegisterAdd addUser;

  List<UserRegisterModel> users = [];

  UserRegisterBloc({
    required this.getlist,
    required this.addUser,
  }) : super(UserRegisterLoadingState()) {
    on<UserRegisterGetListEvent>((event, emit) async {
      StockListInitialState();
      var response = await getlist.call(ParamsGetUser(id: 1));
      var result = response.fold(
        (l) => UserRegisterErrorState(),
        (r) {
          users = r;
          return UserRegisterLoadedState(users: r);
        },
      );
      emit(result);
    });

    on<UserRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var usersSearchedName = users.where((element) {
          String name = element.nick ?? "";
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        var usersSearchedEmail = users.where((element) {
          String email = element.email ?? "";
          return email
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (usersSearchedName.isNotEmpty) {
          emit(UserRegisterLoadedState(users: usersSearchedName));
        } else {
          emit(UserRegisterLoadedState(users: usersSearchedEmail));
        }
      } else {
        emit(UserRegisterLoadedState(users: users));
      }
    });
  }
}
