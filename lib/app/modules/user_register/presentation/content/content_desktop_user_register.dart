import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/user_register/domain/usecase/user_register_getlist.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_bloc.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_event.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_state.dart';
import 'package:appweb/app/modules/user_register/presentation/page/user_interation_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
  bool selectActive = true;
  @override
  void initState() {
    bloc = Modular.get<UserRegisterBloc>();
    bloc.add(UserRegisterGetListEvent(
        params: ParamsGetUser(name: "", email: "", active: "S")));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserRegisterBloc, UserRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is UserRegisterErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados. Tente novamente mais tarde.");
        } else if (state is UserRegisterSuccessState) {
          CustomToast.showToast("Cadastro atualizado com sucesso.");
        } else if (state is UserRegisterAddErrorState) {
          CustomToast.showToast(
              "Erro ao atualizar o cadastro. Tente novamente mais tarde.");
        } else if (state is UserRegisterEditSuccessState) {
          CustomToast.showToast("Cadastro atualizado com sucesso.");
        } else if (state is UserRegisterEditErrorState) {
          CustomToast.showToast(
              "Erro ao atualizar o cadastro. Tente novamente mais tarde.");
        } else if (state is UserRegisterDeleteSuccessState) {
          CustomToast.showToast("Cadastro removido com sucesso.");
        } else if (state is UserRegisterDeleteErrorState) {
          CustomToast.showToast(
              "Erro ao remover o cadastro. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is UserRegisterLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        } else if (state is UserRegisterInfoPageState) {
          return const UserInteractionPage();
        }
        final users = state.users;
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: kBoxDecorationflexibleSpace,
            ),
            title: const AutoSizeText(
              'Lista de usuários',
              style: kTitleAppBarStyle,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add, color: kSecondaryColor),
                onPressed: () {
                  bloc.add(UserRegisterAddEvent());
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
                                "Não encontramos nenhum registro em nossa base."))
                        : ListView.separated(
                            itemCount: users.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                bloc.add(
                                    UserRegisterInfoEvent(model: users[index]));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: (Colors.black),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Text(
                                      (index + 1).toString(),
                                      style: kCircleAvatarTextStyle,
                                    ),
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
                                  icon: const Icon(Icons.remove,
                                      color: kSecondaryColor),
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

  Padding _fieldUserName() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CustomInput(
        title: 'Nome do Usuário',
        keyboardType: TextInputType.text,
        inputAction: TextInputAction.next,
        onChanged: null,
      ),
    );
  }

  Padding _fieldUserEmail() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CustomInput(
        keyboardType: TextInputType.emailAddress,
        inputAction: TextInputAction.next,
        onChanged: null,
        title: "email",
      ),
    );
  }

  Padding _fieldActive() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Ativo",
            style: kLabelStyle,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10.0),
          _fieldActiveYes(),
          _fieldActiveNo(),
        ],
      ),
    );
  }

  SizedBox _fieldActiveYes() {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          Radio(
            value: true,
            groupValue: selectActive,
            activeColor: Colors.red,
            onChanged: selectActive
                ? (value) {}
                : (value) {
                    setState(() {
                      selectActive = true;
                    });
                    bloc.searchAtivo = "S";
                  },
          ),
          const SizedBox(width: 5.0),
          const Text("Sim", style: kLabelStyle),
        ],
      ),
    );
  }

  SizedBox _fieldActiveNo() {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          Radio(
              value: false,
              groupValue: selectActive,
              activeColor: Colors.red,
              onChanged: selectActive
                  ? (value) {
                      setState(() {
                        selectActive = false;
                      });
                      bloc.searchAtivo = "N";
                    }
                  : (value) {}),
          const SizedBox(width: 5.0),
          const Text("Não", style: kLabelStyle),
        ],
      ),
    );
  }

  Align _buildButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        hoverColor: Colors.transparent,
        onPressed: () {
          bloc.add(UserRegisterGetListEvent(
            params: ParamsGetUser(
              name: bloc.searchName,
              email: bloc.searchEmail,
              active: bloc.searchAtivo,
            ),
          ));
        },
        icon: const Icon(
          Icons.search,
          size: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Container _buildSearchInput() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: Row(
        children: [
          Expanded(
            flex: 50,
            child: _fieldUserName(),
          ),
          Expanded(
            flex: 50,
            child: _fieldUserEmail(),
          ),
          Expanded(
            flex: 15,
            child: _fieldActive(),
          ),
          Expanded(
            flex: 10,
            child: _buildButton(),
          )
        ],
      ),
    );
  }
}
