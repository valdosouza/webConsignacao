import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_bloc.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserInfoPage extends StatefulWidget {
  final UserRegisterModel? user;
  const UserInfoPage({
    super.key,
    this.user,
  });

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  late final UserRegisterBloc bloc;
  UserRegisterModel? user;

  String nick = "";
  String email = "";
  String password = "";
  String kind = "";

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<UserRegisterBloc>();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bloc.add(UserRegisterGetListEvent());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: user == null
              ? const Text('Adicionar usuário')
              : Text('Editar ${user!.nick ?? "usuário"}'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              bloc.add(UserRegisterGetListEvent());
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: user != null
                  ? IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () {
                        bloc.add(UserRegisterEditEvent(id: user!.id!));
                      },
                    )
                  : IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () {
                        bloc.add(
                          UserRegisterAddEvent(
                            model: UserRegisterModel(
                              id: 2,
                              institution: 1,
                              nick: nick,
                              email: email,
                              password: password,
                              kind: kind,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInput(
                title: 'Nome',
                initialValue: user?.nick ?? "",
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  user?.nick = value;
                  nick = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Email',
                initialValue: user?.email ?? "",
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  user?.email = value;
                  email = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Tipo',
                initialValue: user?.kind ?? "",
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  user?.kind = value;
                  kind = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Senha',
                initialValue: user?.password ?? "",
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.done,
                obscureText: true,
                onChanged: (value) {
                  user?.password = value;
                  password = value;
                },
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}