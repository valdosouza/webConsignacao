abstract class DrawerState {}

class DrawerInitState extends DrawerState {}

class DrawerLogoutState extends DrawerState {
  final bool logged;

  DrawerLogoutState({required this.logged});
}

class LoadingState extends DrawerState {}

class GetErrorState extends DrawerState {}

class GetSucessState extends DrawerState {}

class DrawerCashierIsOpenState extends DrawerState {
  final bool open;
  DrawerCashierIsOpenState({required this.open});
}
