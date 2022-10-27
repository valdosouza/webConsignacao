import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/auth/presentation/bloc/auth_bloc.dart';
import 'package:appweb/app/modules/auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

// ignore: must_be_immutable
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final AuthBloc bloc;
  TextEditingController loginController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => bloc,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 241, 97, 97),
                    Color.fromARGB(255, 224, 71, 71),
                    Color.fromARGB(255, 229, 57, 57),
                  ],
                  //stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 400,
                child: _buildForm(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is AuthErrorState) {
          const String errorMsg = "Login ou senha inválidos";
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(errorMsg),
            ),
          );
        }

        if (state is AuthSuccessState) {
          Modular.to.popAndPushNamed('/home/');
        }
      },
      builder: (context, state) {
        return Form(
          key: _form,
          child: SingleChildScrollView(
            //physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              //vertical: 120.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/logomarca.png",
                  width: 250,
                  height: 140,
                ),
                if (state is AuthLoadingState)
                  const CircularProgressIndicator(),
                const SizedBox(height: 30.0),
                _buildEmail(),
                _buildPassword(),
                _buildRememberMeCheckbox(),
                const SizedBox(height: 20.0),
                _buildForgetPassword(),
                _buildLoginBtn(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            controller: loginController,
            keyboardType: TextInputType.emailAddress,
            autofocus: true,
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
    );
  }

  Widget _buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        const Text(
          'Senha',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            obscureText: true,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Digite tua senha',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Row(
      children: <Widget>[
        Checkbox(
          value: false,
          checkColor: Colors.green,
          activeColor: Colors.white,
          onChanged: (value) {},
        ),
        const Text(
          'Manter conectado',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildForgetPassword() {
    return TextButton(
      onPressed: () {
        ///Rota para alteracao de senha com passagem de queryParameters na url
        // Modular.to.pushNamed('/auth/change-password?userId=1&salt=2');
        Modular.to.pushNamed('/auth/recovery-password');
      },
      child: const Text(
        'Esqueci minha senha',
        style: kLabelStyle,
      ),
    );
  }

  Widget _buildLoginBtn(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 60),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        onPressed: () {
          bloc.add(AuthLoginEvent(
              login: loginController.text, password: passwordController.text));
        },
        child: const Text(
          'LOGIN',
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
}
