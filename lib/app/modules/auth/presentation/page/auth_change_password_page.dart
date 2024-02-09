import 'dart:convert';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/core/shared/widgets/logo_area.dart';
import 'package:appweb/app/modules/auth/auth_module.dart';
import 'package:appweb/app/modules/auth/data/model/auth_change_password_model.dart';
import 'package:appweb/app/modules/auth/presentation/bloc/auth_bloc.dart';
import 'package:appweb/app/modules/auth/presentation/bloc/auth_event.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthChangePasswordPage extends StatefulWidget {
  const AuthChangePasswordPage({
    super.key,
  });

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
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AuthModule>();
    });
    bloc = Modular.get<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is AuthChangeErrorState) {
          CustomToast.showToast(
              "Ops...Erro na alteração da senha. Tente novamente mais tarde.");
        } else if (state is AuthChangeSuccessState) {
          CustomToast.showToast("Senha alterada com sucesso.");
        }
      },
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: kBoxDecorationflexibleSpace,
            ),
            title: const AutoSizeText(
              "Alterar senha",
              style: kTitleAppBarStyle,
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Center(
                child: SizedBox(
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      logoArea(),
                      const SizedBox(height: 15.0),
                      _buildMsgCode(),
                      const SizedBox(height: 20.0),
                      _buildCode(),
                      const SizedBox(height: 20.0),
                      _buildNewPassword(),
                      const SizedBox(height: 20.0),
                      _buildConfirmNewPassword(),
                      const SizedBox(height: 20.0),
                      _buildChangePasswordBtn(state),
                      const SizedBox(height: 20.0),
                      _buildBackBtn(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _buildMsgCode() {
    return Text(
      'Verifique o código que foi enviado via email',
      textAlign: TextAlign.center,
      style: kLabelStyle.copyWith(color: Colors.red),
    );
  }

  _buildCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Código',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            //keyboardType: TextInputType.emailAddress,
            //obscureText: !passwordVisible,
            autofocus: false,
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
              hintText: 'Digite o código recebido',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  _buildNewPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nova Senha',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            obscureText: !passwordVisible,
            autofocus: false,
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
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
              hintText: 'Digite uma nova senha',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  _buildConfirmNewPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Confirma Senha',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            obscureText: !confirmPasswordVisible,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
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
                    confirmPasswordVisible = !confirmPasswordVisible;
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
    );
  }

  _buildChangePasswordBtn(AuthState state) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 60),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        onPressed: () {
          if (password.isEmpty) {
            CustomToast.showToast("Necessário informar uma senha.");
          } else if (confirmPassword.isEmpty) {
            CustomToast.showToast("Necessário confirmar sua senha.");
          } else if (password != confirmPassword) {
            CustomToast.showToast("As senhas devem ser iguais.");
          } else if (code.isEmpty) {
            CustomToast.showToast(
                "Necessário informar o código recebido via email.");
          } else {
            bloc.add(AuthChangeEvent(
              model: AuthChangePasswordModel(
                tbUserId: bloc.recoveryModel.tbUserId,
                salt: code,
                newPassword: md5.convert(utf8.encode(password)).toString(),
              ),
            ));
          }
        },
        child: const Text(
          'Confirmar',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  _buildBackBtn() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 60),
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
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
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
