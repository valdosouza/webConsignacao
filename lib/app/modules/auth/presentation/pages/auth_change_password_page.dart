import 'dart:convert';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/auth/data/model/auth_change_password_model.dart';
import 'package:appweb/app/modules/auth/presentation/bloc/auth_bloc.dart';
import 'package:appweb/app/modules/auth/presentation/bloc/auth_event.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthChangePasswordPage extends StatefulWidget {
  const AuthChangePasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthChangePasswordPage> createState() => _AuthChangePasswordPageState();
}

class _AuthChangePasswordPageState extends State<AuthChangePasswordPage> {
  String code = "";
  String password = "";
  String confirmPassword = "";
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  late final AuthBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is AuthChangeErrorState) {
          CustomToast.showToast(
              "Ops...Ocorreu um erro na alteração da senha. Tente novamente mais tarde.");
        } else if (state is AuthChangeSuccessState) {
          CustomToast.showToast("Senha alterada com sucesso.");
        }
      },
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Alterar senha"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: SizedBox(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "images/logomarca.png",
                      width: 250,
                      height: 140,
                    ),
                    const SizedBox(height: 15.0),
                    Text(
                      'Verifique o código que foi enviado via email',
                      textAlign: TextAlign.center,
                      style: kLabelStyle.copyWith(color: Colors.red),
                    ),
                    const SizedBox(height: 30.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Código',
                          style: kLabelStyle,
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: kBoxDecorationStyle,
                          child: TextFormField(
                            //keyboardType: TextInputType.emailAddress,
                            //obscureText: !passwordVisible,
                            autofocus: true,
                            onChanged: (value) {
                              code = value;
                            },
                            textInputAction: TextInputAction.done,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              hintText: 'Digite o código recebido no seu email',
                              hintStyle: kHintTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nova Senha',
                          style: kLabelStyle,
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: kBoxDecorationStyle,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            obscureText: !passwordVisible,
                            autofocus: true,
                            onChanged: (value) {
                              password = value;
                            },
                            textInputAction: TextInputAction.done,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(top: 14.0),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                icon: Icon(
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: 'Digite uma nova senha',
                              hintStyle: kHintTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Confirma Senha',
                          style: kLabelStyle,
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: kBoxDecorationStyle,
                          child: TextFormField(
                            obscureText: !confirmPasswordVisible,
                            keyboardType: TextInputType.emailAddress,
                            autofocus: true,
                            onChanged: (value) {
                              confirmPassword = value;
                            },
                            textInputAction: TextInputAction.done,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(top: 14.0),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  setState(() {
                                    confirmPasswordVisible =
                                        !confirmPasswordVisible;
                                  });
                                },
                                icon: Icon(
                                  confirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: 'Confirme sua senha',
                              hintStyle: kHintTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 60),
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        onPressed: state is AuthChangeSuccessState
                            ? null
                            : () {
                                if (password.isEmpty) {
                                  CustomToast.showToast(
                                      "Necessário informar uma senha.");
                                } else if (confirmPassword.isEmpty) {
                                  CustomToast.showToast(
                                      "Necessário confirmar sua senha.");
                                } else if (password != confirmPassword) {
                                  CustomToast.showToast(
                                      "As senhas devem ser iguais.");
                                } else if (code.isEmpty) {
                                  CustomToast.showToast(
                                      "Necessário informar o código recebido via email.");
                                } else {
                                  bloc.add(AuthChangeEvent(
                                    model: AuthChangePasswordModel(
                                      userId: bloc.recoveryModel.user,
                                      salt: code,
                                      newPassword: md5
                                          .convert(utf8.encode(password))
                                          .toString(),
                                    ),
                                  ));
                                }
                              },
                        child: const Text(
                          'Enviar',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 60),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        onPressed: () {
                          Modular.to.pop();
                          Modular.to.pop();
                        },
                        child: const Text(
                          'Voltar para área de login',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
