import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_bloc.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_event.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_state.dart';
import 'package:appweb/app/modules/user_register/presentation/pages/user_interation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopUserRegister extends StatefulWidget {
  const ContentDesktopUserRegister({super.key});

  @override
  State<ContentDesktopUserRegister> createState() =>
      _ContentDesktopUserRegisterState();
}

class _ContentDesktopUserRegisterState
    extends State<ContentDesktopUserRegister> {
  late final UserRegisterBloc bloc;

  @override
  void initState() {
    bloc = Modular.get<UserRegisterBloc>();
    bloc.add(UserRegisterGetListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserRegisterBloc, UserRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is UserRegisterErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os usuários. Tente novamente mais tarde.");
        } else if (state is UserRegisterSuccessState) {
          CustomToast.showToast("Usuário adicionado com sucesso.");
        } else if (state is UserRegisterAddErrorState) {
          CustomToast.showToast(
              "Erro ao adicionar o usuário. Tente novamente mais tarde.");
        } else if (state is UserRegisterEditSuccessState) {
          CustomToast.showToast("Usuário editado com sucesso.");
        } else if (state is UserRegisterEditErrorState) {
          CustomToast.showToast(
              "Erro ao editar o usuário. Tente novamente mais tarde.");
        } else if (state is UserRegisterDeleteSuccessState) {
          CustomToast.showToast("Usuário removido com sucesso.");
        } else if (state is UserRegisterDeleteErrorState) {
          CustomToast.showToast(
              "Erro ao remover o usuário. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is UserRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserRegisterInfoPageState) {
          return UserInteractionPage(
            user: state.model,
          );
        }
        final users = state.users;
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: kBoxDecorationflexibleSpace,
            ),
            title: const Text('Lista de usuários'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  bloc.add(UserRegisterInfoEvent());
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildSearchInput(),
                  const SizedBox(height: 30.0),
                  Expanded(
                    child: users.isEmpty
                        ? const Center(
                            child: Text(
                                "Não encontramos nenhum usuário em nossa base."))
                        : ListView.separated(
                            itemCount: users.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                bloc.add(
                                    UserRegisterInfoEvent(model: users[index]));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Text((index + 1).toString()),
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(users[index].nick),
                                    Text(users[index].email),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    // bloc.add(UserRegisterDeleteEvent(
                                    //     id: users[index].id!));
                                    CustomToast.showToast(
                                        "Funcionalidade em desenvolvimento.");
                                  },
                                ),
                              ),
                            ),
                            separatorBuilder: (_, __) => const Divider(),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container _buildSearchInput() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: true,
        onChanged: (value) {
          bloc.add(UserRegisterSearchEvent(search: value));
        },
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: "Pesquise por nome ou email",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
