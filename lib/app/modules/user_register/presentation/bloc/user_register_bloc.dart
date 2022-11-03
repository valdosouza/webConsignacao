import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';
import 'package:appweb/app/modules/user_register/domain/usecase/user_register_post.dart';
import 'package:appweb/app/modules/user_register/domain/usecase/user_register_delete.dart';
import 'package:appweb/app/modules/user_register/domain/usecase/user_register_put.dart';
import 'package:appweb/app/modules/user_register/domain/usecase/user_register_getlist.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_event.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_state.dart';
import 'package:bloc/bloc.dart';

class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  final UserRegisterGetlist getlist;
  final UserRegisterAdd addUser;
  final UserRegisterEdit edit;
  final UserRegisterDelete delete;

  List<UserRegisterModel> users = [];

  UserRegisterBloc({
    required this.getlist,
    required this.addUser,
    required this.edit,
    required this.delete,
  }) : super(UserRegisterLoadingState()) {
    getList();

    searchUser();

    goToUserInfoPage();

    addUserFunction();

    editUser();

    deleteUser();
  }

  getList() async {
    on<UserRegisterGetListEvent>((event, emit) async {
      UserRegisterLoadingState();
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
  }

  searchUser() {
    on<UserRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var usersSearchedName = users.where((element) {
          String name = element.nick;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        var usersSearchedEmail = users.where((element) {
          String email = element.email;
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

  goToUserInfoPage() {
    on<UserRegisterInfoEvent>((event, emit) async {
      emit(UserRegisterInfoPageState(users: users, model: event.model));
    });
  }

  addUserFunction() {
    on<UserRegisterAddEvent>((event, emit) async {
      UserRegisterLoadingState();
      var response = await addUser.call(ParamsAddUser(user: event.model));

      var result = response.fold(
        (l) => UserRegisterAddErrorState(users: users),
        (r) {
          users.add(r);
          return UserRegisterSuccessState(users: users);
        },
      );
      emit(result);
    });
  }

  editUser() {
    on<UserRegisterEditEvent>((event, emit) async {
      UserRegisterLoadingState();
      var response = await edit.call(ParamsEditUser(id: event.id));
      var result = response.fold(
        (l) => UserRegisterEditErrorState(users: users),
        (r) {
          return UserRegisterEditSuccessState(users: users);
        },
      );
      emit(result);
    });
  }

  deleteUser() {
    on<UserRegisterDeleteEvent>((event, emit) async {
      UserRegisterLoadingState();
      var response = await delete.call(ParamsDeleteUser(id: event.id));
      var result = response.fold(
        (l) => UserRegisterDeleteErrorState(users: users),
        (r) {
          return UserRegisterDeleteSuccessState(users: users);
        },
      );
      emit(result);
    });
  }
}
