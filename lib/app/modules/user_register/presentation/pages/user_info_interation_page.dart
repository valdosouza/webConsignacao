import 'dart:convert';

import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_bloc.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_event.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserInfoInterationPage extends StatefulWidget {
  final UserRegisterModel? user;
  const UserInfoInterationPage({
    super.key,
    this.user,
  });

  @override
  State<UserInfoInterationPage> createState() => _UserInfoInterationPageState();
}

class _UserInfoInterationPageState extends State<UserInfoInterationPage> {
  late final UserRegisterBloc bloc;
  UserRegisterModel? user;
  final _formKey = GlobalKey<FormState>();

  String nick = "";
  String email = "";
  String password = "";
  String active = "";

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
              : Text('Editar ${user!.nick}'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              bloc.add(UserRegisterGetListEvent());
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    user != null
                        ? bloc.add(UserRegisterEditEvent(id: user!.id))
                        : bloc.add(UserRegisterAddEvent(
                            model: UserRegisterModel(
                            id: 2,
                            tbInstitutionId: 1,
                            nick: nick,
                            email: email,
                            password:
                                md5.convert(utf8.encode(password)).toString(),
                            active: active,
                            kind: "sistema",
                            tbDeviceId: 0,
                          )));
                  }
                },
              ),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInput(
                  title: 'Nome',
                  initialValue: user?.nick ?? "",
                  validator: (value) => Validators.validateRequired(value),
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
                  validator: (value) => Validators.validateRequired(value),
                  initialValue: user?.email ?? "",
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  onChanged: (value) {
                    user?.email = value;
                    email = value;
                  },
                ),
                const SizedBox(height: 30.0),
                if (user == null)
                  CustomInput(
                    title: 'Senha',
                    validator: (value) => Validators.validateRequired(value),
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
      ),
    );
  }
}
