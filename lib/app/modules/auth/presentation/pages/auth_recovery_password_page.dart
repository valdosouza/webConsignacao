import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/auth/presentation/bloc/auth_bloc.dart';
import 'package:appweb/app/modules/auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthRecoveryPasswordPage extends StatefulWidget {
  const AuthRecoveryPasswordPage({Key? key}) : super(key: key);

  @override
  State<AuthRecoveryPasswordPage> createState() =>
      _AuthRecoveryPasswordPageState();
}

class _AuthRecoveryPasswordPageState extends State<AuthRecoveryPasswordPage> {
  String email = "";
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
        if (state is AuthRecoveryErrorState) {
          CustomToast.showToast(
              "Ops...Ocorreu um erro ao enviar o email. Tente novamente mais tarde");
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
            title: const Text("Esqueci minha senha"),
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
                    const SizedBox(height: 30.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: kLabelStyle,
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: kBoxDecorationStyle,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autofocus: true,
                            onChanged: (value) {
                              email = value;
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
                              hintText: 'Digite teu e-mail',
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
                        onPressed: state is AuthRecoverySuccessState
                            ? null
                            : () {
                                if (email.isEmpty) {
                                  CustomToast.showToast(
                                      "Necessário informar um email para envio do link.");
                                } else {
                                  bloc.add(AuthRecoveryEvent(email: email));
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
                    if (state is AuthRecoverySuccessState)
                      const SizedBox(height: 30.0),
                    if (state is AuthRecoverySuccessState)
                      Text(
                        'Por favor, acesse seu email e utilize o link enviado para efetuar a troca da senha',
                        textAlign: TextAlign.center,
                        style: kLabelStyle.copyWith(color: Colors.red),
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
