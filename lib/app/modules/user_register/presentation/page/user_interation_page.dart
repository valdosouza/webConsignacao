import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_bloc.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_event.dart';
import 'package:appweb/app/modules/user_register/user_register_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserInteractionPage extends StatefulWidget {
  const UserInteractionPage({
    super.key,
  });

  @override
  State<UserInteractionPage> createState() => _UserInteractionPageState();
}

class _UserInteractionPageState extends State<UserInteractionPage> {
  late final UserRegisterBloc bloc;

  final _formKey = GlobalKey<FormState>();

  bool selectRadio = false;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<UserRegisterBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<UserRegisterModule>();
    });
    selectRadio = (bloc.user.active == "S");
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        bloc.add(UserRegisterGetListEvent());
      },
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: kBoxDecorationflexibleSpace,
          ),
          title: bloc.user.id == 0
              ? const Text('Adicionar usuário')
              : Text('Editar ${bloc.user.nick}'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined,
                color: kSecondaryColor),
            onPressed: () {
              bloc.add(UserRegisterGetListEvent());
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.check, color: kSecondaryColor),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    (bloc.user.id > 0)
                        ? bloc.add(UserRegisterPutEvent(model: bloc.user))
                        : bloc.add(UserRegisterPostEvent(model: bloc.user));
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
                  initialValue: bloc.user.nick,
                  validator: (value) => Validators.validateRequired(value),
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  onChanged: (value) {
                    bloc.user.nick = value;
                  },
                ),
                const SizedBox(height: 30.0),
                CustomInput(
                  title: 'Email',
                  validator: (value) => Validators.validateRequired(value),
                  initialValue: bloc.user.email,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  onChanged: (value) {
                    bloc.user.email = value;
                  },
                ),
                if (bloc.user.id == 0) const SizedBox(height: 30.0),
                if (bloc.user.id == 0)
                  CustomInput(
                    title: 'Senha',
                    validator: (value) => Validators.validateRequired(value),
                    initialValue: bloc.user.password,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    maxLines: 1,
                    obscureText: true,
                    onChanged: (value) {
                      bloc.user.password = value;
                    },
                  ),
                const SizedBox(height: 30.0),
                const Text("Ativo", style: kLabelStyle),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: true,
                          groupValue: selectRadio,
                          activeColor: Colors.red,
                          onChanged: selectRadio
                              ? (value) {}
                              : (value) {
                                  setState(() {
                                    selectRadio = true;
                                  });
                                  bloc.user.active = "S";
                                },
                        ),
                        const SizedBox(width: 5.0),
                        const Text("Sim", style: kLabelStyle),
                      ],
                    ),
                    const SizedBox(width: 10.0),
                    Row(
                      children: [
                        Radio(
                            value: false,
                            groupValue: selectRadio,
                            activeColor: Colors.red,
                            onChanged: selectRadio
                                ? (value) {
                                    setState(() {
                                      selectRadio = false;
                                    });
                                    bloc.user.active = "N";
                                  }
                                : (value) {}),
                        const SizedBox(width: 5.0),
                        const Text("Não", style: kLabelStyle),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
