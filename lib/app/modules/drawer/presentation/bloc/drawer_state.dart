abstract class DrawerState {}

class DrawerInitState extends DrawerState {}

class DrawerLogoutState extends DrawerState {
  final bool logged;

  DrawerLogoutState({required this.logged});
}
