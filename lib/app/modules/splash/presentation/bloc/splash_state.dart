abstract class SplashState {}

class SplashInitState extends SplashState {
  final bool logged;

  SplashInitState({this.logged = false});
}

class SplashLoggedState extends SplashState {
  final bool logged;

  SplashLoggedState({this.logged = false});
}
