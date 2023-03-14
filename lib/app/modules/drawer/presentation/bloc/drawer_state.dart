abstract class DrawerState {}

class DrawerInitState extends DrawerState {}

class DrawerLogoutState extends DrawerState {
  final bool logged;

  DrawerLogoutState({required this.logged});
}

class LoadingState extends DrawerState {}

class GetErrorState extends DrawerState {
  final String error;
  GetErrorState({
    required this.error,
  });
}

class GetSucessState extends DrawerState {}

class DrawerCashierStatusState extends DrawerState {
  final String msg;
  DrawerCashierStatusState({required this.msg});
}
