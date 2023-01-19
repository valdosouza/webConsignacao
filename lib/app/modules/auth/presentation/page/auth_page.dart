import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/degrade_area.dart';
import 'package:appweb/app/core/shared/widgets/logo_area.dart';
import 'package:appweb/app/modules/auth/presentation/bloc/auth_bloc.dart';
import 'package:appweb/app/modules/auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  bool confirmPasswordVisible = false;
  TextEditingController loginController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<AuthBloc>();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) async {
        final keepConnected = await LocalStorageService.instance
            .get(key: LocalStorageKey.keepConnected, defaultValue: false);
        bloc.setKeepConnected = keepConnected == 'true';
        if (keepConnected == 'true') {
          bloc.add(AuthCheckKeepConnectedEvent());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => bloc,
        child: Stack(
          children: <Widget>[
            degradeArea(),
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }

        if (state is AuthSuccessState ||
            state is AuthCheckKeepConnectedSuccessState) {
          Modular.to.navigate('/home/');
        }
      },
      builder: (context, state) {
        return Form(
          key: _form,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                logoArea(),
                if (state is AuthLoadingState)
                  const CircularProgressIndicator(),
                const SizedBox(height: 10.0),
                _buildEmail(),
                const SizedBox(height: 10.0),
                _buildPassword(),
                _buildRememberMeCheckbox(),
                _buildForgetPassword(),
                const SizedBox(height: 10.0),
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
            autofocus: false,
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
      children: [
        const Text(
          'Senha',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            obscureText: !confirmPasswordVisible,
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            autofocus: false,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(
                Icons.lock,
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
              hintText: 'Digite sua senha',
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
          value: bloc.keepConnected,
          checkColor: Colors.green,
          activeColor: Colors.white,
          onChanged: (value) {
            setState(
              () {
                bloc.setKeepConnected = value ?? false;
                LocalStorageService.instance.saveItem(
                  key: LocalStorageKey.keepConnected,
                  value: value ?? false,
                );
              },
            );
          },
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
        Modular.to.pushNamed('/auth/recovery-password/');
      },
      child: const Text(
        'Esqueci minha senha',
        style: kLabelStyle,
      ),
    );
  }

  Widget _buildLoginBtn(BuildContext context) {
    return SizedBox(
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
